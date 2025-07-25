<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptPricing, App_Web_qvacefhr" title="Pricing Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Dynamic Report Defination">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlInward" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                    Width="100%">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlReprtName" runat="server" CausesValidation="true"
                                    ToolTip="Report Name"
                                    class="md-form-control form-control">
                                </asp:DropDownList>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Report Name" ID="lblReportName" CssClass="styleReqFieldLabel" ToolTip="Report Name">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="ddlStoredProcedure" runat="server"
                                    ToolTip="Stored Procedure"
                                    class="md-form-control form-control">
                                </asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Stored Procedure" ID="lblStoredProcedure" CssClass="styleDisplayLabel"
                                        ToolTip="Stored Procedure">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 md-input">
                <asp:Panel ID="pnlReportColumn" runat="server" CssClass="stylePanel" GroupingText="Report Column">
                    <div id="div1" runat="server" class="gird" style="height: 400px;">
                        <asp:GridView ID="grvReportColumn" OnRowDataBound="grvReportColumn_RowDataBound" OnRowDeleting="grvReportColumn_RowDeleting" runat="server" AutoGenerateColumns="false" BorderWidth="2"
                            CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Display Column">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDColumn" Text='<%#Eval("DColumn")%>'></asp:Label>

                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:DropDownList ID="ddlReprtName" runat="server" CausesValidation="true"
                                                ToolTip="Report Name"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlReprtName" runat="server" InitialValue="0" ControlToValidate="ddlReprtName"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Report Name" ValidationGroup="vgAddColumn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" Visible="false" HeaderText="Table Column">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTColumn" Text='<%#Eval("TColumn")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table width="50%">
                                            <tr>
                                                <%--<td>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                        CommandName="Edit" CausesValidation="false" CssClass="grid_btn"></asp:LinkButton>
                                                </td>--%>
                                                <td>
                                                    <asp:LinkButton ID="lnkRemove" runat="server" ToolTip="Delete [Alt+2]" Text="Delete" CommandName="Delete"
                                                        OnClientClick="return confirm('Are you sure want to delete?');" AccessKey="2" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <%-- <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CssClass="grid_btn" CommandName="Update"
                                                        ValidationGroup="Footer" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="grid_btn" CommandName="Cancel"
                                                        CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>--%>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:Button ID="btnAdd" runat="server" AccessKey="B" CssClass="grid_btn"
                                                OnClick="btnAddReporColumn_Click" Text="Add" ValidationGroup="vgAddColumn" ToolTip="Add[Alt+B]" />
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                    <HeaderStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>

            <div class="col-md-5 md-input">
                <asp:Panel ID="pnlFilterColumn" runat="server" CssClass="stylePanel" GroupingText="Filter Column">
                    <div id="div2" runat="server" class="gird" style="height: 400px;">

                        <asp:GridView ID="grvFilterColumn" OnRowDataBound="grvReportFilterColumn_RowDataBound" OnRowDeleting="grvReportColumnFilter_RowDeleting" runat="server" AutoGenerateColumns="false" BorderWidth="2"
                            CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Display Column">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDColumn" Text='<%#Eval("DColumn")%>'></asp:Label>

                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:DropDownList ID="ddlReprtName" runat="server" CausesValidation="true"
                                                ToolTip="Report Name"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlReprtName" runat="server" InitialValue="0" ControlToValidate="ddlReprtName"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Report Name" ValidationGroup="vgAddFilterColumn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Data Type">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblFilterId" Text='<%#Eval("FilterId")%>'></asp:Label>

                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:DropDownList ID="ddlDataType" runat="server" CausesValidation="true"
                                                ToolTip="Report Name"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlDataType" runat="server" InitialValue="0" ControlToValidate="ddlDataType"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Report Name" ValidationGroup="vgAddFilterColumn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table width="50%">
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lnkRemove" runat="server" ToolTip="Delete [Alt+2]" Text="Delete" CommandName="Delete"
                                                        OnClientClick="return confirm('Are you sure want to delete?');" AccessKey="2" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:Button ID="btnAdd" runat="server" AccessKey="B" CssClass="grid_btn"
                                                OnClick="btnAddReportFilterColumn_Click" Text="Add" ValidationGroup="vgAddFilterColumn" ToolTip="Add[Alt+B]" />
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                    <HeaderStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
        </div>
  
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlPricingDet" runat="server" CssClass="stylePanel" GroupingText="CheckList Report Details" Visible="false">
                    <div id="divPricing" runat="server" class="gird" style="height: 400px;">
                        <asp:GridView ID="grvDynamicSql" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                            CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%">
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <%-- <button class="css_btn_enabled" id="BtnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="BtnPrint_Click" runat="server"
                type="button" accesskey="P" visible="false">
                <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
            </button>--%>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary ID="VSPricing" runat="server" CssClass="styleMandatoryLabel" Visible="false"
                    CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Go" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="cvPricing" runat="server" CssClass="styleMandatoryLabel" Display="None" Enabled="true" />
            </div>
        </div>
    </div>
</asp:Content>




















