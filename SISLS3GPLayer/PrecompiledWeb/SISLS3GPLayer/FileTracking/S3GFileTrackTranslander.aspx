<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="FileTracking_S3GFileTrackTranslander, App_Web_ke4311yt" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%--Content--%>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function Branch_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = e.get_value();
        }
        function Branch_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = '';
        }
        function fnValidateEmpty() { }
        function fnValidateEmptyGotoPage() { }
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('<%=btnLoadAccount.ClientID%>').click();
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";


                }
            }
        }

        function fnTrashAccountCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountCode.ClientID %>').value = "";


                }
            }
        }

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

    </script>

    <%--Design Started--%>
    <asp:UpdatePanel ID="udpOutercover" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">                                      
                                        <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" ValidationGroup="RFVDTransLander" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged"
                                            class="md-form-control form-control" AutoPostBack="true" ToolTip="Line of Business">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="RFVDTransLander" InitialValue="-- Select --"
                                            CssClass="styleMandatoryLabel" runat="server" ControlToValidate="ComboBoxLOBSearch"
                                            SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" ToolTip="Line of Business" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divBranch" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtBranchSearch" runat="server" MaxLength="50" OnTextChanged="txtBranchSearch_OnTextChanged" Visible="false"
                                            AutoPostBack="true" ToolTip="Branch" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>                                       
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>                                       
                                        <asp:HiddenField ID="hdnBranchID" runat="server" />
                                        <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="Print" InitialValue=""
                                            CssClass="styleMandatoryLabel" runat="server" ControlToValidate="txtBranchSearch"
                                            SetFocusOnError="True" ErrorMessage="Select Branch" Display="None"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" ToolTip="Branch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <input id="hidDate" type="hidden" runat="server" />
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="false" 
                                            class="md-form-control form-control login_form_content_input requires_true"
                                            autocomplete = "off"
                                            OnTextChanged="txtStartDateSearch_TextChanged" ToolTip="Start Date"></asp:TextBox>

                                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                            TargetControlID="txtStartDateSearch">
                                        </cc1:CalendarExtender>
                                        <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                        <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                            runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                            ErrorMessage="Enter a Start Date" Display="None"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" ToolTip="Start Date" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">

                                        <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="false"
                                            autocomplete = "off"
                                            class="md-form-control form-control login_form_content_input requires_true"
                                            OnTextChanged="txtEndDateSearch_TextChanged" ToolTip="End Date"></asp:TextBox>

                                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                            TargetControlID="txtEndDateSearch">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                            runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter a End Date"
                                            Display="None"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" ToolTip="End Date" />
                                        </label>
                                    </div>
                                </div>
                               
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12" runat="server" visible="false" id="dvDepositBank">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDepositBank" ToolTip="Deposit Bank" runat="server"
                                            CssClass="md-form-control form-control" onmouseover="ddl_itemchanged(this);">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Deposit Bank" ID="lblDraweebank" CssClass="styleFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <%--Multiple Document Number --%>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="divMultipleDocNo" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList AutoPostBack="true" ID="ddlMultipleDNC" runat="server" class="md-form-control form-control"
                                           >
                                        </asp:DropDownList>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label Text="Transaction" runat="server" ID="lblMultipleDNC"
                                                CssClass="styleDisplayLabel" />

                                        </label>
                                    </div>
                                </div>

                                 <div id="divReceiptTo" class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlReceiptTo" runat="server" ToolTip="Receipt To" AutoPostBack="True"
                                             CssClass="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Receipt To" ToolTip="Receipt To" ID="lblReceiptTo" CssClass="styleFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divCustomerCode" runat="server" visible="false">
                                    <div class="md-input">
                                        <span class="highlight"></span>
                                        <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" ToolTip="Customer Code / Name" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="false"
                                            AutoPostBack="true" DispalyContent="Both" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                            Style="display: none" />
                                        <a href="#" onclick="window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromApplication=Yes&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=no,scrollbars=yes,top=150,left=100');return false;"></a>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code / Name" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountLOV" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAccountCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                            OnItem_Selected="ucAccountLov_Item_Selected" strLOV_Code="ACC_ACCA" ServiceMethod="GetAccountList" ToolTip="Account Number" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Account Number" ToolTip="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlDocumentNumb" runat="server" AutoPostBack="false" ServiceMethod="GetDocumentNumberList"
                                            class="md-form-control form-control login_form_content_input requires_false" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <%--Document Number--%>
                                            <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                                    OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                                    RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound" class="gird_details">
                                    <Columns>
                                        <%--Query Column--%>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Query">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                    CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--Edit Column--%>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Modify">                                            
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                                    CommandArgument='<%# Bind("ID") %>' CommandName="Modify" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>                                        
                                        <%--Created by - User ID Column--%>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                                <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                                                <asp:Label ID="lblStatusID" Visible="false" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
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
                        <button id="btnSearch" runat="server" validationgroup="RFVDTransLander" title="Search[Alt+S]" accesskey="S"
                            class="css_btn_enabled" onserverclick="btnSearch_Click" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                        </button>
                        <button id="btnCreate" runat="server" type="button" class="css_btn_enabled" title="Create[Alt+C]" accesskey="C"
                            onserverclick="btnCreate_Click">
                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                        </button>
                        <button id="btnClear" runat="server" type="button" class="css_btn_enabled" title="Clear[Alt+L]" accesskey="L"
                            onclick="if(fnConfirmClear())" onserverclick="btnClear_Click" causesvalidation="false">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                            <input type="hidden" id="hdnSortDirection" runat="server" />
                            <input type="hidden" id="hdnSortExpression" runat="server" />
                            <input type="hidden" id="hdnSearch" runat="server" />
                            <input type="hidden" id="hdnOrderBy" runat="server" />
                            <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                                ShowSummary="true" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="grvTransLander" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

