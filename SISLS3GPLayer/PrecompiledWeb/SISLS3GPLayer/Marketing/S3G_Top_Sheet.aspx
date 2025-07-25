<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Reports_S3G_Top_Sheet, App_Web_ct41cc2n" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>

            <script type="text/javascript">
                function fnLoadCust() {
                    document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
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
                        <asp:Panel ID="pnlAppProcessRpt" runat="server" GroupingText="Top Sheet Details" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLOB">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" ToolTip="Line of Business"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLocation">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ComboBoxBranchSearch" runat="server" ToolTip="Branch"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="Div_ddlPNum" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlPNum" runat="server" ToolTip="Account Number" ServiceMethod="GetAccountNo" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblPNum" CssClass="styleDisplayLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divCustomerCode" runat="server">
                                    <div class="md-input">
                                        <span class="highlight"></span>
                                        <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" ToolTip="Customer Code / Name" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="false"
                                            AutoPostBack="true" DispalyContent="Both" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" IsMandatory="true"
                                           ErrorMessage="Select Customer Name" Enabled="true" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                            Style="display: none" />
                                        <a href="#" onclick="window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromApplication=Yes&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=no,scrollbars=yes,top=150,left=100');return false;"></a>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code / Name" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <%--    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divCustomerName" runat="server">
                                    <div class="md-input">
                                        <uc:Suggest ID="ucCustomerName" runat="server" ToolTip="Customer Name" IsMandatory="true" ValidationGroup="GO" ErrorMessage="Select Customer Name"
                                            ServiceMethod="GetClientCodeList" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>--%>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="ImgBtnExcel" onserverclick="ImgBtnExcel_Click"
                        runat="server" validationgroup="GO" type="button" causesvalidation="true" accesskey="A" title="Excel,Alt+A">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i></i>&emsp;<u>E</u>xcel
                    </button>
                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L" title="Clear, Alt+L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                        <%-- <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />--%>
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

