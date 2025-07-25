<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3G_LAD_TransactionApproval_View, App_Web_yy0xp33b" %>

<%--Ajax Control Toolkit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%--Content--%>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function Branch_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = e.get_value();
        }
        function Branch_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = '';
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

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading"> </asp:Label>
                    </h6>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                    <div class="md-input">
                        <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" class="md-form-control form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="RFVDTransLander" InitialValue="-- Select --"
                            CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxLOBSearch"
                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                        </label>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                    <div class="md-input">
                        <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control"></asp:DropDownList>
                        <asp:HiddenField ID="hdnBranchID" runat="server" />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                        </label>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                    <div class="md-input">
                        <asp:DropDownList ID="ddlMultipleDNC" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged" > 
                        </asp:DropDownList>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <div class="validation_msg_box">
                            <asp:RequiredFieldValidator ID="rfvMultipleDNC" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                                runat="server" ControlToValidate="ddlMultipleDNC" SetFocusOnError="True" InitialValue="0"
                                ErrorMessage="Select Document Type" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <label>
                            <asp:Label Text="Document Type" runat="server" ID="lblMultipleDNC" CssClass="styleReqFieldLabel" />
                        </label>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                    <div class="md-input">
                        <asp:TextBox ID="txtStartDateSearch" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                            TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn" Enabled="false"
                            runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                            ErrorMessage="Enter a Start Date" Display="None">
                        </asp:RequiredFieldValidator>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                        </label>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                    <div class="md-input">
                        <asp:TextBox ID="txtEndDateSearch" runat="server"
                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                            TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel" Enabled="false"
                            runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter a End Date"
                            Display="None">
                        </asp:RequiredFieldValidator>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>
                            <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                        </label>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="DvDocumentNumber" visible="false" >
                    <div class="md-input">
                        <uc:Suggest ID="ddlDocumentNumber" runat="server" ServiceMethod="GetDocumentList"
                            AutoPostBack="false" OnItem_Selected="ddlDocumentNo_Item_Selected" />
                        <span class="highlight"></span>
                        <span class="bar"></span>

                        <label>
                            <asp:Label ID="lblDocument_NoNew" runat="server" Text="Deposit Slip Number" CssClass="styleDisplayLabel" />
                        </label>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 5px;" align="right">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <button class="css_btn_enabled" id="btnSearch" title="Search[Alt+S]" onclick="if(fnCheckPageValidators('RFVDTransLander','false'))" causesvalidation="false" onserverclick="btnSearch_Click"
                        runat="server" type="button" accesskey="S">
                        <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                    </button>
                    <button class="css_btn_enabled" id="btnCreate" title="Approve[Alt+A]" causesvalidation="false" onserverclick="btnCreate_Click"
                        runat="server" type="button" accesskey="A">
                        <i class="fa fa-check-circle" aria-hidden="true"></i>&emsp;<u>A</u>pprove
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclientclick="return fnConfirmClear();" causesvalidation="false" onserverclick="btnClear_Click"
                        runat="server" type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="gird">
                        <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                            OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                            RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound" class="gird_details">
                            <Columns>
                                <%--Query Column--%>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Query">
                                    <%--<HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>--%>
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
                                <%--Created by - User ID Column--%>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
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

                    <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="false" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

