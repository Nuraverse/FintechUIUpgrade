<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FATransLander, App_Web_insjbia3" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Design Started--%>
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel">
                    </asp:Label>

                </h6>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <cc1:ComboBox ID="ComboBoxLocationSearch" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                        AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                    </cc1:ComboBox>
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVComboLocation" ValidationGroup="RFVDTransLander"
                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxLocationSearch"
                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label class="tess">

                        <asp:Label runat="server" ID="lblLocationSearch" Text="Branch" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:TextBox ID="txtStartDateSearch" runat="server" OnTextChanged="txtStartDateSearch_TextChanged"
                        AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                    <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                    <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                        PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                    </cc1:CalendarExtender>
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                            Enabled="false" runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                            ErrorMessage="Enter a Start Date" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>

                        <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <UC:Suggest ID="cmbDocumentNumberSearch" runat="server" ServiceMethod="GetDocNumber" />
                    <asp:RadioButton ID="rdoManual" AutoPostBack="true" CssClass="styleDisplayLabel"
                        OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" Checked="true" runat="server"
                        GroupName="DocYes" Text="Manual Journal" />
                    <asp:RadioButton ID="rdoSystem" AutoPostBack="true" CssClass="styleDisplayLabel"
                        OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" GroupName="DocYes"
                        runat="server" Text="System Journal" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />
                        <asp:Label Text="Journal Type" Visible="false" runat="server" ID="lblJVType" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:TextBox ID="txtEndDateSearch" runat="server" OnTextChanged="txtEndDateSearch_TextChanged"
                        AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                        PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                    </cc1:CalendarExtender>
                    <asp:Image runat="server" ID="imgEndDate" Visible="false" />
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                            Enabled="false" runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True"
                            ErrorMessage="Enter a End Date" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>

                        <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <cc1:ComboBox ID="cmbJournalNo" runat="server" AutoCompleteMode="SuggestAppend" Visible="false"
                        onkeyup="maxlengthfortxt(113)" DropDownStyle="DropDownList" MaxLength="0" CssClass="WindowsStyle">
                    </cc1:ComboBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label class="tess">

                        <asp:Label Text="Journal Number" Visible="false" runat="server" ID="lblJVNo" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server"
                        class="md-form-control form-control">
                    </asp:DropDownList>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>

                        <asp:Label Visible="false" Text="Select Status" runat="server" ID="lblDNCOption"
                            CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList Visible="false" AutoPostBack="true" ID="ddlMultipleDNC" runat="server"
                        Width="185px" OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged"
                        class="md-form-control form-control">
                    </asp:DropDownList>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Visible="false" Text="Transaction" runat="server" ID="Label1" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>







           
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="gird">
                    <asp:GridView runat="server" ID="grvTransLander" AutoGenerateColumns="true"
                        OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                        RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound">
                        <Columns>
                            <%--Query Column--%>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                        CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Edit Column--%>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                        CommandArgument='<%# Bind("ID") %>' CommandName="Modify" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblPrint" runat="server" Text="Print"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnPrint" CssClass="styleGridEdit" ImageUrl="~/Images/pdf.png"
                                        CommandArgument='<%# Bind("ID") %>' CommandName="Print" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Created by - User ID Column--%>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                    <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
                <input id="hidDate" type="hidden" runat="server" />
                 <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                    ShowSummary="true" />
            </div>
        </div>
         <div class="btn_height"></div>
            <div align="right" class="fixed_btn">
                <button class="css_btn_enabled" id="btnSearch" title="Search,Alt+F" causesvalidation="false" onserverclick="btnSearch_Click" runat="server"
                    type="button" accesskey="F" validationgroup="RFVDTransLander">
                    <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                </button>
                <button class="css_btn_enabled" id="btnCreate" title="Create,Alt+C" causesvalidation="false" onserverclick="btnCreate_Click" runat="server"
                    type="button" accesskey="C">
                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>C</u>reate
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear_FA, Alt+L" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                  <button class="css_btn_enabled" id="btnExcelExport" runat="server"  onserverclick="btnExcelExport_ServerClick" title="Excel Export">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u></u>Export
                </button>
            </div>
    </div>
</asp:Content>
