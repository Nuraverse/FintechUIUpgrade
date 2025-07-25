<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptMvntofNPAReport, App_Web_nmps0mjf" title="Movement of NPA Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Summary of Movement in NPA">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlHeaderDetails" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFinacialYearBase" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlFinacialYearBase_SelectedIndexChanged"
                                        ToolTip="Base Financial Years" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFinancialYearBase" runat="server" Text="Financial Years " ToolTip="Base Financial Years"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFromYearMonthBase" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlFromYearMonthBase_SelectedIndexChanged"
                                        ToolTip="Report Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlFromYearMonthBase" runat="server"
                                            ErrorMessage="Select From Year Month" ValidationGroup="Ok" Display="Dynamic"
                                            SetFocusOnError="True" ControlToValidate="ddlFromYearMonthBase" InitialValue="0"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFromYearMonthBase" runat="server" Text="Report Month" CssClass="styleReqFieldLabel" ToolTip="Report Month"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlToYearMonthBase" runat="server"
                                        OnSelectedIndexChanged="ddlToYearMonthBase_SelectedIndexChanged"
                                        AutoPostBack="true" ToolTip="Base To Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlToYearMonthBase" runat="server"
                                            ErrorMessage="Select To Year Month" ValidationGroup="Ok" Display="Dynamic"
                                            SetFocusOnError="True" ControlToValidate="ddlToYearMonthBase"
                                            InitialValue="0" CssClass="validation_msg_box_sapn" Enabled="false"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblToYearMonthBase" runat="server" Text="To Year Month"
                                            CssClass="styleReqFieldLabel" ToolTip="Base To Year Month"> </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="false" ToolTip="Product"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblProduct" runat="server" Text="Product " ToolTip="Product"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlAssetCategory" runat="server" AutoPostBack="false" ToolTip="Asset Category"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblAssetCategory" runat="server" Text="Asset Category" ToolTip="Asset Category"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnOk" onserverclick="btnOk_Click" validationgroup="Ok" runat="server"
                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear, [Alt+L]" onclick="if(fnConfirmClear())"
                    causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                    type="button" causesvalidation="true" accesskey="P" title="Print, [Alt+P]">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="LblCurrency" runat="server" Text="" ToolTip="Currency">
                    </asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlJournalDetails" runat="server" CssClass="stylePanel" GroupingText="Movement in NPA" Width="100%">

                        <div id="divJournalDetails" runat="server" style="height: 350px; width: 100%; overflow-x: scroll; overflow-y: scroll;">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird  gird_details" runat="server" id="GrdDiv">
                                        <%--<table width="100%">
                                            <tr class="gird">
                                                <td id="tdExportDtl" runat="server" visible="false" class="gird_details"></td>
                                            </tr>
                                        </table>--%>
                                        <%--<asp:GridView ID="grvVolumeMIS" OnRowDataBound="grvVolumeMIS_DataBound" 
                                            runat="server" Width="100%" AutoGenerateColumns="true" OnRowCreated="grvVolumeMIS_RowCreated" 
                                            RowStyle-HorizontalAlign="Center" CellPadding="0" CellSpacing="0" ShowFooter="false">
                                        </asp:GridView>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none">
                    <asp:Panel ID="pnlYearSummeryAssetCategory" runat="server" CssClass="stylePanel" GroupingText="Year Summary" Width="100%">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div id="divYearSumAsstCatg" runat="server" style="height: 100px; width: 750px; overflow-x: scroll; overflow-y: scroll;">
                                        <asp:GridView ID="grvYearSumAsstCatgory" runat="server" Width="100%" AutoGenerateColumns="true" RowStyle-HorizontalAlign="Center" CellPadding="0" CellSpacing="0" ShowFooter="false">
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
                    <asp:ValidationSummary ID="vsJournal" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
