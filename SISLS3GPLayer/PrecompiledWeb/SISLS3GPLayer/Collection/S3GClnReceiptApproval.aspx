<%@ page language="C#" autoeventwireup="true" title="S3G - Receipt Approval" inherits="Collection_S3GClnReceiptApproval, App_Web_3jwyxbhk" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function FunResetGrid() {
            if (document.getElementById('<%=gvReceiptDetails.ClientID %>') != null) {
                document.getElementById('<%=gvReceiptDetails.ClientID %>').innerText = null;
            }
            document.getElementById('<%=pnlReceiptDetails.ClientID %>').style.display = 'none';
        }
    </script>

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Receipt Authorization">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div runat="server" style="border-width: 1px; border-color: ButtonShadow; border-style: solid; margin-bottom: 10px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel GroupingText="Receipt Details" ID="pnlReceipt" runat="server" CssClass="stylePanel">
                            <div runat="server" style="margin-top: 10px; margin-bottom: 10px;">
                                <asp:UpdatePanel ID="upReceipt" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:RadioButtonList ID="rblReceiptType" runat="server" AutoPostBack="True"
                                                        DataTextField="Type_Code" DataValueField="Type_ID"
                                                        onclick="FunResetGrid()" RepeatColumns="3" RepeatDirection="Horizontal"
                                                        OnSelectedIndexChanged="rblReceiptType_SelectedIndexChanged"
                                                        CssClass="md-form-control form-control radio">
                                                    </asp:RadioButtonList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvReceiptType" runat="server"
                                                            ControlToValidate="rblReceiptType" Display="Dynamic"
                                                            ErrorMessage="Select the Receipt Type" InitialValue="" SetFocusOnError="true"
                                                            ValidationGroup="btnSearch" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblReceiptType" runat="server" Text="Receipt Type" ToolTip="Receipt Type"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddllLineOfBusiness" runat="server" AutoPostBack="true"
                                                        onchange="FunResetGrid()" class="md-form-control form-control"
                                                        OnSelectedIndexChanged="ddllLineOfBusiness_SelectedIndexChanged">
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
                                                    <asp:TextBox ID="txtStartDate" runat="server" ValidationGroup="btnSearch"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgStartDateSearch" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender ID="ceStartDate" runat="server" Enabled="True"
                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                        PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDate">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblStartDate" runat="server" Text="Start Date" ToolTip="Start Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="false"
                                                        onchange="return FunResetGrid()" class="md-form-control form-control"
                                                        OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblBranch" runat="server" Text="Branch"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtEndDate" runat="server" AutoPostBack="True"
                                                        ValidationGroup="btnSearch"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgEndDateSearch" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender ID="ceEndDate" runat="server" Enabled="True"
                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                        PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDate">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblEndDate" runat="server" Text="End Date" ToolTip="End Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div align="right">
                                            <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server" validationgroup="btnSearch"
                                                type="button" accesskey="S" title="Search, Alt+S">
                                                <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                                            </button>
                                            <button class="css_btn_enabled" id="btnAuthorization" onserverclick="btnAuthorization_Click" runat="server" validationgroup="btnAuthorization"
                                                type="button" accesskey="A" title="Authorize, Alt+A" visible="false">
                                                <i class="fa fa-check" aria-hidden="true"></i>&emsp;<u>A</u>uthorize
                                            </button>
                                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                                type="button" accesskey="X">
                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                            </button>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlReceiptDetails" runat="server" Style="display: none;">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvReceiptDetails" runat="server" AutoGenerateColumns="false"
                                                                    OnRowDataBound="gvReceiptDetails_RowDataBound" ShowHeader="true" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceiptID" runat="server" Text='<%# Bind("Receipt_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblReceiptNo" runat="server" Text='<%# Bind("Receipt_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Receipt_No" HeaderText="Receipt Number"
                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                        <asp:TemplateField HeaderText="Receipt Date">
                                                                            <ItemTemplate>
                                                                                <%# FormatDate(Eval("Receipt_Date").ToString())%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Customer_Name" HeaderText="Customer Name"
                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                        <asp:TemplateField HeaderText="Receipt Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceiptAmount" runat="server" Style="text-align: right;"
                                                                                    Text='<%# Eval("Total_Receipt_Amount") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="22%" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Status" HeaderText="Status"
                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                        <asp:TemplateField HeaderText="Select All" Visible="false">
                                                                            <HeaderTemplate>
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td align="center">Select All
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:CheckBox ID="cbxAll" runat="server" AutoPostBack="true"
                                                                                                OnCheckedChanged="cbxAll_OnCheckedChanged" ToolTip="Select All" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="cbxSelect" runat="server" AutoPostBack="true"
                                                                                    Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "BolStatus")))%> '
                                                                                    OnCheckedChanged="cbxSelect_OnCheckedChanged" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkView" runat="server"
                                                                                    CommandArgument='<%# Eval("Receipt_ID") %>'
                                                                                    CommandName='<%# Eval("Entity_Type") %>' OnClick="lnkView_Click" Text="View"
                                                                                    ToolTip='<%# Eval("Receipt_No") %>'>
                                                                                </asp:LinkButton>
                                                                                <asp:HiddenField ID="hdnReceiptType" runat="server"
                                                                                    Value='<%# Eval("Entity_Type") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--<asp:TemplateField Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRowNumber" runat="server" Text='<%# Eval("RowNumber") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                 <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                   
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="gvReceiptDetails" />

                                        <asp:AsyncPostBackTrigger ControlID="ddllLineOfBusiness"
                                            EventName="SelectedIndexChanged" />

                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsReceipt" runat="server" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):" ValidationGroup="btnSearch"
                        ShowSummary="true" />
                    <asp:CustomValidator ID="cvReceipt" runat="server">
                    </asp:CustomValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Button ID="BtnHide" runat="server" Style="display: none;" />
                    <cc1:ModalPopupExtender ID="MPE" runat="server" TargetControlID="BtnHide" PopupControlID="pnlPopUpReceiptDetails"
                        BackgroundCssClass="styleModalBackground" DropShadow="false" CancelControlID="btnClose" />
                    <asp:Panel ID="pnlPopUpReceiptDetails" GroupingText="Receipt Details" Width="75%"
                        CssClass="stylePanel" Height="100%" runat="server" Style="display: none; overflow: hidden;"
                        BackColor="White" BorderColor="WhiteSmoke" ScrollBars="Vertical">
                        <cc1:TabContainer runat="server" ID="tcReceipt" Width="100%" CssClass="styleTabPanel"
                            ScrollBars="None">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <cc1:TabPanel ID="tpGeneral" runat="server">
                                        <HeaderTemplate>
                                            General
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlReceiptInfo" GroupingText="Receipt Information" runat="server"
                                                        CssClass="stylePanel">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpLob" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblLob" runat="server" Text="Line of Business"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpBranch" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblbranch1" runat="server" Text="Location"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpDocNo" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblDocNo" runat="server" Text="Doc No"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpDocDate" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblDocDate" runat="server" Text="Doc Date"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpValueDate" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblValueDate" runat="server" Text="Value Date"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtpMode" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblMode" runat="server" Text="Mode"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpTRRef" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblTRRef" runat="server" Text="TR Ref"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpReceiptAmount" runat="server" ReadOnly="True"
                                                                        Style="text-align: right;"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblReceiptAmount" runat="server" Text="Receipt Amount"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpAuthorizedBy" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblAuthorizedBy" runat="server" Text="Authorized By"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblpAuthorizedDate" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblAuthorizedDate" runat="server" Text="Authorized Date"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel GroupingText="Customer Information" ID="pnlCustomerinformation"
                                                        runat="server" CssClass="stylePanel">
                                                        <uc1:S3GCustomerAddress ID="S3GCustomerPermAddress0" runat="server" FirstColumnStyle="styleFieldLabel"
                                                            SecondColumnStyle="styleFieldAlign" ActiveViewIndex="1" />
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel runat="server" ID="pnlAccount" CssClass="stylePanel" GroupingText="Account Details">
                                                        <div style="height: 70px; overflow-x: auto; overflow-y: auto;">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <asp:GridView ID="gvReceiptDetailsView" runat="server" AutoGenerateColumns="False"
                                                                            HorizontalAlign="Center" Width="97%" OnRowDataBound="gvReceiptDetailsView_RowDataBound">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="PANum" HeaderText="Prime Account No">
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="SANum" HeaderText="Sub Account No">
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:BoundField>
                                                                                <asp:TemplateField HeaderText="Account Description">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAcDescription" Text='<%#Eval("CashFlowFlag_Desc") %>' runat="server"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="GL_Account" HeaderText="GLAccount">
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="SL_Account" HeaderText="SLAccount">
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:BoundField>
                                                                                <asp:TemplateField HeaderText="Amount">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="txtAmount" runat="server" Style="text-align: right;" Text='<%#Eval("Transaction_Amount") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                                    <asp:Panel runat="server" ID="pnlAddLess" CssClass="stylePanel" GroupingText="Add Less Details">
                                                        <div style="height: 70px; overflow-x: auto; overflow-y: auto;">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <asp:GridView ID="gvAddLess" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                                            Width="97%" HorizontalAlign="Center" OnRowDataBound="gvAddLess_RowDataBound">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="AddLess" HeaderText="Add or Less">
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="GL_Account" HeaderText="GL Account">
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="SL_Account" HeaderText="SL Account">
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:BoundField>
                                                                                <asp:TemplateField HeaderText="Amount">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>

                                                                            </Columns>
                                                                            <EmptyDataRowStyle BorderStyle="None" HorizontalAlign="Center" />
                                                                            <EmptyDataTemplate>
                                                                                No Records Found
                                                                            </EmptyDataTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <cc1:TabPanel ID="tpDraweebank" runat="server">
                                        <HeaderTemplate>
                                            Drawee Bank
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtInstrumentNo" runat="server" ReadOnly="true"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblInstrumentNo" runat="server" CssClass="styleDisplayLabel" Text="Instrument No"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPaymentGateway" runat="server" ReadOnly="true"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblpaymentGateway" runat="server" CssClass="styleReqdFieldLabel" Text="Payment Gateway Ref No"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtInstrumentDate" runat="server" ReadOnly="True"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblInstrumentDate" runat="server" CssClass="styleDisplayLabel" Text="Instrument Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtACKNo" runat="server" ReadOnly="true"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblACKNo" runat="server" CssClass="styleDisplayLabel" Text="ACK No"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtLocation" runat="server" ReadOnly="true"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblLocation" runat="server" CssClass="styleDisplayLabel" Text="Location"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDraweeBank" runat="server" ReadOnly="true"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDraweeBank" runat="server" CssClass="styleDisplayLabel" Text="Drawee Bank"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtOtherBankName" runat="server" ReadOnly="true" Visible="false"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </div>
                            </div>
                        </cc1:TabContainer>

                        <div align="right">
                            <button class="css_btn_enabled" id="btnAuthorize" onserverclick="btnAuthorize_Click" runat="server"
                                type="button" accesskey="A" title="Authorize, Alt+A">
                                <i class="fa fa-check" aria-hidden="true"></i>&emsp;<u>A</u>uthorize
                            </button>
                            <button class="css_btn_enabled" id="btnRevoke" onserverclick="btnRevoke_Click" runat="server"
                                type="button" accesskey="R" title="Search, Alt+R" enabled="false">
                                <i class="fa fa-window-close" aria-hidden="true"></i>&emsp;<u>R</u>evoke
                            </button>

                            <button class="css_btn_enabled" id="btnClose" runat="server"
                                type="button" accesskey="C" title="Search, Alt+C">
                                <i class="fa fa-window-close" aria-hidden="true"></i>&emsp;<u>C</u>lose
                            </button>
                        </div>


                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
