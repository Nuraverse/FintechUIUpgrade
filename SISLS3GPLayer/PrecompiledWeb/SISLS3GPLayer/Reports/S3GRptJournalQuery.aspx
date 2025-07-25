<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptJournalQuery, App_Web_qvacefhr" title="Journal Query" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        var GridId = "<%=grvJournalDetails.ClientID %>";
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

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }

    </script>

    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Journal Query Report">
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
                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" ToolTip="Line of Business"
                                    OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ErrorMessage="Select Line of Business"
                                        ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" InitialValue="-1"
                                        ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel" ToolTip="Line of Business">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true"
                                    ToolTip="Location1" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Location1" ID="lblBranch" ToolTip="Location" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLocation2" runat="server" AutoPostBack="true" ToolTip="Location2"
                                    Enabled="false" OnSelectedIndexChanged="ddlLocation2_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Location2" ID="lblLocation2" ToolTip="Location2" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountno" runat="server" visible="true">
                            <div class="md-input">
                                <%--<uc:Suggest ID="ucAccountLov" runat="server" ServiceMethod="GetAccuntNoList" AutoPostBack="true" />--%>
                                <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                    Style="display: none;" MaxLength="100"></asp:TextBox>
                                <uc4:icm id="ucAccountLov" onblur="fnLoadAccount()" runat="server" autopostback="true" 
                                    showhideaddressimagebutton="false" dispalycontent="Both" onitem_selected="ucAccountLov_Item_Selected"                                    
                                    strlov_code="ACC_REPORT_0_2" servicemethod="GetAccuntNoList" class="md-form-control form-control" />
                                <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" 
                                    UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                    Style="display: none" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblPNum" CssClass="styleDisplayLabel"
                                        Text="Account Number" ToolTip="Account Number"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlSNum" runat="server" Width="65%" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlSNum_SelectedIndexChanged" ToolTip="Sub Account Number"
                                    Visible="false" class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblSNum" Text="Sub Account Number" CssClass="styleDisplayLabel" ToolTip="Sub Account Number" Visible="false"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLAN" runat="server" Width="65%" ToolTip="Lease Asset Number" Enabled="false" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlLAN_SelectedIndexChanged"
                                    Visible="false" class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblLAN" CssClass="styleDisplayLabel" Text="Lease Asset Number" ToolTip="Lease Asset Number" Enabled="false" Visible="false"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlGLAccount" runat="server" AutoPostBack="true"
                                    ToolTip="GL Account" OnSelectedIndexChanged="ddlGLAccount_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblGLAccount" Text="GL Account" CssClass="styleDisplayLabel" ToolTip="GL Account"></asp:Label>
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
                                    <asp:Label runat="server" Text="Denomination" ID="lblDenomination" CssClass="styleDisplayLabel" ToolTip="Denomination">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtStartDate" runat="server"
                                    class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtStartDate" PopupButtonID="imgStartDate" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Enter the Start Date." ValidationGroup="Ok"
                                        Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"
                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Start Date" ID="lblStartDate" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtEndDate" runat="server"
                                    class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEndDate" PopupButtonID="imgEndDate" ID="CalendarExtender2" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Enter the End Date."
                                        ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEndDate"
                                        CssClass="validation_msg_box_sapn">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="End Date" ID="lblEndDate" CssClass="styleReqFieldLabel">
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
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
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
                <asp:Panel ID="pnlJournalDetails" runat="server" CssClass="stylePanel" GroupingText="Journal Details" Width="100%" Visible="false">
                    <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <div id="divJournalDetails" runat="server" style="overflow: auto; height: 300px; display: none">
                                    <asp:GridView ID="grvJournalDetails" runat="server" Width="100%" OnRowDataBound="gv_Narration" AutoGenerateColumns="false" FooterStyle-HorizontalAlign="Right" RowStyle-HorizontalAlign="Center" CellPadding="0" CellSpacing="0" ShowFooter="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Doc Date" ItemStyle-Width="70px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocDate" runat="server" Text='<%# Bind("DocumentDate") %>'></asp:Label>
                                                    <asp:HiddenField ID="HidNarration" Value='<%#Bind("Narration") %>' runat="server" />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total" Font-Bold ="true"></asp:Label>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                                <FooterStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Value Date" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvaluedate" runat="server" Text='<%# Bind("ValueDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Doc Reference">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocumentReference" runat="server" Text='<%# Bind("DocumentReference") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GL – SUBGL">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGLAccount" runat="server" Text='<%# Bind("GlAccount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PrimeAccountNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sub Account No" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SubAccountNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LAN">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLAN" runat="server" Text='<%# Bind("Lan") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Debit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDues" runat="server" Text='<%# Bind("Dues") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalDues" runat="server" ToolTip="sum of Dues Amount" Font-Bold ="true"></asp:Label>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Credit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceipts" runat="server" Text='<%# Bind("Receipts") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalReceipts" runat="server" ToolTip="sum of  Receipts Amount" Font-Bold ="true"></asp:Label>
                                                </FooterTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>

                                            <%--  <asp:TemplateField HeaderText="Balance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBALANCE" runat="server" Text='<%# Bind("BALANCE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblBALANCEF" runat="server" ToolTip="sum of  Balance Amount"></asp:Label>        
                                    </FooterTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" validationgroup="Print" runat="server"
                type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P" visible="false">
                <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary ID="vsJournal" runat="server" Visible="false" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="CVJournalDetails" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
            </div>
        </div>
    </div>
</asp:Content>


