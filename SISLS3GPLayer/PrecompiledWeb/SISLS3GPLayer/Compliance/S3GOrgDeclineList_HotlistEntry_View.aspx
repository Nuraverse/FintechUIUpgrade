<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Origination_S3GOrgDeclineList_HotlistEntry_View, App_Web_aojrc4jn" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading"></asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divNationality" runat="server" visible="false">
                                <div class="md-input">

                                    <uc2:Suggest ID="ddlNationality" runat="server" ServiceMethod="GetNationalityList" IsMandatory="false" ToolTip="Nationality" class="md-form-control form-control" />
                                    <%--     <asp:RequiredFieldValidator ValidationGroup="" ID="rfvddlNationality" runat="server"
                                        ControlToValidate="ddlNationality" CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select Nationality"
                                        InitialValue="--Select--" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblNationality" Text="Nationality"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server">
                                <div class="md-input">

                                    <asp:TextBox ID="txtIdentityValue" MaxLength="20" ToolTip="NID/CR/LC No" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fttxtIdentityValue" runat="server" ValidChars="/" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                        TargetControlID="txtIdentityValue">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblIdentityValue" runat="server" Text="NID / CR / LC NO"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtProspectName" ToolTip="Prospect/Customer Name" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblProspectName" Text="Prospect/Customer Name"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlNegativeList_Reason" runat="server" ToolTip="NegativeList Reason" class="md-form-control form-control"></asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNegativeListReason" runat="server" Text="Reason"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtNegativelistRemarks" runat="server" class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNegativeListRemarks" runat="server" Text="Remarks"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDeclineFrom" runat="server" ToolTip="Decline From" AutoPostBack="true" OnTextChanged="txtDeclineFrom_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceDeclineFromDate" runat="server" Enabled="True"
                                        TargetControlID="txtDeclineFrom">
                                    </cc1:CalendarExtender>
                                    <%--<asp:RequiredFieldValidator ID="rfvtxtDeclineFrom" runat="server" ControlToValidate="txtDeclineFrom" ErrorMessage="Select Decline From"
                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDeclineFrom" runat="server" Text="Decline From"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDeclineTo" runat="server" ToolTip="Decline To" AutoPostBack="true" OnTextChanged="txtDeclineTo_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceDeclineToDate" runat="server" Enabled="True" PopupButtonID="imgToDate"
                                        TargetControlID="txtDeclineTo">
                                    </cc1:CalendarExtender>
                                    <%--<asp:RequiredFieldValidator ID="rfvtxtDeclineTo" runat="server" ControlToValidate="txtDeclineTo" ErrorMessage="Select Decline To"
                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDeclineTo" runat="server" Text="Decline To"></asp:Label>
                                    </label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView ID="gvDeclineListHotlistEntry" runat="server" AutoGenerateColumns="False" Width="100%" Visible="false"
                                OnRowCommand="gvDeclineListHotlistEntry_RowCommand" OnRowDataBound="gvDeclineListHotlistEntry_RowDataBound" class="gird_details">
                                <Columns>
                                    <asp:TemplateField HeaderText="Query" SortExpression="ID" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                AlternateText="Query" CommandArgument='<%# Bind("NegativeList_ID") %>' runat="server"
                                                CommandName="Query" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modify" SortExpression="ID" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                AlternateText="Modify" CommandArgument='<%# Bind("NegativeList_ID") %>' runat="server"
                                                CommandName="Modify" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NegativeList Type_ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNegativeListType_ID" runat="server" Text='<%# Bind("NegativeList_Type_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NegativeList Type">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblHNegativeListType" runat="server" Text="NegativeList Type"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblNegativeListType" runat="server" Text='<%# Bind("NegativeList_Type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Prospect/Customer Name">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblHProspect_Cust_Name" runat="server" Text="Prospect/Customer Name"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblProspect_Cust_Name" runat="server" Text='<%# Bind("PROSPECT_CUSTOMER_NAME") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NID / CR / LC NO">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblHNIDCRNO" runat="server" Text="NID / CR / LC NO"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblNID_CRNO" runat="server" Text='<%# Bind("NID_CR_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Prospect Mobile" Visible="false">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblHProspect_Mobile" runat="server" Text="Prospect Mobile"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblProspect_Mobile" runat="server" Text='<%# Bind("Prospect_Mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Reason">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblHReason" runat="server" Text="Reason"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblReason" runat="server" Text='<%# Bind("NEGATIVELIST_REASON") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Decline Date">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblHDeclineDate" runat="server" Text="Decline Date"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDeclineDate" runat="server" Text='<%# Bind("Decline_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Created Date">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblHCreatedDate" runat="server" Text="Created Date"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Bind("CREATEDON") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Active">
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_IsActive" runat="server" Text="Active"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chk_IsActive" runat="server" ToolTip="Active"
                                                Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Is_Active")))%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="row">
                            <uc1:PageNavigator ID="ucCustomPaging" runat="server" Visible="false"></uc1:PageNavigator>
                        </div>
                    </div>
                </div>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server"
                        type="button" accesskey="S" title="Search, Alt+S">
                        <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                    </button>

                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Create, Alt+C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L" title="Clear, Alt+L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                </div>

            </div>

            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

