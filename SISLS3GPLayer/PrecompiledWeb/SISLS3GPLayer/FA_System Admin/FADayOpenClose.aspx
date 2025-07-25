<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FAMonthAndYearLock, App_Web_mr11ufc2" title="Month and Year Lock" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
      

    </script>

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                            AutoPostBack="true" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvddlBranch" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlBranch" InitialValue="0"
                                                ErrorMessage="select Branch" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Branch" Font-Bold="true" ID="lblBranch" CssClass="styleReqFieldLabel"
                                                ToolTip="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDayOpenClose" OnSelectedIndexChanged="ddlDayOpenClose_SelectedIndexChanged" runat="server" ToolTip="Day Open/Close"
                                            AutoPostBack="true" class="md-form-control form-control">
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Open"></asp:ListItem>
                                           <%-- <asp:ListItem Value="2" Text="Open Authorisation"></asp:ListItem>--%>
                                            <asp:ListItem Value="3" Text="Close"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Close Authorisation"></asp:ListItem>

                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlDayOpenClose" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlDayOpenClose" InitialValue="0"
                                                ErrorMessage="Select Day Open/Close" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Day Open/Close" Font-Bold="true" ID="lblOpenClose" CssClass="styleReqFieldLabel"
                                                ToolTip="Day Open/Close"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlDayOpen" GroupingText="Day Open" Width="100%" CssClass="stylePanel" runat="server" Visible="false">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtOpenDate" runat="server" ToolTip="Open Date"  OnTextChanged="txtOpenDate_TextChanged" 
                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <cc1:CalendarExtender ID="ceOpenDate" runat="server" Enabled="true"  Format="DD/MM/YYYY"
                                                        PopupButtonID="imgOpenDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                        TargetControlID="txtOpenDate">
                                                    </cc1:CalendarExtender>
                                                    <asp:Image ID="imgOpenDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvOpenDate" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ControlToValidate="txtOpenDate" InitialValue=""
                                                            ErrorMessage="Select Open Date" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Open Date" Font-Bold="true" ID="lblOpenDate" CssClass="styleReqFieldLabel"
                                                            ToolTip="Open Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtOpeningBalance" runat="server" ToolTip="Opening Balance" Style="text-align: right;" MaxLength="15"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtOpeningBalance" runat="server" TargetControlID="txtOpeningBalance"
                                                        ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvtxtOpeningBalance" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ControlToValidate="txtOpeningBalance" InitialValue=""
                                                            ErrorMessage="Enter Opening Balance" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Opening Balance" Font-Bold="true" ID="lblOpeningBalance" CssClass="styleReqFieldLabel"
                                                            ToolTip="Opening Balance"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCashReceiptNo" runat="server" ToolTip="Cash Receipt No"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <%--<div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvCashReceiptNo" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ControlToValidate="txtCashReceiptNo" InitialValue=""
                                                            ErrorMessage="Enter Cash Receipt No" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                    </div>--%>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Cash Receipt No" Font-Bold="true" ID="lblCashReceiptNo" CssClass="styleReqFieldLabel"
                                                            ToolTip="Cash Receipt No."></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDayStartDoneby" runat="server" ToolTip="Day Start Done by" class="md-form-control form-control login_form_content_input requires_true"
                                                        AutoPostBack="true">
                                                    </asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvDayStartDoneby" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ControlToValidate="txtDayStartDoneby" InitialValue="0"
                                                            ErrorMessage="Day Start Done by" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <asp:HiddenField ID="hdnopen_id" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Day Start Done by" Font-Bold="true" ID="lblDayStartDoneBy" CssClass="styleReqFieldLabel"
                                                            ToolTip="Day Start Done by"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <%--<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="TxtCloseReceiptNo" runat="server" ToolTip="Closing Cash Receipt No"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Closing Cash Receipt No" Font-Bold="true"
                                                            ID="LblCloseReceiptNo" CssClass="styleReqFieldLabel"
                                                            ToolTip="Closing Cash Receipt No"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>--%>

                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnldayClose" GroupingText="Day Close" Width="100%" CssClass="stylePanel" runat="server" Visible="false">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCloseDate" runat="server" ToolTip="Close Date" OnTextChanged="txtCloseDate_TextChanged"
                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                  <%--  <cc1:CalendarExtender ID="CECloseDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                        PopupButtonID="ImgCloseDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                        TargetControlID="txtCloseDate">
                                                    </cc1:CalendarExtender>--%>
                                                   <%-- <asp:Image ID="ImgCloseDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />--%>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvCloseDate" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ControlToValidate="txtCloseDate" InitialValue=""
                                                            ErrorMessage="Enter Closing Date" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Closing Date" Font-Bold="true" ID="lblCloseDate" CssClass="styleReqFieldLabel"
                                                            ToolTip="Closing Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlDayCloseAuthorization" HorizontalAlign="Left" GroupingText="Day Close Authorization" Width="100%" CssClass="stylePanel" runat="server" Visible="false">
                                        <div class="row">

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtOpeningDate" runat="server" ToolTip="Opening Date" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                        AutoPostBack="true">
                                                    </asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Font-Bold="true" Text="Opening Date" ID="lblOpeningDate" CssClass="styleReqFieldLabel"
                                                            ToolTip="Opening Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCashTalliedBy" runat="server" ToolTip="Cash Tallied By" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                        AutoPostBack="true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Font-Bold="true" Text="Cash Tallied By" ID="lblCashTalliedby" CssClass="styleReqFieldLabel"
                                                            ToolTip="Cash Tallied By"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDayStartDoneByClAuth" runat="server" ToolTip="Day Start Done By" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                        AutoPostBack="true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Font-Bold="true" Text="Day Start Done By" ID="lblDayStartDonebyclAuth" CssClass="styleReqFieldLabel"
                                                            ToolTip="Day Start Done By"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="TxtOpenBal" runat="server" ToolTip="Opening Balance" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Font-Bold="true" Text="Opening Balance" ID="LblOpenBal" CssClass="styleReqFieldLabel"
                                                            ToolTip="Opening Balance"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="TxtTodayRecipt" runat="server" ToolTip="Receipt" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Font-Bold="true" Text="Receipt" ID="lblTodayRecipt" CssClass="styleReqFieldLabel"
                                                            ToolTip="Receipt"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="TxtTodayChallan" runat="server" ToolTip="Challan" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Font-Bold="true" Text="Challan" ID="LblTodayChallan" CssClass="styleReqFieldLabel"
                                                            ToolTip="Challan"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCashBalanceInBox" runat="server" ToolTip="Cash Balance In Box" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                        AutoPostBack="true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Font-Bold="true" Text="Cash Balance In Box" ID="lblCashBalanceInBox" CssClass="styleReqFieldLabel"
                                                            ToolTip="Cash Balance In Box"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>



                                        </div>

                                    </asp:Panel>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlCashDenominationDetails" HorizontalAlign="Center" GroupingText="CASH DENOMINATION DETAILS" Width="100%" CssClass="stylePanel" Visible="false"
                                        runat="server">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView runat="server" ID="GRVDayClose" AutoGenerateColumns="False" ShowFooter="true"
                                                        OnRowDeleting="GRVDayClose_RowDeleting" OnRowCommand="GRVDayClose_RowCommand" ToolTip="Days"
                                                        Width="50%" OnRowCancelingEdit="GRVDayClose_RowCancelingEdit" OnRowEditing="GRVDayClose_RowEditing"
                                                        OnRowUpdating="GRVDayClose_RowUpdating" EmptyDataText="No Records Found" OnRowCreated="GRVDayClose_RowCreated"
                                                        OnRowDataBound="GRVDayClose_RowDataBound">
                                                        <Columns>
                                                            <%--S.no--%>

                                                               <%--<asp:TemplateField HeaderText="Id" Visible="false" HeaderStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("LOOKUP_ID")%>' >
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                               
                                                            </asp:TemplateField>--%>

                                                            <asp:TemplateField HeaderText="Sl.No." HeaderStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblsno" runat="server" Text='<%#Container.DataItemIndex+1  %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblsnoF" runat="server"></asp:Label>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Denomination" HeaderStyle-Width="20%">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" Text='<%#Eval("Denomination")%>' ID="lblDescriptionDaysVal"
                                                                        Visible="false"></asp:Label>
                                                                    <asp:Label runat="server" Text='<%#Eval("Denomination")%>' ID="lblDescriptionDays"></asp:Label>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:DropDownList ID="ddlDescriptionDaysEdit" Width="97%" runat="server" ValidationGroup="VGDays">
                                                                    </asp:DropDownList>
                                                                    <asp:HiddenField ID="hdnDescDays" runat="server" Value='<%#Eval("Denomination") %>' />
                                                                </EditItemTemplate>

                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <ItemStyle Width="20%" />
                                                            </asp:TemplateField>
                                                            <%--From Days--%>
                                                            <asp:TemplateField HeaderText="Unit Amount" HeaderStyle-Width="20%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFromDays" runat="server" Text='<%# Bind("Unit_Amount")%>' Style="text-align: right;"></asp:Label>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtFromDaysEdit" runat="server" MaxLength="4" Width="97%" Text='<%# Bind("Unit_Amount")%>'
                                                                        Style="text-align: right;"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtFromDaysEdit" runat="server" TargetControlID="txtFromDaysEdit"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </EditItemTemplate>

                                                                <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                            </asp:TemplateField>
                                                            <%--To days--%>
                                                            <asp:TemplateField HeaderText="No Of Coins" HeaderStyle-Width="20%">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="lblToDays" OnTextChanged="lblToDays_TextChanged" AutoPostBack="true" runat="server" Text='<%# Bind("no_of_coins")%>' Style="text-align: right;"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftlbltodays" runat="server" TargetControlID="lblToDays"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtToDaysEdit" runat="server" MaxLength="4" Width="97%" Text='<%# Bind("no_of_coins")%>'
                                                                        Style="text-align: right;"> </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtToDaysEdit" runat="server" TargetControlID="txtToDaysEdit"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="txtToDaysF" runat="server" Text="Total Cash Balance in Box" Width="97%" Style="text-align: right;"></asp:Label>

                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                            </asp:TemplateField>
                                                            <%-- Description (Days)--%>

                                                            <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="20%">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="lblCreditWeightage" runat="server" Text='<%# Bind("Amount")%>' Style="text-align: right;"></asp:TextBox>

                                                                </ItemTemplate>
                                                                <%--<EditItemTemplate>
                                                                    <asp:Label ID="txtCreditWeightageEdit" ReadOnly="true" runat="server" MaxLength="2" Width="97%" Text='<%# Bind("Amount")%>'
                                                                        Style="text-align: right;" Enabled="false"></asp:Label>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtCreditWeightageEdit" runat="server" TargetControlID="txtCreditWeightageEdit"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </EditItemTemplate>--%>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtclosingBalanceFooter" ReadOnly="true" runat="server" Width="97%" Style="text-align: right;"></asp:TextBox>

                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false" HeaderStyle-Width="25%">
                                                                <ItemTemplate>
                                                                    &nbsp;
                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                    &nbsp;
                                                        <asp:LinkButton ID="btnRemoveDays" Text="Delete" CommandName="Delete" runat="server"
                                                            CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    &nbsp;
                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                            CausesValidation="false"></asp:LinkButton>
                                                                    &nbsp;
                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                            CausesValidation="false"></asp:LinkButton>
                                                                </EditItemTemplate>

                                                                <ItemStyle Width="20%" HorizontalAlign="Center" />
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
                                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Main'))"
                                    type="button" accesskey="O" causesvalidation="false" title="Ok Alt+O" validationgroup="Main">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>O</u>k/Approve
                                </button>
                                <button class="css_btn_enabled" id="btnClear" causesvalidation="false" onserverclick="btnClear_ServerClick" runat="server" onclick="if(fnConfirmClear())"
                                    type="button" accesskey="L" title="Clear,Alt+L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click1" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                                    type="button" accesskey="X" title="Exit,Alt+X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>







