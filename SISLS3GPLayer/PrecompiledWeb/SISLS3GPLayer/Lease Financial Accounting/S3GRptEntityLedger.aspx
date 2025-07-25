<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptEntityLedger, App_Web_vhgjxht5" title="Entity Ledger" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        var GridId = "<%=grvVendorDetails.ClientID %>";
        var ScrollHeight = 300;
        window.onload = function () {

            var grid = document.getElementById(GridId);
            if (grid == null)
                return;

            var gridWidth = grid.offsetWidth;
            var gridHeight = grid.offsetHeight;
            var headerCellWidths = new Array();
            for (var i = 0; i < grid.getElementsByTagName("TH").length; i++) {
                headerCellWidths[i] = grid.getElementsByTagName("TH")[i].offsetWidth;
            }
            grid.parentNode.appendChild(document.createElement("div"));
            var parentDiv = grid.parentNode;

            var table = document.createElement("table");
            for (i = 0; i < grid.attributes.length; i++) {
                if (grid.attributes[i].specified && grid.attributes[i].name != "id") {
                    table.setAttribute(grid.attributes[i].name, grid.attributes[i].value);
                }
            }
            table.style.cssText = grid.style.cssText;
            table.style.width = gridWidth + "px";
            table.appendChild(document.createElement("tbody"));
            table.getElementsByTagName("tbody")[0].appendChild(grid.getElementsByTagName("TR")[0]);
            var cells = table.getElementsByTagName("TH");

            var gridRow = grid.getElementsByTagName("TR")[0];
            for (var i = 0; i < cells.length; i++) {
                var width;
                if (headerCellWidths[i] > gridRow.getElementsByTagName("TD")[i].offsetWidth) {
                    width = headerCellWidths[i];
                }
                else {
                    width = gridRow.getElementsByTagName("TD")[i].offsetWidth;
                }
                cells[i].style.width = parseInt(width - 3) + "px";
                gridRow.getElementsByTagName("TD")[i].style.width = parseInt(width - 3) + "px";
            }
            parentDiv.removeChild(grid);

            var dummyHeader = document.createElement("div");
            dummyHeader.appendChild(table);
            parentDiv.appendChild(dummyHeader);
            var scrollableDiv = document.createElement("div");
            if (parseInt(gridHeight) > ScrollHeight) {
                gridWidth = parseInt(gridWidth) + 17;
            }
            scrollableDiv.style.cssText = "overflow:auto;height:" + ScrollHeight + "px;width:" + gridWidth + "px";
            scrollableDiv.appendChild(grid);
            parentDiv.appendChild(scrollableDiv);
        }
    </script>
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Entity Ledger Report">
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
                                    <asp:DropDownList ID="ddlEntityType" runat="server" AutoPostBack="true" ToolTip="Entity Type" OnSelectedIndexChanged="ddlEntityType_SelectedIndexChanged" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvEntitytype" runat="server" ErrorMessage="Select the Entity Type"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                            ControlToValidate="ddlEntityType"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEntityType" runat="server" Text="Entity Type" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <%--<asp:DropDownList ID="ddlEntityName" ToolTip="Entity Name" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEntityName_SelectedIndexChanged"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>--%>
                                    <uc:Suggest ID="ddlEntityName" runat="server" ServiceMethod="GetVendorsList" ToolTip="Client Name" class="md-form-control form-control" />
                                    <%--<div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvEntityName" runat="server" ErrorMessage="Select Entity Name" ValidationGroup="Ok" Display="Dynamic"
                                            SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlEntityName" CssClass="validation_msg_box_sapn">
                                        </asp:RequiredFieldValidator>
                                    </div>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Entity Name" ToolTip="Entity Name" ID="lblEntityName" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDenomination" runat="server" ToolTip="Denomination"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Denomination" ToolTip="Denomination" ID="lblDenomination" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtStartDate" ToolTip="Start Date" runat="server"
                                        class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                    <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                        Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtStartDate" PopupButtonID="imgStartDate" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Select Start Date" ValidationGroup="Ok"
                                            Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Start Date" ToolTip="Start Date" ID="lblStartDate" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEndDate" runat="server" ToolTip="End Date"
                                        class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                    <cc1:CalendarExtender runat="server" TargetControlID="txtEndDate"
                                        ID="CalendarExtender2">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Select End Date"
                                            ValidationGroup="Ok" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" ControlToValidate="txtEndDate">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="End Date" ToolTip="End Date" ID="lblEndDate" CssClass="styleReqFieldLabel">
                                        </asp:Label>
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
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                    causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlVendorDetails" runat="server" CssClass="stylePanel" GroupingText="Entity Ledger" Width="100%" Visible="false">
                        <asp:Label ID="lblOpeningBalance" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                        <%--  <div id="divVendorDetails" runat="server" style="overflow: auto; height: 300px; display: none">--%>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="grvVendorDetails" runat="server" Width="100%" AutoGenerateColumns="false" FooterStyle-HorizontalAlign="Right" RowStyle-HorizontalAlign="Center" CellPadding="0" CellSpacing="0" ShowFooter="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Account No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PrimeAccountNo") %>' ToolTip="Account Number"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SubAccountNo") %>' ToolTip="Sub Account Number"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Doc. Date" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocDate" runat="server" Text='<%# Bind("DocumentDate") %>' ToolTip="Document Date"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Value Date" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvaluedate" runat="server" Text='<%# Bind("ValueDate") %>' ToolTip="Value Date"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Doc. Reference">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocumentReference" runat="server" Text='<%# Bind("DocumentReference") %>' ToolTip="Document Reference Number"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cashflow Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCashflow" runat="server" Text='<%# Bind("CASHFLOW_DESC") %>' ToolTip="Cashflow Description"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldesc" runat="server" Text='<%# Bind("Description") %>' ToolTip="Description"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total" ToolTip="Grand Total" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Debit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDues" runat="server" Text='<%# Bind("Dues") %>' ToolTip="Debit"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalDues" runat="server" ToolTip="sum of Dues Amount" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Credit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceipts" runat="server" Text='<%# Bind("Receipts") %>' ToolTip="Credit"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalReceipts" runat="server" ToolTip="sum of  Receipts Amount" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance") %>' ToolTip="Balance"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalBalance" runat="server" ToolTip="sum of Balance Amount" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <%-- </div>--%>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                    type="button" accesskey="P" validationgroup="Print" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsVendor" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok"
                        Enabled="false" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:CustomValidator ID="CVVendorDetails" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
