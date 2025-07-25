<%@ page language="C#" autoeventwireup="true" inherits="S3GClnManualBucketClassification, App_Web_zgoknvek" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Manual Bucket Classification"></asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="validation_msg_box">
                                    <%--<asp:RequiredFieldValidator ID="RFVddlChangeCategory" runat="server" Display="Dynamic"
                                        ControlToValidate="ddlChangeCategory" ValidationGroup="btnSave" InitialValue="0"
                                        ErrorMessage="Select a Category from the list" CssClass="validation_msg_box_sapn"
                                        SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>--%>
                                </div>
                                <%--<div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlDemandMonth" runat="server"
                                        ControlToValidate="ddlDemandMonth" ValidationGroup="btnGo" InitialValue="0"
                                        ErrorMessage="Select Demand Month" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                        SetFocusOnError="True" Enabled="true"></asp:RequiredFieldValidator>
                                </div>--%>
                                <div class="validation_msg_box">
                                    <%-- <asp:RequiredFieldValidator ID="RFVddlDebtCollector1" runat="server" Display="Dynamic"
                                        ControlToValidate="ddlDebtCollector" ValidationGroup="btnGo" InitialValue="0"
                                        ErrorMessage="Select a Debt Collector from the list" CssClass="validation_msg_box_sapn"
                                        SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="validation_msg_box">
                                    <%--<asp:RequiredFieldValidator ID="RFVddlChangeCategory1" runat="server" Display="Dynamic"
                                        ControlToValidate="ddlChangeCategory" ValidationGroup="btnSave" InitialValue="0"
                                        ErrorMessage="Select a Category from the list" CssClass="validation_msg_box_sapn"
                                        SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="ChangetoPanel" runat="server" GroupingText="Filter Criteria" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:RadioButtonList ID="rdnlChangeType" runat="server" RepeatDirection="Horizontal"
                                                OnSelectedIndexChanged="rdnlChangeType_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="Debt Collector" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Category" Value="1"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="Panel123" runat="server" CssClass="stylePanel">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlLineofBusiness" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged"
                                                                class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtTransferDate" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true">
                                                            </asp:TextBox>
                                                            <asp:Image ID="imgTransferDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                ToolTip="Transfer Date" Visible="false" />
                                                            <cc1:CalendarExtender ID="ceTransferDate" runat="server" PopupButtonID="imgTransferDate" 
                                                                TargetControlID="txtTransferDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"></cc1:CalendarExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTransferDate" Display="Dynamic" ErrorMessage="Enter Transfer Date"
                                                                    CssClass="validation_msg_box_sapn" ValidationGroup="btnGo" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTransferDate" Display="Dynamic" ErrorMessage="Enter Transfer Date"
                                                                    CssClass="validation_msg_box_sapn" ValidationGroup="btnSave" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblTransferDate" runat="server" Text="Transfer Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <uc:Suggest ID="ddlBranch" ToolTip="Branch" runat="server" AutoPostBack="True"
                                                                OnItem_Selected="ddlBranch_SelectedIndexChanged" ServiceMethod="GetBranchList"
                                                                WatermarkText="--Select--" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblBranch" runat="server" Text="Branch"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlcategory" runat="server"
                                                                OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged" AutoPostBack="true"
                                                                class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblfiltercategory" runat="server" Text="Account Status"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblLOB" runat="server" Text="Line of Business" Visible="false"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlDemandMonth" runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlDemandMonth_SelectedIndexChanged"
                                                                class="md-form-control form-control">
                                                            </asp:DropDownList>

                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                                    ControlToValidate="ddlDemandMonth" ValidationGroup="btnGo" InitialValue="0"
                                                                    ErrorMessage="Select Demand Month" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                    SetFocusOnError="True" Enabled="true"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                                    ControlToValidate="ddlDemandMonth" ValidationGroup="btnSave" InitialValue="0"
                                                                    ErrorMessage="Select Demand Month" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                    SetFocusOnError="True" Enabled="true"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblDemandMonth" runat="server" CssClass="styleReqFieldLabel" Text="Demand Month"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">

                                                            <asp:DropDownList ID="ddlDebtCollectorFrom" Width="100%" runat="server" Enabled="false" OnSelectedIndexChanged="ddlDebtCollectorFrom_SelectedIndexChanged"
                                                                class="md-form-control form-control">
                                                            </asp:DropDownList>

                                                            <%-- <uc:Suggest ID="ddlDebtCollectorFrom" ToolTip="Debt Collector" runat="server" AutoPostBack="True"
                                                                OnItem_Selected="ddlDebtCollector_SelectedIndexChanged" ServiceMethod="GetUserList"
                                                                WatermarkText="--Select--" />--%>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblDebtCollector" runat="server" Text="Debt Collector"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtStartDate" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true">
                                                            </asp:TextBox>
                                                            <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                ToolTip="Start Date" Visible="false" />
                                                            <cc1:CalendarExtender ID="ceStartDate" runat="server" PopupButtonID="imgStartDate" 
                                                                TargetControlID="txtStartDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"></cc1:CalendarExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate" Display="Dynamic" ErrorMessage="Enter Start Date"
                                                                    ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvStartDateSave" runat="server" ControlToValidate="txtStartDate" Display="Dynamic" ErrorMessage="Enter Start Date"
                                                                    ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblStartDate" runat="server" Text="Start Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEndDate" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true">
                                                            </asp:TextBox>
                                                            <asp:Image ID="imgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                ToolTip="End Date" Visible="false" />
                                                            <cc1:CalendarExtender ID="ceEndDate" runat="server" PopupButtonID="imgEndDate" OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtEndDate"></cc1:CalendarExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate" Display="Dynamic" ErrorMessage="Enter End Date"
                                                                    CssClass="validation_msg_box_sapn" ValidationGroup="btnGo"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvEndDateSave" runat="server" ControlToValidate="txtEndDate" Display="Dynamic" ErrorMessage="Enter End Date"
                                                                    CssClass="validation_msg_box_sapn" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEndDate" runat="server" Text="End Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">

                                                            <asp:DropDownList ID="ddlSupervisor" Width="100%" runat="server" OnSelectedIndexChanged="ddlDebtCollectorFrom_SelectedIndexChanged"
                                                                class="md-form-control form-control">
                                                            </asp:DropDownList>

                                                            <%-- <uc:Suggest ID="ddlSupervisor" ToolTip="Supervisor" runat="server" AutoPostBack="True"
                                                                OnItem_Selected="ddlBranch_SelectedIndexChanged" ServiceMethod="GetBranchList"
                                                                WatermarkText="--Select--" />--%>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblSupervisor" runat="server" Text="Supervisor"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <uc:Suggest ID="ddlAccount" ToolTip="Account" runat="server" AutoPostBack="True"
                                                                OnItem_Selected="ddlAccount_SelectedIndexChanged" ServiceMethod="GetAC_NO"
                                                                WatermarkText="--Select--" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAccount" runat="server" Text="Account"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div align="right">
                                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                    </button>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="Panel1" runat="server" GroupingText="Debt collector Information" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">

                                                <asp:DropDownList ID="ddlSupervisorTo" Width="100%" runat="server" OnSelectedIndexChanged="ddlSupervisorTo_SelectedIndexChanged"
                                                    class="md-form-control form-control" AutoPostBack="true">
                                                </asp:DropDownList>

                                                <%-- <uc:Suggest ID="ddlSupervisorFrom" ToolTip="Supervisor" runat="server" AutoPostBack="True"
                                                    OnItem_Selected="ddlBranch_SelectedIndexChanged" ServiceMethod="GetUserList"
                                                    WatermarkText="--Select--" />--%>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblSupervisorFrom" runat="server" Text="Supervisor"></asp:Label>
                                                </label>
                                            </div>
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlChangeCategory" runat="server" Enabled="false" Visible="false"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlChangeCategory_SelectedIndexChanged"
                                                    class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVddlChangeCategory1" runat="server" Display="Dynamic"
                                                        ControlToValidate="ddlChangeCategory" ValidationGroup="btnGo" InitialValue="0"
                                                        ErrorMessage="Select a Account Status from the list" CssClass="validation_msg_box_sapn"
                                                        SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblChangetocategory" runat="server" Text="Change To Category" Enabled="false"
                                                        Visible="false"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlDebtCollector" Width="100%" runat="server" Enabled="false" OnSelectedIndexChanged="ddlDebtCollector_SelectedIndexChanged"
                                                    class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlDebtCollector" Display="Dynamic" ErrorMessage="Select Change To Debt Collector"
                                                        InitialValue="0" CssClass="validation_msg_box_sapn" ValidationGroup="btnSave" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblDebtcollectorlist" runat="server" Text="Change To Debt Collector" CssClass="styleReqFieldLabel"
                                                        Enabled="false"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row">
                            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCurrentDebtCollector" runat="server" ReadOnly="true"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDebitCollector" runat="server" Text="Debt Collector" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:UpdatePanel ID="UpdatePanel_ManualBucketgrid" runat="server" Visible="false">
                                    <ContentTemplate>

                                        <asp:Panel Width="99%" ID="ManualBucketgridPanelModify" Style="height: inherit;"
                                            runat="server" GroupingText="Contract Dues Information" CssClass="stylePanel">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-9 col-sm-9 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:Label ID="lblReordsCount" runat="server" CssClass="styleDisplayLabel" Font-Bold="true" Text="Records Selected :"></asp:Label>
                                                        <asp:Label ID="lblReordsCountValue" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <div runat="server" id="divgvbucketclassification" style="max-height: 205px; overflow-x: hidden; overflow: auto;">
                                                            <asp:GridView ID="gvbucketclassificationDebtcollector" runat="server" AutoGenerateColumns="false"
                                                                OnRowDataBound="gvbucketclassification_RowDataBound" ShowFooter="false" Width="98%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Due Serial No" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Serial_Number" Text='<%# Bind("Due_Serial_Number") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%--<ItemStyle Width="5%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLocation" Text='<%# Bind("Location") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPANum" Text='<%# Bind("PANum") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%--<ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Debt Collector" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSANum" Text='<%# Bind("Name") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Due Date" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Date" Text='<%# Bind("Due_Date") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Cashflow Flag" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Flag" Text='<%# Bind("Due_Flag") %>' runat="server"></asp:Label>
                                                                            <asp:Label ID="lblDue_Flag_ID" Visible="false" Text='<%# Bind("Due_Flag_ID") %>'
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Amount" Text='<%# Bind("Due_Amount") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <%-- <asp:TemplateField HeaderText="Current Installment Due" ItemStyle-HorizontalAlign="Right">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Label ID="lblCurrent_Installment_Due" Text='<%# Bind("Current_Installment_Due") %>'
                                                                                                                runat="server"></asp:Label>
                                                                                                        </ItemTemplate> <%--<ItemStyle Width="10%" />
                                                                                                    </asp:TemplateField>
                                                                                                    <asp:TemplateField HeaderText="Arrear Installment Due" ItemStyle-HorizontalAlign="Right">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Label ID="lblArrear_Installment_Due" Text='<%# Bind("Arrear_Installment_Due") %>'
                                                                                                                runat="server"></asp:Label>
                                                                                                        </ItemTemplate>
                                                                                                      
                                                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="Collection" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCollection" Text='<%# Bind("Collection") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Category" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCategory_Type_Code" Text='<%# Bind("Category_Type_Code") %>' Visible="false"
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblCategory_Type" Text='<%# Bind("Category_Type") %>' Visible="false"
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblCategory" Text='<%# Bind("Category") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%-- <ItemStyle Width="5%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                        <HeaderTemplate>
                                                                            <asp:CheckBox ID="ChkSelectAll" Text="Select All" OnClick="selectAll(this)" runat="server" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkselect" runat="server" />
                                                                            <asp:Label ID="lblDemand_Process_ID" Visible="false" Text='<%# Bind("Demand_Process_ID") %>'
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblDue_Link_Key" Visible="false" Text='<%# Bind("Due_Link_Key") %>'
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%--<ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <div runat="server" id="div1" style="max-height: 205px; overflow-x: hidden; overflow: auto;">
                                                            <asp:GridView ID="gvbucketclassificationCategory" runat="server" AutoGenerateColumns="false"
                                                                ShowFooter="false" Width="98%" OnRowDataBound="gvbucketclassificationCategory_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkAddress" runat="server" CausesValidation="false" OnClick="lnkAddress_Click" ToolTip="Customer Details" CssClass="grid_btn_link" Text='<%#Eval("Customer_Name")%>'></asp:LinkButton>
                                                                            <%--<asp:Label ID="lblCustomer_Name" Text='<%# Bind("Customer_Name") %>' runat="server"></asp:Label>--%>
                                                                            <asp:Label ID="lblCustomer_ID" Text='<%# Bind("Customer_ID") %>' runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%--<ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLocation" Text='<%# Bind("Location") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPANum" Text='<%# Bind("PANum") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%--<ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Debt Collector Name" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSANum" Text='<%# Bind("Name") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Amount" Text='<%# Bind("Due_Amount") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Collection" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCollection" Text='<%# Bind("Collection") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%-- <ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Category" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCategory_Type_Code" Text='<%# Bind("Category_Type_Code") %>' Visible="false"
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblCategory_Type" Text='<%# Bind("Category_Type") %>' Visible="false"
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblCategory" Text='<%# Bind("Category") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <%-- <ItemStyle Width="5%" />--%>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                        <HeaderTemplate>
                                                                            <asp:CheckBox ID="ChkSelectAll" Text="Select All" runat="server" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkselect" runat="server" />
                                                                            <asp:Label ID="lblDemand_Process_ID" Visible="false" Text='<%# Bind("Demand_Process_ID") %>'
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <%--<ItemStyle Width="10%" />--%>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>


                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="imgCustAddress" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>

                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel Width="100%" ID="ManualBucketgridPanelQuery" runat="server" GroupingText="Transfer Dues Informations"
                                                CssClass="stylePanel" Style="max-height: 205px; overflow-x: hidden; overflow: auto;"
                                                class="container">
                                                <table>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:RadioButtonList ID="rbltype" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbltype_SelectedIndexChanged"
                                                                AutoPostBack="true">
                                                                <asp:ListItem Text="Debt Collector Reassigned" Value="0" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Category Reassigned" Value="1"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td>&nbsp;
                                                        </td>
                                                        <td>&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvbucketclassificationQuery" runat="server" AutoGenerateColumns="false"
                                                                OnRowDataBound="gvbucketclassificationQuery_RowDataBound" ShowFooter="false"
                                                                Width="98%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Due Serial Number" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Serial_Number" Text='<%# Bind("Due_Serial_Number") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPANum" Text='<%# Bind("PANum") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Sub Account Number" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSANum" Text='<%# Bind("SANum") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="From Debtcollector " ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFrom_Debtcollector" Text='<%# Bind("From_DebtCollector_Code") %>'
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="To Debtcollector " ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTo_Debtcollector" Text='<%# Bind("To_Debtcollector_Code") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Demand Month" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDemand_Month" Text='<%# Bind("Demand_Month") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Cashflow Flag" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Flag" Text='<%# Bind("Due_Flag") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Due Date" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Date" Text='<%# Bind("Due_Date") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDue_Amount" Text='<%# Bind("Due_Amount") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="From Category" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFrom_Category_Type_Code" Text='<%# Bind("Category_Type_Code") %>'
                                                                                Visible="false" runat="server"></asp:Label>
                                                                            <asp:Label ID="lblFrom_Category_Type" Text='<%# Bind("From_Cateogory_Code") %>' Visible="false"
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblFrom_Category" Text='<%# Bind("From_Category") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="To Category" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTo_Category_Type_Code" Text='<%# Bind("Category_Type_Code") %>'
                                                                                Visible="false" runat="server"></asp:Label>
                                                                            <asp:Label ID="lblTo_Category_Type" Text='<%# Bind("To_Cateogroy_Code") %>' Visible="false"
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblTo_Category" Text='<%# Bind("To_Category") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Current Category" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCurrent_Category" Text='<%# Bind("CurrentCategory") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Transfer Date" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTransfer_Date" Text='<%# Bind("Transfer_Date") %>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Demand Process" ItemStyle-HorizontalAlign="Center"
                                                                        Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDemand_Process_ID" Visible="false" Text='<%# Bind("Demand_Process_ID") %>'
                                                                                runat="server"></asp:Label>
                                                                            <asp:Label ID="lblDue_Link_Key" Visible="false" Text='<%# Bind("Due_Link_Key") %>'
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div align="right">
                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                type="button" accesskey="S" validationgroup="btnSave">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                            </button>

                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:CustomValidator ID="CVBucketClassification" runat="server" Display="None" ValidationGroup="btnSave"></asp:CustomValidator>
                            </div>
                        </div>

                        <asp:Label ID="lblCustAddress" runat="server" Style="display: none;"></asp:Label>
                        <cc1:ModalPopupExtender ID="mpeCustAddress" runat="server" PopupControlID="dvCustAddress" TargetControlID="lblCustAddress"
                            BackgroundCssClass="modalBackground" Enabled="true" />
                        <div runat="server" id="dvCustAddress" style="display: none; width: 50%; height: 50%;">
                            <div id="Div5" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
                                <asp:ImageButton ID="imgCustAddress" runat="server" Width="50px" CausesValidation="false" ToolTip=" Close,Alt+I" AccessKey="I" Height="50px" ImageUrl="~/Images/close.png"
                                    OnClick="imgCustAddress_Click" />
                            </div>
                            <div>
                                <asp:Panel ID="Panel2" GroupingText="Address Details" CssClass="stylePanel" runat="server"
                                    BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <div class="container" style="height: 250px;">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAddress" runat="server" ReadOnly="true" Enabled="false" Width="250px" Height="150px" MaxLength="250" class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine"
                                                                onkeyup="maxlengthfortxt(250);"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <label>
                                                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <tr>
                                                <td colspan="2"></td>
                                            </tr>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </div>
                        </div>
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row" style="display:none">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                    HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel"
                    HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnGo" />
            </div>
        </div>

        <script language="javascript" type="text/javascript">

            function Trim(strInput) {
                var FieldValue = document.getElementById(strInput).value;
                document.getElementById(strInput).value = FieldValue.trim();
            }

            function fnDGSelectOrUnselectAll_New(grdid, obj, objlist) {
                if (obj.checked)
                    fnDGSelectAll_New(grdid, objlist)
                else
                    fnDGUnselectAll_New(grdid, objlist)
            }

            function fnDGSelectAll_New(grdid, objid) {
                
                var chkbox;
                var i = 2;

                var SelectedRec = 0;

                var gridId = grdid;

                chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);

                while (chkbox != null) {
                    if (chkbox.disabled == false) {
                        chkbox.checked = true;
                        SelectedRec = SelectedRec + 1;
                    }
                    i = i + 1;
                    if (i <= 9) {
                        chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);
                    }
                    else
                        chkbox = document.getElementById(gridId + '_ctl' + i + '_' + objid);
                }
                document.getElementById('ctl00_ContentPlaceHolder1_lblReordsCountValue').innerText = SelectedRec;
            }

            function fnDGUnselectAll_New(grdid, objid) {
                
                var chkbox;
                var chkStatus = false;
                var i = 2;

                var gridId = grdid;
                chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);

                while (chkbox != null) {
                    
                    if (chkbox.disabled == false)
                        chkbox.checked = false;
                    i = i + 1;
                    if (i <= 9) {
                        chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);
                    }
                    else
                        chkbox = document.getElementById(gridId + '_ctl' + i + '_' + objid);
                }
                document.getElementById('ctl00_ContentPlaceHolder1_lblReordsCountValue').innerText = 0;
            }

            function fnGridUnSelect_New(grdid, chkAll, objid) {

                var chkbox;
                var chkStatus = true;
                var i = 2;

                var SelectedRec = 0;
        
                chkbox = document.getElementById(grdid + '_ctl0' + i + '_' + objid);

                while (chkbox != null) {

                    if (chkbox.checked) {
                        SelectedRec = SelectedRec + 1;
                    }
                    
                    i = i + 1;
                   
                    if (i <= 9) {
                        chkbox = document.getElementById(grdid + '_ctl0' + i + '_' + objid);
                    }
                    else
                        chkbox = document.getElementById(grdid + '_ctl' + i + '_' + objid);
                }
                document.getElementById('ctl00_ContentPlaceHolder1_lblReordsCountValue').innerText = SelectedRec;

                i = 2;
                chkbox = document.getElementById(grdid + '_ctl0' + i + '_' + objid);

                while (chkbox != null) {
                    if (!chkbox.checked) {
                        chkStatus = false;
                        break;
                    }
                    i = i + 1;
                    if (i <= 9) {
                        chkbox = document.getElementById(grdid + '_ctl0' + i + '_' + objid);
                    }
                    else
                        chkbox = document.getElementById(grdid + '_ctl' + i + '_' + objid);
                }
                if (chkStatus)
                    document.getElementById(grdid + '_ctl01_' + chkAll).checked = true;
                    
                else
                    document.getElementById(grdid + '_ctl01_' + chkAll).checked = false;
            }


            function CheckbokUnSelect() {

                if (confirm('Are you sure want to clear?')) {
                    var Count = 0;
                    var TargetBaseControlCategory = document.getElementById('<%= this.gvbucketclassificationCategory.ClientID %>');
                    var TargetBaseControlDebtcollector = document.getElementById('<%= this.gvbucketclassificationDebtcollector.ClientID %>');
                    // var TargetChildControl = chilId;
                    if (TargetBaseControlCategory != null) {
                        //Get all the control of the type INPUT in the base control.
                        var Inputs = TargetBaseControlCategory.getElementsByTagName("input");

                        //Checked/Unchecked all the checkBoxes in side the GridView.
                        for (var n = 0; n < Inputs.length; ++n) {
                            if (Inputs[n].type == 'checkbox') {
                                if (Inputs[n].checked) {
                                    Inputs[n].checked = false;
                                }
                            }
                        }
                    }
                    if (TargetBaseControlDebtcollector != null) {
                        //Get all the control of the type INPUT in the base control.
                        var Inputs1 = TargetBaseControlDebtcollector.getElementsByTagName("input");

                        //Checked/Unchecked all the checkBoxes in side the GridView.
                        for (var n1 = 0; n1 < Inputs1.length; ++n1) {
                            if (Inputs1[n1].type == 'checkbox') {
                                if (Inputs1[n1].checked) {
                                    Inputs1[n1].checked = false;
                                }
                            }
                        }
                    }
                }


            }



        </script>
    </div>
</asp:Content>
