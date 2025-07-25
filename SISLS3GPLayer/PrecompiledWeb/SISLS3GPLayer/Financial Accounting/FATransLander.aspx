<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FATransLander, App_Web_jj5zdzwe" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function Location_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Location_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = '';
        }
        function Branch_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = e.get_value();
        }
        function Branch_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = '';
        }

        function fnConfirmClear() {
            debugger;
            if (confirm('Do you want to clear?')) {
                return true;
            }
            else
                return false;

        }

    </script>
    <%--Design Started--%>

    <%--  <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>--%>
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" EnableViewState="false">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">

                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="md-input">
                        <asp:DropDownList ID="ddlActivity" runat="server" class="md-form-control form-control" >
                        </asp:DropDownList>

                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label runat="server" Text="Activity" ID="lblActivity" CssClass="styleDisplayLabel"
                                ToolTip="Activity"></asp:Label>
                        </label>
                    </div>
                </div>


                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="md-input">
                        <asp:DropDownList ID="ComboBoxLocationSearch" runat="server" class="md-form-control form-control" ToolTip="Branch" OnSelectedIndexChanged="ComboBoxLocationSearch_SelectedIndexChanged"></asp:DropDownList>
                        <asp:HiddenField ID="hdnBranchID" runat="server" />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label Text="Branch" runat="server" ID="lblLocationSearch" CssClass="styleReqFieldLabel" />
                        </label>
                    </div>
                </div>

                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="md-input">
                        <asp:TextBox ID="txtStartDateSearch" runat="server" ToolTip="Start Date" class="md-form-control form-control login_form_content_input requires_false" OnTextChanged="txtStartDateSearch_TextChanged"
                            AutoPostBack="True" autocomplete="off"></asp:TextBox>
                        <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                            PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch">
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
                            <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" />
                        </label>
                    </div>
                </div>


                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="md-input">
                        <asp:TextBox ID="txtEndDateSearch" runat="server" ToolTip="End Date" OnTextChanged="txtEndDateSearch_TextChanged" class="md-form-control form-control login_form_content_input requires_false"
                            AutoPostBack="True" autocomplete="off"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                            PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch">
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

                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="divdoc" runat="server">
                    <div class="md-input">
                        <UC:Suggest ID="cmbDocumentNumberSearch" runat="server" ServiceMethod="GetDocNumber" />

                        <label>
                            <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />

                        </label>
                    </div>
                </div>

                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="divEntityName" runat="server" visible="false">
                    <div class="md-input">
                        <asp:TextBox ID="txtEntityName" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                            AutoPostBack="true"></asp:TextBox>

                        <label>
                            <asp:Label Text="Entity Name" runat="server" ID="lblEntityName" CssClass="styleDisplayLabel" />

                        </label>
                    </div>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" runat="server" id="divmjv" visible="false">
                    <div class="md-input">

                        <asp:RadioButton ID="rdoManual" AutoPostBack="true" CssClass="md-form-control form-control radio"
                            OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" Checked="true" runat="server"
                            GroupName="DocYes" Text="Manual Journal" />
                    </div>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" runat="server" id="divsjv" visible="false">
                    <div class="md-input">
                        <asp:RadioButton ID="rdoSystem" AutoPostBack="true" CssClass="md-form-control form-control radio"
                            OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" GroupName="DocYes"
                            runat="server" Text="System Journal" />
                    </div>
                </div>


                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divcmbJournalNo" visible="false">
                    <div class="md-input">
                        <asp:TextBox ID="cmbJournalNo" runat="server" OnTextChanged="cmbJournalNo_OnTextChanged" class="md-form-control form-control login_form_content_input requires_false"
                            AutoPostBack="true">
                        </asp:TextBox>
                        <cc1:AutoCompleteExtender ID="autoLocationSearch" MinimumPrefixLength="3" OnClientPopulated="Location_ItemPopulated"
                            OnClientItemSelected="Location_ItemSelected" runat="server" TargetControlID="cmbJournalNo"
                            ServiceMethod="GetDocNumber" Enabled="True" ServicePath="" CompletionSetCount="5"
                            DelimiterCharacters=";,:" CompletionListCssClass="CompletionList"
                            CompletionListItemCssClass="CompletionListItemCssClass"
                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                            ShowOnlyCurrentWordInCompletionListItem="true" CompletionInterval="0">
                        </cc1:AutoCompleteExtender>

                        <asp:HiddenField ID="hdnCommonID" runat="server" />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label Text="Journal Number" Visible="false" runat="server" ID="lblJVNo" CssClass="styleDisplayLabel" />
                        </label>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divDNCOption" visible="false">
                    <div class="md-input">
                        <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server" class="md-form-control form-control">
                        </asp:DropDownList>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label Visible="false" Text="Select Status" runat="server" ID="lblDNCOption"
                                CssClass="styleDisplayLabel" />
                            <asp:Label Visible="false" Text="Transaction" runat="server" ID="lblMultipleDNC"
                                CssClass="styleDisplayLabel" />
                        </label>
                    </div>

                </div>


                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divddlMultipleDNC" visible="false">
                    <div class="md-input">
                        <asp:DropDownList Visible="false" AutoPostBack="true" ID="ddlMultipleDNC" runat="server" class="md-form-control form-control"
                            OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged">
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
                        <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                            OnRowCommand="grvTransLander_RowCommand"
                            RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound" CssClass="gird_details">
                            <Columns>
                                <%--Query Column--%>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="QUERY"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Edit Column--%>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">

                                    <HeaderStyle />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="MODIFY"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("ID") %>' CommandName="Modify" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">

                                    <HeaderStyle />
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
                </div>
            </div>
            <div class="btn_height"></div>
            <div align="right" class="fixed_btn">

                <%--         <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                            type="button" accesskey="C" title="Create,Alt+C">
                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                        </button>--%>
                <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server" validationgroup="RFVDTransLander"
                    type="button" accesskey="S" title="Search [Alt+S]">
                    <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                </button>
                <button class="" id="btnCreate" runat="server" onserverclick="btnCreate_Click" accesskey="C" title="Create [Alt+C]">
                    <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                </button>
                <%-- <button class="css_btn_enabled" id="btnCreate" onclick="" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>--%>


                <button class="css_btn_enabled" id="Button1" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false"
                    onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>

                <button class="css_btn_enabled" id="btnExcelExport" runat="server" onserverclick="btnExcelExport_ServerClick" title="Excel Export">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u></u>Export
                </button>

            </div>
        </div>
        <div>
            <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
        </div>
        <div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
            <input id="hidDate" type="hidden" runat="server" />
        </div>
        <div>
            <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                ShowSummary="true" />
        </div>
    </div>
    <%--   </ContentTemplate>
     
    </asp:UpdatePanel>--%>




    <%--  --%>
</asp:Content>
