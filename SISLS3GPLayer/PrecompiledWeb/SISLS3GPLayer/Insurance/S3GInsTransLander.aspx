<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GInsTranslander, App_Web_q5jmkrdt" title="Untitled Page" %>

<%--Ajax Control Toolkit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%--Content--%>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Design Started--%>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading" EnableViewState="false"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <%-- <cc1:ComboBox ID="ComboBox1" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                                runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                            </cc1:ComboBox>--%>
                                    <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="RFVDTransLander" InitialValue="-- Select --"
                                        CssClass="styleMandatoryLabel" runat="server" ControlToValidate="ComboBoxLOBSearch"
                                        SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVDTransLander"
                                        InitialValue="-- Select --" CssClass="styleMandatoryLabel" runat="server" ControlToValidate="txtStartDateSearch"
                                        SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Branch" ID="lblBranchSearch"></asp:Label>
                                    </label>
                                </div>
                            </div>


                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtStartDateSearch" autocomplete="off" runat="server" AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"
                                        OnTextChanged="txtStartDateSearch_TextChanged"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                        TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                        runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True" Enabled="false"
                                        ErrorMessage="Enter a Start Date" Display="None"></asp:RequiredFieldValidator>
                                    <input id="hidDate" type="hidden" runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"
                                        OnTextChanged="txtEndDateSearch_TextChanged"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                        TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                        runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter a End Date" Enabled="false"
                                        Display="None"></asp:RequiredFieldValidator>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <uc2:Suggest ID="cmbDocumentNumberSearch" runat="server" ServiceMethod="GetDocumentNumber" class="md-form-control form-control" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList Visible="false" AutoPostBack="true" ID="ddlMultipleDNC" runat="server"
                                        OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Transaction" runat="server" ID="lblMultipleDNC" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDNCOption" runat="server"
                                        OnSelectedIndexChanged="ddlDNCOption_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Select Status" runat="server" ID="lblDNCOption" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountno" runat="server">
                                <div class="md-input">
                                    <%--<uc2:suggest id="ucAccountLov" runat="server" servicemethod="GetAccuntNoList" autopostback="true" />--%>
                                    <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                        Style="display: none;" MaxLength="100"></asp:TextBox>
                                    <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                        strLOV_Code="ACC_ASTIDN" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                    <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                        Style="display: none" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="divCustomerCode">
                                <div class="md-input">
                                    <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both" OnItem_Selected="ucCustomerCodeLov_Item_Selected" AutoPostBack="true"
                                        strLOV_Code="CUS_ASTINS" ServiceMethod="GetCustomerCodeList" class="md-form-control form-control" />
                                    <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                        Style="display: none" />

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>


                <div class="gird">
                    <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                        OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                        RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound" class="gird_details">
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

                            <%--                            <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CbxActive" runat="server" />
                                    <asp:Label ID="lblActive" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
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
                <div class="row">
                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                </div>

                <div class="row">
                    <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />
                </div>

                <div class="row" style="display: none;">
                    <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="true" />
                </div>
                <div class="btn_height"></div>
                <div align="right">

                    <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server" validationgroup="RFVDTransLander"
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function fnTrashSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
    </script>

</asp:Content>
