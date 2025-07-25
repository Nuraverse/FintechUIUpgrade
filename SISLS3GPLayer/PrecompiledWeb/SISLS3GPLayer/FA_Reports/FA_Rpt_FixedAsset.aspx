<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FAFixedAssetReport_Report, App_Web_ygb51gin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagName="PageNavigator" TagPrefix="uc2" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="UC" TagName="Suggest"  Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Fixed Asset Register Report" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                            <div class="row">

                                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAssetgroup" runat="server" ToolTip="Asset Group"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAssetGroup" runat="server" Text="Asset Group" ToolTip="Asset Group" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12" style="display: none">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" onmouseover="txt_MouseoverTooltip(this)" Visible="false" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="From Date" Visible="false" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>


                                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtToDateSearch" runat="server"
                                            MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="ceToDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="txtToDateSearch" TargetControlID="txtToDateSearch">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtToDate" runat="server" ControlToValidate="txtToDateSearch"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                ErrorMessage="Enter Cutoff Month" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStartDate" runat="server" Text="Cut off Month"></asp:Label>
                                        </label>
                                    </div>
                                </div>


                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Main" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="BtnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="BtnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <button class="css_btn_enabled" id="BtnPrint" title="Download Excel[Alt+O]" causesvalidation="false"
                        runat="server" type="button" accesskey="O" onserverclick="BtnPrint_Click">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;D<u>o</u>wnload Excel
                    </button>
                    <%--<asp:ImageButton ID="BtnPrint" CssClass="styleDisplayLabel" Visible="false" OnClick="BtnPrint_Click" ImageUrl="~/Images/ExcelExport10.png"
                        Width="30px" Height="30px" runat="server" ToolTip="Export to Excel" />--%>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlAssetDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fixed Asset Register Report Details">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divTransaction" runat="server" style="display: none">

                                            <asp:GridView ID="grvtransaction" OnRowDataBound="grvTransLander_RowDataBoundExcel" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                CssClass="styleInfoLabel" Width="100%" ShowFooter="false" ShowHeader="true">
                                            </asp:GridView>
                                        </div>
                                        <uc2:PageNavigator ID="ucCustomPaging" runat="server"></uc2:PageNavigator>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsBankBook" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:CustomValidator ID="cvBankBook" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
    
</asp:Content>






