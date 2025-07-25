<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FADOC_Pending_auth, App_Web_upeq32zu" title="FA Doc Pending for Auth" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>

            <script type="text/javascript">
            </script>
            <div class="tab-pane fade in active show" id="tab1">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel" Text="Transaction pending For Approval">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlAppProcessRpt" runat="server" GroupingText="Common Report Screen" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                            >
                                        </cc1:ComboBox>
                                     <%--   <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvActivity" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="ddlActivity" SetFocusOnError="True" ErrorMessage="Select Activity"
                                                Display="Dynamic" InitialValue="--Select--">
                                            </asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblActivity" CssClass="styleDisplayLabel" Text="Activity"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                          >
                                        </cc1:ComboBox>
                                      <%--  <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLocation" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="ddlLocation" SetFocusOnError="True" ErrorMessage="Select Location"
                                                Display="Dynamic" InitialValue="--Select--">
                                            </asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblLocation" CssClass="styleDisplayLabel" Text="Location"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvStartDateSearch" runat="server">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" ValidationGroup="GO" autocomplete="off"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                            <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
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
                                            <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvEndDateSearch" runat="server">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDateSearch" runat="server" ValidationGroup="GO"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgEndDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                            <%-- OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
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
                                            <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divProgramName" runat="server">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlProgramName" runat="server" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Program Name" runat="server" ID="Label13" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSearch" onclick="if(fnCheckPageValidators('GO',false))" onserverclick="btnSearch_Click" validationgroup="GO" runat="server"
                        type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="ImgBtnExcel" onserverclick="ImgBtnExcel_Click"
                        runat="server" 
                        type="button" causesvalidation="false" accesskey="A" title="Excel,Alt+A">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i></i>&emsp;<u>E</u>xcel
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L" title="Clear, Alt+L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView ID="gvTranslander" runat="server" AutoGenerateColumns="False" Width="100%"
                                OnRowDataBound="gvTranslander_RowDataBound" CssClass="styleInfoLabel" ShowFooter="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="Document Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocument_Type" runat="server" Text='<%# Bind("Document_Type") %>' ToolTip="Account Code"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Document No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocument_No" runat="server" Text='<%# Bind("Document_No") %>' ToolTip="Account Description"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Document Date" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocument_Date" runat="server" Text='<%# Bind("Document_Date") %>' ToolTip="Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right"/>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Document Amount" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAMOUNT" runat="server" Text='<%# Bind("AMOUNT") %>' ToolTip="Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Activity" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblActivity" runat="server" Text='<%# Bind("Activity") %>' ToolTip="Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Branch" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Branch") %>' ToolTip="Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created By" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreated_By" runat="server" Text='<%# Bind("Created_By") %>' ToolTip="Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Right" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' ToolTip="Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left"/>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <uc1:pagenavigator id="ucCustomPaging" runat="server"></uc1:pagenavigator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ValidationGroup="GO" ID="vsTransLander" runat="server" Visible="false" Enabled="false"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImgBtnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
