<%@ page title="Liquidity Risk Report" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_Rpt_LiquidityRisk, App_Web_u0nem2mh" %>

<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="Liquidity Risk Report" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlType" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Based On Maturity" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Based On Source" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlType" runat="server" ControlToValidate="ddlType"
                                        Display="Dynamic" ErrorMessage="Select Maturity or Source" SetFocusOnError="True"
                                        ValidationGroup="Go" CssClass="validation_msg_box_sapn" InitialValue="0" />
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblMaturityorSource" Text="Maturity/Source" CssClass="styleReqFieldLabel" />
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtCutoffDateSearch" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                <cc1:CalendarExtender ID="CalendarExtenderDateSearch" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    TargetControlID="txtCutoffDateSearch">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtCutoffDateSearch"
                                        Display="Dynamic" ErrorMessage="Select Date" SetFocusOnError="True"
                                        ValidationGroup="Go" CssClass="validation_msg_box_sapn" />
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Cutoff Date" ID="lblStartDateSearch" CssClass="styleReqFieldLabel" />
                                </label>
                            </div>
                        </div>


                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
            </button>
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
            <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server" visible="false"
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
                <asp:Panel ID="pnlGrid" runat="server" CssClass="stylePanel" GroupingText="Risk Details"
                    Width="100%" Visible="false">
                    <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird  gird_details" runat="server" id="GrdDiv">
                                <asp:GridView ID="gvLiquidityRiskDetails" runat="server" AutoGenerateColumns="true" CssClass="styleInfoLabel" Width="99%" Visible="false">
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>

    </div>
</asp:Content>












