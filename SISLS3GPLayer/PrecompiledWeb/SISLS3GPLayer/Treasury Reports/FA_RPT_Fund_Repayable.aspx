<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_Reports_FA_RPT_Fund_Repayable, App_Web_u0nem2mh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var GridId = "<%=grvRepayable.ClientID %>";
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


            var dummyFooter = document.createElement('div');
            dummyFooter.innerHTML = dummyHeader.innerHTML;
            var footertr = grid.rows[grid.rows.length - 1];
            //grid.deleteRow(grid.rows.length - 1);
            gridHeight = grid.offsetHeight;
            if (gridHeight < ScrollHeight)
                ScrollHeight = gridHeight;
            scrollableDiv.style.height = ScrollHeight + 'px';
            dummyFooter.getElementsByTagName('Table')[0].deleteRow(0);
            dummyFooter.getElementsByTagName('Table')[0].appendChild(footertr);
            gridRow = dummyHeader.getElementsByTagName('Table')[0].getElementsByTagName('TR')[0];
            for (var i = 0; i < footertr.cells.length; i++) {
                var width;
                if (headerCellWidths[i] > gridRow.getElementsByTagName('TH')[i].offsetWidth) {
                    width = headerCellWidths[i];
                }
                else {
                    width = gridRow.getElementsByTagName('TH')[i].offsetWidth;
                }
                footertr.cells[i].style.width = parseInt(width - 3) + 'px';
            }
            parentDiv.appendChild(dummyFooter);

        }
    </script>
    <asp:UpdatePanel ID="dd" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Fund Repayable Report" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="cmbFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" Width="170px" AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="cmbFunder_SelectedIndexChanged" ToolTip="Funder">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFunder" runat="server" ControlToValidate="cmbFunder"
                                                    InitialValue="--Select--" ErrorMessage="Select Funder" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblFunder" runat="server" Text="Funder" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server"  ID="txtFrmDate" AutoPostBack="true" OnTextChanged="txtFrmDate_TextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true" ToolTip="From Date"></asp:TextBox>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFrmDate"
                                                PopupButtonID="txtDate" ID="CalendarFrmDate" Enabled="True">
                                            </cc1:CalendarExtender>

                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFrmDate"
                                                    ErrorMessage="Select From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblDate" Text="From Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server"  ID="txtToDate" ToolTip ="To Date"
                                                AutoPostBack="True" OnTextChanged="txtEndDateSearch_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtToDate"
                                                PopupButtonID="txtDate" ID="CalendarToDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtToDate"
                                                    ErrorMessage="Select To Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblToDate" Text="To Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                            type="button" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" visible="false" id="btnCancel" title="Exit the pagel[Alt+X]"
                            causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <button class="css_btn_enabled" id="btnexcel" runat="server"
                            type="button" accesskey="E" onserverclick="btnexcel_Click" title="Export to Excel,Alt+Shift+E" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xport to Excel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="Main" runat="server" ValidationGroup="vgGo" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlGrid" runat="server" GroupingText="Grid Details" CssClass="stylePanel">
                                <div style="overflow: auto; height: 300px">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvRepayable" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                    CssClass="styleInfoLabel" OnRowDataBound="grvRepayable_RowDataBound" Width="100%"
                                                    ShowHeader="true" HeaderStyle-HorizontalAlign="Center" ShowFooter="true">
                                                </asp:GridView>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnexcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
