<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_Report_S3G_CUST_GUAR_AGE_RPT, App_Web_kuvvdsjx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>

<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>

            <script type="text/javascript">
            </script>
            <div class="tab-pane fade in active show" id="tab1">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlAppProcessRpt" runat="server" GroupingText="Customer Guarantor Details" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLOB">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" ToolTip="Line of Business" AutoPostBack="true"
                                                OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged" ValidationGroup="GO" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="GO" ErrorMessage="Select LOB"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxLOBSearch"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLocation">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ComboBoxBranchSearch" runat="server" ToolTip="Branch" AutoPostBack="true"  
                                                OnSelectedIndexChanged="ComboBoxBranchSearch_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                          <%--  <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="GO" ErrorMessage="Select Branch"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxBranchSearch"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="divFinYear">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFinYear" runat="server" ToolTip="Branch"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVFinYear" ValidationGroup="GO" ErrorMessage="Select Financial year"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlFinYear"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label Text="Financial Year" runat="server" ID="lblFinYear" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvStartDateSearch" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDateSearch" runat="server" ValidationGroup="GO" autocomplete="off"
                                                OnTextChanged="txtStartDateSearch_TextChanged" AutoPostBack="True"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgStartDateSearch" runat="server"
                                                ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Start Date" Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvEndDateSearch" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDateSearch" runat="server" ValidationGroup="GO"
                                                OnTextChanged="txtEndDateSearch_TextChanged" AutoPostBack="True"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgEndDateSearch" runat="server"
                                                ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter the End Date"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divAccountStatus" runat="server">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlAccountStatus" runat="server" ToolTip="Case Status" class="md-form-control form-control">
                                                <asp:ListItem Text="---- All ----" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Live" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Closed" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Write Off" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Deliquent" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label Text="Account Status" runat="server" ID="lblAccStatus" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divGreaterCustomerAge" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtGreaterCustomerAge" runat="server" MaxLength="2" ToolTip="Customer Age Greater than"
                                                OnTextChanged="txtGreaterCustomerAge_TextChanged" AutoPostBack="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftbeGreaterCustomerAge" runat="server" TargetControlID="txtGreaterCustomerAge"
                                                FilterType="Numbers" ValidChars="" Enabled="true">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblGreaterAge" runat="server" CssClass="styleDisplayLabel" Text="Age  >  "></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divLesserCustomerAge" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtLesserCustomerAge" runat="server" MaxLength="2" ToolTip="Customer Age Less than"
                                                OnTextChanged="txtLesserCustomerAge_TextChanged" AutoPostBack="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftbeLesserCustomerAge" runat="server" TargetControlID="txtLesserCustomerAge"
                                                FilterType="Numbers" ValidChars="" Enabled="true">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLesserAge" runat="server" CssClass="styleDisplayLabel" Text="Age  <  "></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divGuarantor" runat="server">
                                        <div class="md-input">
                                            <asp:CheckBox runat="server" ID="chkWithGuarantor" OnCheckedChanged="chkWithGuarantor_CheckedChanged" AutoPostBack="true" Checked="true" />
                                            <asp:Label ID="lblWithGuarantor" runat="server" CssClass="styleDisplayLabel" Text="With Guarantor"></asp:Label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox runat="server" ID="chkWithoutGuarantor" OnCheckedChanged="chkWithoutGuarantor_CheckedChanged" AutoPostBack="true" />
                                            <asp:Label ID="lblWithoutGuarantor" runat="server" CssClass="styleDisplayLabel" Text="Without Guarantor"></asp:Label>

                                        </div>
                                    </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button class="css_btn_enabled" id="btnSearch" 
                            onserverclick="btnSearch_ServerClick" validationgroup="GO" runat="server"
                            type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="ImgBtnExcel" onserverclick="ImgBtnExcel_ServerClick"
                            runat="server" visible="false"
                            type="button" causesvalidation="false" accesskey="A" title="Excel,Alt+A">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i></i>&emsp;<u>E</u>xcel
                        </button>

                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_ServerClick" causesvalidation="false" runat="server"
                            type="button" accesskey="L" title="Clear, Alt+L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <%--onclick="if(fnConfirmClear())"--%>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:Panel ID="pnlReport" runat="server" Width="100%" CssClass="stylePanel">
                                <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                                    HeaderStyle-CssClass="styleGridHeader" class="gird_details" EmptyDataText="No Records found"
                                    RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound">
                                </asp:GridView>
                                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                            </asp:Panel>
                        </div>
                    </div>
            </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ValidationGroup="GO" ID="vsTransLander" runat="server" Visible="false" Enabled="false"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                    </div>
                </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImgBtnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
