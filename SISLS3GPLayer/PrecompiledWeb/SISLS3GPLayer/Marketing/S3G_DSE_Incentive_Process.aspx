<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3G_DSE_Incentive_Process, App_Web_qmqntgub" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        var GridId = "<%=gvLoadMarketingExecutive.ClientID %>";
        var ScrollHeight = 200;

        window.onload = function () {

            //Freeze Header row of grid view
            var grid = document.getElementById(GridId);
            if (grid == null)
                return;

            var gridWidth = 710;//grid.offsetWidth;
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
                gridWidth = parseInt(gridWidth);
            }
            scrollableDiv.style.cssText = "overflow-y:scroll;overflow-x:hidden;height:" + ScrollHeight + "px;width:" + gridWidth + "px";
            scrollableDiv.appendChild(grid);
            parentDiv.appendChild(scrollableDiv);

            //Set focus on selected check box
            var isSelected = "<%=Session["Event"] %>";

            if (isSelected != null && isSelected != "" && isSelected != undefined)
                document.getElementById('<%= Session["Event"] %>').focus();


        }


    </script>
    <script language="javascript" type="text/javascript">
        <%-- function CheckMandatory(invoker) {
            debugger;
            document.getElementById('<%=pnlSalesDtls.ClientID %>').style.visibility = "hidden";
            document.getElementById('<%=pnlUsedDtls.ClientID %>').style.visibility = "hidden";
          //  var row = chk.parentNode.parentNode;

            return true;
        }--%>
    </script>
    <script type="text/javascript">

        function Sales_ItemSelected(sender, e) {
            var hdnClientName = $get('<%= hdnSales.ClientID %>');
            hdnClientName.value = e.get_value();
        }

        function Sales_ItemPopulated(sender, e) {
            var hdnClientName = $get('<%= hdnSales.ClientID %>');
            hdnClientName.value = '';
        }

        function Asset_ItemSelected(sender, e) {
            var hdnIssuedto = $get('<%= hdnAsset.ClientID %>');
            hdnIssuedto.value = e.get_value();
        }
        function Asset_ItemPopulated(sender, e) {
            var hdnClientName = $get('<%= hdnAsset.ClientID %>');
            hdnClientName.value = '';
        }
        function Dealer_ItemSelected(sender, e) {
            var hdnIssuedto = $get('<%= hdnDealer.ClientID %>');
            hdnIssuedto.value = e.get_value();
        }
        function Dealer_ItemPopulated(sender, e) {
            var hdnClientName = $get('<%= hdnDealer.ClientID %>');
            hdnClientName.value = '';
        }
        <%--function Marketting_ItemSelected(sender, e) {
            var hdnMarkettingExecutive = $get('<%= hdnMarkettingExecutive.ClientID %>');
            hdnMarkettingExecutive.value = e.get_value();
        }
        function Marketting_ItemPopulated(sender, e) {
            var hdnMarkettingExecutive_2 = $get('<%= hdnMarkettingExecutive.ClientID %>');
            hdnMarkettingExecutive_2.value = '';
        }--%>
        <%-- function MarkettingSearch_ItemSelected(sender, e) {
            var hdnMarketingSearch = $get('<%= hdnMarketingSearch.ClientID %>');
            hdnMarketingSearch.value = e.get_value();
        }
        --%>
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" Text="Dealer Sales Executive Incentive Process">
                            </asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlHeaderDetails" runat="server" CssClass="stylePanel" BorderWidth="1">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ErrorMessage="Select Line of Business"
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlLOB"
                                                CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDate" runat="server" AutoPostBack="True" OnTextChanged="txtStartDate_TextChanged"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtStartDate" PopupButtonID="imgStartDate"
                                            ID="DSEStartDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Enter the Start Date"
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"
                                                CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
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
                                        <asp:TextBox ID="txtEndDate" AutoPostBack="true" OnTextChanged="txtEndDate_TextChanged" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtEndDate"
                                            PopupButtonID="imgEndDate" ID="DSEEndDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Enter the End Date" ValidationGroup="Ok"
                                                Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEndDate" CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblEndDate" Text="End Date" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Location" ID="lblLocation" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlScheme" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlScheme_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfVddlScheme" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlScheme" InitialValue="0"
                                                ErrorMessage="Select Scheme Type" ValidationGroup="Ok"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Scheme Type" ID="lblScheme" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlDealer" runat="server" ServiceMethod="GetDealerList" AutoPostBack="true" OnItem_Selected="ddlDealer_Item_Selected" IsMandatory="false" />
                                        <asp:HiddenField ID="hdnDealer" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblDealer" Text="Dealer" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlSalesPerson" runat="server" ServiceMethod="GetDealerSalesPersonList" IsMandatory="false" />

                                        <asp:HiddenField ID="hdnSales" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblSales" Text="Sales Executive ID" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAsset" OnTextChanged="txtAssetName_TextChanged"
                                            runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:AutoCompleteExtender ID="autoAssetName" MinimumPrefixLength="1" EnableCaching="false"
                                            runat="server" TargetControlID="txtAsset" OnClientItemSelected="Asset_ItemSelected"
                                            OnClientPopulated="Asset_ItemPopulated"
                                            ServiceMethod="GetAssetName" Enabled="True" CompletionSetCount="1"
                                            CompletionListCssClass="CompletionList" DelimiterCharacters=";,:"
                                            CompletionListItemCssClass="CompletionListItemCssClass"
                                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                            ShowOnlyCurrentWordInCompletionListItem="true">
                                        </cc1:AutoCompleteExtender>
                                        <cc1:TextBoxWatermarkExtender ID="AssetExtender" runat="server" TargetControlID="txtAsset"
                                            WatermarkText="--Select--">
                                        </cc1:TextBoxWatermarkExtender>
                                        <asp:HiddenField ID="hdnAsset" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblAsset" Text="Asset" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>

















                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:HiddenField ID="hdnMarketingSearch" runat="server" />
                                    <asp:Panel ID="pnlMarketingExecutive" runat="server" CssClass="stylePanel" Width="100%" GroupingText="Marketing Executive" Visible="false">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="gvLoadMarketingExecutive" runat="server" Width="100%" AutoGenerateColumns="false" OnRowDataBound="gvLoadMarketingExecutive_RowDataBound" RowStyle-HorizontalAlign="Center">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                                        <tr align="center">
                                                                            <td>
                                                                                <asp:Label runat="server" ID="lblMarkettingExecutive" Text="Marketing Executive" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:TextBox ID="txtSearch" OnTextChanged="txtSearch_TextChanged" runat="server" AutoPostBack="true"></asp:TextBox>

                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Text='<%#Eval("DOCUMENT_NO") %>' runat="server" ID="lblGvMarketingExecutive" />
                                                                    <asp:Label Text='<%#Eval("ID") %>' Visible="false" runat="server" ID="lblgvMarketingExecutiveID" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:Label Text="Select" runat="server" ID="lblsel" />
                                                                    <br></br>
                                                                    <asp:CheckBox ID="chkSelectAll" ToolTip="Select All" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%--<asp:CheckBox ID="chkSelect" ToolTip="Select" runat="server" OnClientClick="return CheckMandatory(this)" />--%>
                                                                    <asp:CheckBox ID="chkSelect" ToolTip="Select" runat="server" OnCheckedChanged="chkSelect_CheckedChanged" AutoPostBack="true" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Ok" runat="server"
                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>
                                <asp:ImageButton ID="btnPrint" CssClass="styleDisplayLabel" Visible="false" ImageUrl="~/Images/pdf.png"
                                    ToolTip="Print,Alt+P" AccessKey="P" Width="22px" Height="22px" runat="server" OnClick="btnPrint_Click" />
                            </div>



                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:CustomValidator ID="CVDSEReport" runat="server"
                                        CssClass="styleMandatoryLabel" Enabled="true" />
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlSalesDtls" runat="server" CssClass="stylePanel" GroupingText="New Cars"
                            Visible="false" BorderWidth="1">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtNewDeal" runat="server" ReadOnly="true"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <asp:Label runat="server" Text="Total No.Of Deal"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divSalesDtls" runat="server" style="overflow: auto;">
                                            <asp:GridView ID="grvDealerSales" runat="server" Width="100%" AutoGenerateColumns="false"
                                                RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader" CellPadding="0"
                                                CellSpacing="0" ShowHeader="true" ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No" HeaderStyle-CssClass="styleGridHeader" ItemStyle-Width="5%">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Proposal No" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProposalNo" runat="server" Text='<%# Bind("ACD_PROPOSAL_NO") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCntNo" runat="server" Text='<%# Eval("CONTRACT_NUMBER") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Branch" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCONTRACT_BRANCH" runat="server" Text='<%# Eval("CONTRACT_BRANCH") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Agreement Date" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAGREEMENT_DATE" runat="server" Text='<%# Eval("AGREEMENT_DATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCUTOMER_NAME" runat="server" Text='<%# Eval("CUTOMER_NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sales Executive Name" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSEName" runat="server" Text='<%# Eval("ACD_DEAL_SAL_EXEC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Marketing Executive Name" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMEN" runat="server" Text='<%# Eval("MAR_DEAL_SAL_EXEC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="ID/Resident Card Number" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblResidentNo" runat="server" Text='<%# Bind("APPLICATION_NUMBER") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dealer Name" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDealerName" runat="server" Text='<%# Bind("DEALER_NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Business Source" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSTM_BUSI_SOURCE_TYPE_DESC" runat="server" Text='<%# Bind("STM_BUSI_SOURCE_TYPE_DESC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Asset" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsset" runat="server" Text='<%# Bind("ASSET_DESC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblAmountFT" runat="server" Text="Total" align="right"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount Financed" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("AMOUNT_FINANCED") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtAmountFT" text-align="right" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tenure" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTenure" runat="server" Text='<%# Bind("INSTALMENTS") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rate" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRate" runat="server" Text='<%# Bind("FLAT_RATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblNewIncentiveFT" runat="server" Text="Total" align="right"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Eligible Incentive Payable" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNewIncentive" runat="server" Text='<%# Bind("ELIGIBILE_INCENTIVE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtNewIncentiveFT" runat="server" ReadOnly="true" align="right"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <uc1:PageNavigator ID="ucCustomPagingNew" runat="server"></uc1:PageNavigator>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlUsedDtls" runat="server" CssClass="stylePanel" GroupingText="Used Cars"
                            BorderWidth="1" Visible="false">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtUsedDeal" runat="server" ReadOnly="true"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Total No.Of Deal"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="div1" runat="server" style="overflow: auto;">
                                            <asp:GridView ID="grvDealerSalesDtls" runat="server" Width="100%" AutoGenerateColumns="false"
                                                RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader" CellPadding="0" CellSpacing="0" ShowHeader="true" ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No" HeaderStyle-CssClass="styleGridHeader" ItemStyle-Width="5%">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCntNo" runat="server" Text='<%# Eval("CONTRACT_NUMBER") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Proposal No" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProposalNo" runat="server" Text='<%# Bind("ACD_PROPOSAL_NO") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sales Executive Name" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSEName" runat="server" Text='<%# Bind("ACD_DEAL_SAL_EXEC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ID/Resident Card Number" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblResidentNo" runat="server" Text='<%# Bind("APPLICATION_NUMBER") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dealer Name" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDealerName" runat="server" Text='<%# Bind("DEALER_NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsset" runat="server" Text='<%# Bind("ASSET_DESC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblAmtFT" runat="server" Text="Total" align="right"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount Financed" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmt" runat="server" Text='<%# Bind("AMOUNT_FINANCED") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtAmtFT" runat="server" align="right" ReadOnly="true"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Model" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblModel" runat="server" Text='<%# Bind("MODEL") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tenure" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTenure" runat="server" Text='<%# Bind("INSTALMENTS") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rate" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRate" runat="server" Text='<%# Bind("FLAT_RATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblIncentiveFT" runat="server" Text="Total" align="right"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Eligible Incentive Payable" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIncentive" runat="server" Text='<%# Bind("ELIGIBILE_INCENTIVE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtIncentiveFT" Style="text-align: right" runat="server"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <uc1:PageNavigator ID="ucCustomPagingUsed" runat="server"></uc1:PageNavigator>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">


                        <label class="tess">
                            <asp:Label runat="server" Text="Total No.Of Deal"></asp:Label>
                        </label>
                        <asp:TextBox ID="txtbox1" runat="server" ReadOnly="true"
                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnexcel" runat="server"
                        type="button" accesskey="E" title="Excel[Alt+E]" causesvalidation="false">
                        <i class="fa fa-file-excel-o btn_i" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView ID="gvDealerIncentiveProcDetails" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvDealerIncentiveProcDetails_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="SNO" HeaderText="S.No">
                                        <ItemStyle Width="5%" Wrap="True" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="SALES_EXEC_NAME" HeaderText="Sales Executive Name">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ID" HeaderText="Id/Resident Card No">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DEALER_NAME" HeaderText="Dealer Name">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ASSET" HeaderText="Asset">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AMT_FINANCED" HeaderText="Amount Financed">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TENURE" HeaderText="Tenure">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RATE" HeaderText="Rate">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ELIGIBLE_INCENT_PAYABLE" HeaderText="Eligible Incentive Payable">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Ok',false))" causesvalidation="false" runat="server"
                        type="button" accesskey="S" validationgroup="Ok">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(return fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(parent.RemoveTab())" causesvalidation="false"  runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
               

            <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsDealer" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true"
                        HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
               </div>
                </div>
                </div>
            
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnexcel" />

        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

