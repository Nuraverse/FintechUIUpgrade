<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_S3gRptEnquiryPerformance, App_Web_nmps0mjf" title="Enquiry Performance Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="ENQUIRY PERFORMANCE REPORT">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="Pnl1" runat="server" CssClass="stylePanel" Width="100%" GroupingText="Input Criteria">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddLOB" runat="server" ToolTip="Line of Business"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddLOB_SelectedIndexChanged"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RFVLOB" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddLOB" InitialValue="-1" ValidationGroup="Go"
                                            ErrorMessage="Select the Line of Business" Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="DDRegion" runat="server" ToolTip="Location1"
                                        AutoPostBack="True" OnSelectedIndexChanged="DDRegion_SelectedIndexChanged"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Location1" ID="lblregion"></asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Location2" Enabled="false"
                                        OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Location2" ID="lblBranch" AutoPostBack="True">
                                        </asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" ToolTip="Product"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblProduct" runat="server" Text="Product" CssClass="StyleReqFieldLabel">
                                        </asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtStartDate" runat="server" ToolTip="Start Date" AutoPostBack="true" OnTextChanged="txtStartDate_TextChanged"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtStartDate"
                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgStartDate"
                                        ID="CalendarExtender1">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Select Start Date"
                                            ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Start Date" ID="lblStartDate" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEndDate" runat="server" ToolTip="End Date" AutoPostBack="true" OnTextChanged="txtEndDate_TextChanged"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEndDate"
                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgEndDate"
                                        ID="CalendarExtender2">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Select End Date"
                                            ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEndDate"
                                            CssClass="validation_msg_box_sapn">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="End Date" ID="lblEndDate" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="DropDenomination" runat="server" ToolTip="Denomination" AutoPostBack="true"
                                        OnSelectedIndexChanged="DropDenomination_SelectedIndexChanged"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RFdeno" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="DropDenomination" InitialValue="0" ValidationGroup="Go"
                                            ErrorMessage="Select the Denomination" Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Denomination" ID="Lblden" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
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
                    <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel">
                    </asp:Label>

                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlEnquiry" runat="server" CssClass="stylePanel" GroupingText="Enquiry Details"
                        Width="100%" Visible="false">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="grvEnquirydetails" runat="server" AutoGenerateColumns="False"
                                        CssClass="gird_details" ShowFooter="True"
                                        Visible="False" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Location">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location"></asp:Label>
                                                    <asp:Label ID="lblBranchId" runat="server" Visible="false" Text='<%# Bind("LocationId") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <%--  <asp:TemplateField HeaderText="LocationID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchId" runat="server" Text='<%# Bind("LocationId") %>'></asp:Label>
                                   </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Left" />
                               
                                </asp:TemplateField>--%>

                                            <asp:TemplateField HeaderText="Product">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("Product") %>' ToolTip="Product"></asp:Label>
                                                    <asp:Label ID="lblProductId" runat="server" Visible="false" Text='<%# Bind("ProductId") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <FooterStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" ToolTip="Grand Total" Text="Grand Total"></asp:Label>
                                                </FooterTemplate>

                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="ProductId" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductId" runat="server" Text='<%# Bind("ProductId") %>'></asp:Label>
                                    </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Left" />
                                </asp:TemplateField>--%>

                                            <%-- <asp:TemplateField HeaderText="Received">
                        <HeaderTemplate>
                        <table width="100%" >
                          <tr>
                            <td colspan="2">
                                    Received
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" >
                                    Count
                                </td>
                                <td  width="30%">
                                    Value
                                </td>
                                
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width ="100%" >
                        <tr>
                    <td width="30%">
                        <asp:LinkButton ID="LnkBtnRC" runat="server" OnClick="ReceivedCountDetails" Text='<%# Bind("ReceivedCount") %>'></asp:LinkButton>
                        </td>
                        <td width="30%" >
                   <asp:Label ID="lblNoofAccounts4" runat="server" 
                                            Text='<%# Bind("ReceivedValue") %>'></asp:Label>
                        </td>
                   
                    </tr>
                    </table>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign ="Right" Width ="5%" />
                    <FooterStyle HorizontalAlign ="Right" Width ="5%" />
                                 <FooterTemplate>
                                  <table width ="100%" cellpadding="5%">
                                    <tr>
                                <td width="30%" colspan="2">
                                   <asp:LinkButton ID="LnkBtnRCAll" runat="server"  OnClick ="AllReceivedDetails"/>
                                   </td>
                                   <td width="30%">
                                     <asp:Label ID="lblRecVal" runat="server"></asp:Label>
                                   </td>
                                   </tr>
                                   </table>
                                </FooterTemplate>
                                </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Received Count">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LnkBtnRC" runat="server" OnClick="ReceivedCountDetails"
                                                        Text='<%# Bind("ReceivedCount") %>' ToolTip="Received Count"></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="LnkBtnRCAll" runat="server" ToolTip="Total Received Count" OnClick="AllReceivedDetails" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Received Value">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoofAccounts4" runat="server"
                                                        Text='<%# Bind("ReceivedValue") %>' ToolTip="Received Value"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblRecVal" runat="server" ToolTip="Total Received Value"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Successful Count">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LnkBtnSuC" runat="server" OnClick="SuccessfulCountDetails"
                                                        Text='<%# Bind("SuccessfulCount") %>' ToolTip="Successful Count"></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <%--Text='<%# Bind("SuccessfulCount") %>'--%>
                                                    <asp:LinkButton ID="LnkBtnSucAll" runat="server" ToolTip="Total Successful Count" OnClick="AllSuccessfulDetails">
                                                    </asp:LinkButton>
                                                    <%--     <asp:Label ID="lblSuccess" runat="server"></asp:Label>--%>
                                                </FooterTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Successful Value">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoofAccounts5" runat="server"
                                                        Text='<%# Bind("SuccessfulValue") %>' ToolTip="Successful Value"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblSuccessVal" runat="server" ToolTip="Total Successful Value"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Under Followup Count">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LnkBtnFuC" runat="server" OnClick="FollowupCountDetails" Text='<%# Bind("UnderFollowupCount") %>' ToolTip="Under FollowupCount"> 
                                        <%-- Text='<%# Bind("UnderFollowupCount") %>'--%>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="LnkBtnFucAll" runat="server" ToolTip="Total Under FollowupCount" OnClick="AllFollowupDetails">
                                                    </asp:LinkButton>
                                                    <%--  <asp:Label ID="lblFollow" runat="server"></asp:Label>--%>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Under Followup Value">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoofAccounts2" runat="server"
                                                        Text='<%# Bind("UnderFollowupValue") %>' ToolTip="UnderFollowupValue"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblFollowVal" runat="server" ToolTip="Total UnderFollowupValue"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rejected Count">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LnkBtnREV" runat="server" OnClick="RejectedValueDetails" Text='<%# Bind("RejectedCount") %>' ToolTip="Rejected Count">
                                                    </asp:LinkButton>
                                                    <%-- Text='<%# Bind("RejectedCount") %>'--%>
                                                    <%--<asp:Label ID="lblNoofAccounts3" runat="server" 
                                            Text='<%# Bind("RejectedCount") %>'></asp:Label>--%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="LnkBtnRejAll" runat="server" ToolTip="Total Rejected Count" OnClick="AllRejectedDetails">
                                                    </asp:LinkButton>
                                                    <%-- <asp:Label ID="lblReject" runat="server"></asp:Label>--%>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rejected Value">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoofAccounts3" runat="server"
                                                        Text='<%# Bind("RejectedValue") %>' ToolTip="Rejected Value"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblRejVal" runat="server" ToolTip="Total Rejected Value"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnPrintEnquirydtls" onserverclick="btnPrint_Click" runat="server" validationgroup="Print"
                    type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlRC" runat="server" CssClass="stylePanel" GroupingText="Received Details"
                        Width="100%" Visible="false">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="grvRC" runat="server" AutoGenerateColumns="False" CssClass="gird_details"
                                        Width="100%">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Product">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("Product") %>' ToolTip="Product"></asp:Label>
                                                    <asp:Label ID="lblProductId" runat="server" Visible="false" Text='<%# Bind("PRODUCT_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <FooterStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Enquiry No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEnq" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Enquiry Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEdate" runat="server" Text='<%# Bind("ENQUIRYDATE") %>' ToolTip="Enquiry Date"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomername" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' ToolTip="Customer Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asset Details">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetDet" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Facility Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFacility" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Co Applicant Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Telephone No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' ToolTip="Status"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div style="display: none;">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird_details">
                                        <asp:GridView ID="grvRC_Export" runat="server" AutoGenerateColumns="False" CssClass="gird_details"
                                            Width="100%">
                                            <Columns>
                                                <%--<asp:TemplateField HeaderText="Product">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("Product") %>' ToolTip="Product"></asp:Label>
                                        <asp:Label ID="lblProductId" runat="server" Visible="false" Text='<%# Bind("ProductId") %>'></asp:Label>
                                    </ItemTemplate>
                                     <ItemStyle  HorizontalAlign ="Left"  />
                                     <FooterStyle HorizontalAlign ="Center" />
                                <FooterTemplate>
                                   <asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label>
                                </FooterTemplate>
                                    
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("Product") %>' ToolTip="Product"></asp:Label>
                                                        <asp:Label ID="lblProductId" runat="server" Visible="false" Text='<%# Bind("PRODUCT_ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Center" />
                                                    <%--<FooterTemplate>
                                   <asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label>
                                </FooterTemplate>--%>
                                    
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Enquiry No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEnq" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Enquiry Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEdate" runat="server" Text='<%# Bind("ENQUIRYDATE") %>' ToolTip="Enquiry Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomername" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' ToolTip="Customer Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Details">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetDet" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Facility Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFacility" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Co Applicant Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Mobile No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Telephone No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' ToolTip="Status"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
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
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="PnlSc" runat="server" CssClass="stylePanel" GroupingText="Successful Details "
                        Width="100%" Visible="false">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="GrvSc" runat="server" AutoGenerateColumns="False" CssClass="gird_details"
                                        Width="99%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Enquiry No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEnqNo" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Enquiry Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEnqDate" runat="server" Text='<%# Bind("EnquiryDate") %>' ToolTip="Enquiry Date"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustname" runat="server" Text='<%# Bind("CustomerName") %>' ToolTip="Customer Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asset Details">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssDet" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Facility Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFacAmt" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPac" runat="server" Text='<%# Bind("PrimeAccNo") %>' ToolTip="Account No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSubac" runat="server" Text='<%# Bind("SubAccNo") %>' ToolTip="Sub Account No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Co Applicant Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Telephone No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <div style="display: none">
                                        <asp:GridView ID="GrvSc_Export" runat="server" AutoGenerateColumns="False" CssClass="gird_details"
                                            Width="99%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Enquiry No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEnqNo" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Enquiry Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEnqDate" runat="server" Text='<%# Bind("EnquiryDate") %>' ToolTip="Enquiry Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustname" runat="server" Text='<%# Bind("CustomerName") %>' ToolTip="Customer Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Details">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssDet" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Facility Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFacAmt" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPac" runat="server" Text='<%# Bind("PrimeAccNo") %>' ToolTip="Account No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSubac" runat="server" Text='<%# Bind("SubAccNo") %>' ToolTip="Sub Account No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Co Applicant Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Mobile No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Telephone No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
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
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="PnlUFC" runat="server" CssClass="stylePanel" GroupingText="FollowUp Details"
                        Width="100%" Visible="false">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="GrvFollowUp" runat="server" AutoGenerateColumns="False" CssClass="styleInfoLabel"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Enquiry No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblENo" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Enquiry Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEndate" runat="server" Text='<%# Bind("EnquiryDate") %>' ToolTip="Enquiry Date"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCuname" runat="server" Text='<%# Bind("CustomerName") %>' ToolTip="CustomerName"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asset Details">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetDet1" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Facility Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFAM" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Co Applicant Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Telephone No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Stage">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Stage") %>' ToolTip="Stage"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <div style="display: none">
                                        <asp:GridView ID="GrvFollowUp_Export" runat="server" AutoGenerateColumns="False" CssClass="styleInfoLabel"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Enquiry No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblENo" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Enquiry Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEndate" runat="server" Text='<%# Bind("EnquiryDate") %>' ToolTip="Enquiry Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCuname" runat="server" Text='<%# Bind("CustomerName") %>' ToolTip="CustomerName"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Details">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetDet1" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Facility Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFAM" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Co Applicant Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Mobile No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Telephone No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Stage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Stage") %>' ToolTip="Stage"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
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
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="PRejcount" runat="server" CssClass="stylePanel" GroupingText="Rejected Details"
                        Width="100%" Visible="false">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="GrvRejected" runat="server" AutoGenerateColumns="False" CssClass="gird_details"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Enquiry No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblENo1" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Enquiry Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEndate1" runat="server" Text='<%# Bind("EnquiryDate") %>' ToolTip="Enquiry Date"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCuname1" runat="server" Text='<%# Bind("CustomerName") %>' ToolTip="Customer Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asset Details">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetDe1" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Facility Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFAM1" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Co Applicant Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact Telephone No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>' ToolTip="Remarks"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div style="display: none">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="GrvRejected_Export" runat="server" AutoGenerateColumns="False" CssClass="styleInfoLabel"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Enquiry No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblENo1" runat="server" Text='<%# Bind("ENQUIRYNO") %>' ToolTip="Enquiry No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Enquiry Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEndate1" runat="server" Text='<%# Bind("EnquiryDate") %>' ToolTip="Enquiry Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCuname1" runat="server" Text='<%# Bind("CustomerName") %>' ToolTip="Customer Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Details">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetDe1" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Details"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Facility Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFAM1" runat="server" Text='<%# Bind("FacilityAmount") %>' ToolTip="Facility Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Co Applicant Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCoApplicantName" runat="server" Text='<%# Bind("Co_Applicant_Name") %>' ToolTip="Co Applicant Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Bind("Contact_Name") %>' ToolTip="Contact Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Mobile No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactMobileno" runat="server" Text='<%# Bind("Cont_Mobile_No") %>' ToolTip="Contact Mobile No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Telephone No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactTelephoneno" runat="server" Text='<%# Bind("Contact_Telephone_No") %>' ToolTip="Contact Telephone No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Remarks">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>' ToolTip="Remarks"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
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
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnPrintReceiveddtls" runat="server" validationgroup="Print"
                    type="button" causesvalidation="false" accesskey="P" title="Export,Alt+P" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;Ex<u>P</u>ort
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsEnquiry" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Go" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:CustomValidator ID="CVLAN" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

