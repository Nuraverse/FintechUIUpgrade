<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptPricing, App_Web_dzryruu3" title="Pricing Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function funExitNew() {




            alert(window.frameElement.id);



            var tabID1 = $(window.frameElement).parents('a').attr('href');
            alert(tabID1);

            $(this).parents('li').remove();
            $(tabID1).remove();



        }




    </script>
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Dynamic Report">
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
                                <asp:DropDownList ID="ddlReprtName" AutoPostBack="true" OnSelectedIndexChanged="ddlReprtName_SelectedIndexChanged" runat="server" CausesValidation="true"
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



                        <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtStoredProcedure" Enabled="false" runat="server" ToolTip="Stored Procedure"
                                    class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
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
                    <div style="display: none" class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtQuerySql" Height="200px" TextMode="MultiLine" runat="server" ToolTip="Sql Query"
                                    class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Sql Query" ID="lblSqlQuery" CssClass="styleReqFieldLabel"
                                        ToolTip="Sql Query">
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
                <asp:Panel ID="pnlReportColumn" runat="server" CssClass="stylePanel" GroupingText="Report Display Column">
                    <div id="div1" runat="server" class="gird" style="height: 400px;">
                        <asp:GridView ID="grvReportColumn" OnRowDataBound="grvReportColumn_RowDataBound" OnSelectedIndexChanged="grvReportColumn_SelectedIndexChanged" OnSelectedIndexChanging="grvReportColumn_SelectedIndexChanging" OnRowDeleting="grvReportColumn_RowDeleting" runat="server" AutoGenerateColumns="false" BorderWidth="2"
                            CssClass="styleInfoLabel" ShowFooter="false" ShowHeader="true" Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="1%" HeaderText="Sl.No.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="1%" Font-Bold="true" HorizontalAlign="Center" />
                                    <HeaderStyle Width="1%" Font-Bold="true" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Display Column">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDColumn" Text='<%#Eval("DColumn")%>'></asp:Label>
                                        <asp:Label runat="server" Visible="false" ID="lblDYNAMICREPORTDISPID" Text='<%#Eval("DYNAMICREPORT_DISP_ID")%>'></asp:Label>
                                        <asp:Label runat="server" Visible="false" ID="lblDYNAMICREPORTHDRID" Text='<%#Eval("DYNAMICREPORT_HDR_ID")%>'></asp:Label>

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
                                <asp:TemplateField Visible="false">
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
                                                OnClick="btnAddReporColumn_Click" Text="Add" ValidationGroup="vgAddColumn" ToolTip="Add[Alt+B]" />
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                    <HeaderStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Move">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkMoveRightAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkMoveRightAll_CheckedChanged" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkMoveRight" AutoPostBack="true" OnCheckedChanged="chkMoveRight_CheckedChanged" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                    <HeaderStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                </asp:TemplateField>


                            </Columns>
                            <SelectedRowStyle BackColor="LightCyan"
                                ForeColor="DarkBlue"
                                Font-Bold="true" />
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
            <div style="display: none" class="col-md-2 md-input">
                <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Move <<=  =>>">
                    <div id="div3" runat="server" class="gird">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <button class="css_btn_enabled" id="btnMoveRight" onserverclick="btnMoveRight_ServerClick" title="Save[Alt+S]" causesvalidation="false" runat="server"
                                    type="submit" accesskey="R">
                                    <i class="fa fa-arrow-right" aria-hidden="true"></i>&emsp;<u></u>
                                </button>
                            </div>
                        </div>
                        <%-- <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <button class="css_btn_enabled" id="btnMoveRightAll" title="Save[Alt+S]" causesvalidation="false" runat="server"
                                    type="submit" accesskey="R">
                                    <i class="fa fa-angle-double-right" aria-hidden="true"></i>&emsp;<u></u>
                                </button>
                            </div>
                        </div>--%>
                    </div>
                    <div id="div4" runat="server" class="gird">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <button class="css_btn_enabled" id="btnMoveLeft" onserverclick="btnMoveLeft_ServerClick" title="Save[Alt+S]" causesvalidation="false" runat="server"
                                    type="submit" accesskey="R">
                                    <i class="fa fa-arrow-left" aria-hidden="true"></i>&emsp;<u></u>
                                </button>
                            </div>
                        </div>
                        <%-- <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <button class="css_btn_enabled" id="btnMoveLeftAll" title="Save[Alt+S]" causesvalidation="false" runat="server"
                                    type="submit" accesskey="R">
                                    <i class="fa fa-angle-double-left" aria-hidden="true"></i>&emsp;<u></u>
                                </button>
                            </div>
                        </div>--%>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-7 md-input">
                <asp:Panel ID="pnlFilterColumn" runat="server" CssClass="stylePanel" GroupingText="Filter Column">
                    <div id="div2" runat="server" class="gird" style="height: 400px;">
                        <asp:GridView ID="grvFilterColumn" OnRowDataBound="grvReportFilterColumn_RowDataBound" OnRowDeleting="grvReportColumnFilter_RowDeleting" runat="server" AutoGenerateColumns="false" BorderWidth="2"
                            CssClass="styleInfoLabel" ShowFooter="false" ShowHeader="true" Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="1%" HeaderText="Move >>">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkMoveLeftAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkMoveLeftAll_CheckedChanged" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkMoveLeft" AutoPostBack="true" OnCheckedChanged="chkMoveLeft_CheckedChanged" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="1%" Font-Bold="true" HorizontalAlign="Center" />
                                    <HeaderStyle Width="1%" Font-Bold="true" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="1%" HeaderText="Sl.No.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                    </ItemTemplate>
                                    <ItemStyle Width="1%" Font-Bold="true" HorizontalAlign="Center" />

                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Display Column">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDisplayColumn" Text='<%#Eval("DISPLAY_NAME")%>'></asp:Label>
                                        <asp:Label runat="server" ID="lblTableColumn" Visible="false" Text='<%#Eval("BACKEND_COLUMN_NAME")%>'></asp:Label>

                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:DropDownList ID="ddlReprtName" runat="server" CausesValidation="true"
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
                                        <asp:Label runat="server" ID="lblCOLUMNDATATYPE" Text='<%#Eval("COLUMN_DATA_TYPE")%>'></asp:Label>
                                        <asp:Label runat="server" Visible="false" ID="lblCOLUMNDATATYPEId" Text='<%#Eval("COLUMN_DATA_TYPE_ID")%>'></asp:Label>

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
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Filter Condition">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlFilterExpr" OnSelectedIndexChanged="ddlFilterExpr_SelectedIndexChanged" AutoPostBack="true" runat="server" CausesValidation="true"
                                            ToolTip="Filter Condition"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="From Value">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtFromValue" Enabled="false" runat="server"
                                            ToolTip="From Value"
                                            class="md-form-control form-control">
                                        </asp:TextBox>
                                      
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="To Value">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtToValue" Enabled="false" runat="server"
                                            ToolTip="To Value"
                                            class="md-form-control form-control">
                                        </asp:TextBox>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false">
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
        <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel"
            Width="100%">
            <div align="left">

                <button class="css_btn_enabled" id="btnExcel" title="Excel[Alt+P]" causesvalidation="false" onserverclick="btnExcel_ServerClick" runat="server"
                    type="button" accesskey="P">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u></u>Excel
                </button>
                <button class="css_btn_enabled" id="btnDataPreView" title="Data Preview[Alt+Q]" causesvalidation="false" onserverclick="btnDataPreView_ServerClick" runat="server"
                    type="button" accesskey="Q">
                    <i class="fa fa-bullseye" aria-hidden="true"></i>&emsp;<u></u>Data Preview
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
            </div>
        </asp:Panel>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlDataPreview" runat="server" CssClass="stylePanel" GroupingText="CheckList Report Details" Visible="false">
                    <div id="divPricing" runat="server" class="gird" style="height: 400px;">
                        <asp:GridView ID="grvDynamicSql" runat="server" OnRowDataBound="grvReportColumn_RowDataBound" AutoGenerateColumns="true" BorderWidth="2"
                            CssClass="styleInfoLabel" ShowFooter="false" ShowHeader="true" Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="SL.NO.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <%-- <asp:Panel ID="pnlExport" runat="server" CssClass="stylePanel" GroupingText="CheckList Report Details" Visible="false">--%>
                <div id="div5" runat="server" class="gird" style="height: 400px; display: none">
                    <asp:GridView ID="grvDynamicSqlExcelExport" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                        CssClass="styleInfoLabel" ShowFooter="false" OnRowDataBound="grvDynamicSqlExcelExport_RowDataBound" ShowHeader="true" Width="100%">
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <%--</asp:Panel>--%>
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




















