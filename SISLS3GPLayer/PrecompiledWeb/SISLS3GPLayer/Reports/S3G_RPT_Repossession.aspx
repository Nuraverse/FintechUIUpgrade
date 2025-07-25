<%@ page title="Repossession Report" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3G_RPT_Repossession, App_Web_dzryruu3" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Repossession Report">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel runat="server" ID="PnlRepreport" CssClass="stylePanel" GroupingText="INPUT CRITERIA"
                            Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            AutoPostBack="True" ValidationGroup="btnGo" ToolTip="Line of Business"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel" ToolTip="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch">
                                            </asp:DropDownList>
                                       <%-- <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                            OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                            IsMandatory="true" ErrorMessage="Select Location" />--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblregion" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" OnTextChanged="txtStartDateSearch_TextChanged"
                                            AutoPostBack="true" ToolTip="Start Date"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="Dynamic" ControlToValidate="txtStartDateSearch"
                                                ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select From Date"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <input id="hidDate" runat="server" type="hidden" />
                                        <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif"
                                            Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="From Date" ToolTip="From Date" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDateSearch" runat="server" OnTextChanged="txtEndDateSearch_TextChanged" AutoPostBack="true" ToolTip="End Date"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="Dynamic" ControlToValidate="txtEndDateSearch"
                                                ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select To Date"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif"
                                            Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="To Date" ToolTip="To Date" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display:none;">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlGaragecNo" runat="server" ServiceMethod="GetGarageWise" AutoPostBack="true"
                                            OnItem_Selected="ddlGaragecNo_SelectedIndexChanged" IsMandatory="false" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblGarage" runat="server" CssClass="styleDisplayLabel" Text="Garage Wise"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                </div>
                                 <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblRepReport" runat="server" CssClass="styleDisplayLabel" Text="Type" ToolTip="Type"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                           
                                        <asp:CheckBox ID="chkRepossession" runat="server" Checked="true" OnCheckedChanged="chkRepossession_CheckedChanged"
                                            AutoPostBack="true" ToolTip="Repossession" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <asp:Label ID="lblAbstract" runat="server" CssClass="styleDisplayLabel" Text="Repossession" ToolTip="Repossession"></asp:Label>

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkReleased" runat="server" OnCheckedChanged="chkReleased_CheckedChanged"
                                            AutoPostBack="true" ToolTip="Released" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <asp:Label ID="lblReleased" runat="server" CssClass="styleDisplayLabel" Text="Released" ToolTip="Released"></asp:Label>

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkReSold" runat="server" OnCheckedChanged="chkReSold_CheckedChanged"
                                            AutoPostBack="true" ToolTip="Re-Sold" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <asp:Label ID="lblResold" runat="server" CssClass="styleDisplayLabel" Text="Re-Sold" ToolTip="ReSold"></asp:Label>

                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
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

                        <asp:Panel ID="PnlDetailedView" runat="server" CssClass="stylePanel" GroupingText="Detailed Report" Width="99%">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divDetails" runat="server">
                                            <asp:GridView ID="GrvDetails" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                CssClass="gird_details" ShowFooter="true" Style="margin-bottom: 0px" Width="98%" OnRowDataBound="GrvDetails_RowDataBound">
                                                <Columns>
                                                    
                                                    <asp:TemplateField HeaderText="Customer Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Customer"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPrimeAccount" runat="server" Text='<%# Bind("PANUM") %>' ToolTip="Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Vehicle No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblVehicle" runat="server" Text='<%# Bind("REGN_NUMBER") %>' ToolTip="Vehicle No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetDesc" runat="server" Text='<%# Bind("ASSET_DESCRIPTION") %>' ToolTip="Asset Description"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Repossession Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRepoDate" runat="server" Text='<%# Bind("Repossession_Date") %>' ToolTip="RepoDate"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Repossession Place">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPlace" runat="server" Text='<%# Bind("Repossession_Place") %>' ToolTip="RepoPlace"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Garage Address" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txtGarageAddress" runat="server" Width="150px" Rows="4" ToolTip="Garage Address"></asp:Label>
                                                            <%-- <asp:TextBox ID="txtGarageAddress" runat="server" Width="255px" Rows="3" TextMode="MultiLine"></asp:TextBox>--%>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Condition">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetCongn" runat="server" Text='<%# Bind("Asset_Condition") %>' ToolTip="Asset Condition"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Release Date">
                                                        <ItemTemplate>
                                                            <%--<asp:Label ID="lblReleaseDate" runat="server" Text='<%# Bind("Repossession_Release_Date") %>' ToolTip="Release Date"></asp:Label>--%>
                                                            <asp:Label ID="lblReleaseDate" runat="server" Text='<%# Bind("RELEASE_DATE") %>' ToolTip="Release Date"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="LRN Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLRNNumber" runat="server" Text='<%# Bind("LRN_NO") %>' ToolTip="LRN Number"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
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
                    <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                        type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Excel
                    </button>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsDis" runat="server" Enabled="false" Visible="false" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                            ShowSummary="true" ValidationGroup="btnGo" />
                    </div>
                </div>
                <%-- <tr>
                    <td>
                        <asp:CustomValidator ID="CVDisbursement" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                    </td>
                </tr>--%>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function Resize() {
            if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null) {
                if (document.getElementById('divMenu').style.display == 'none') {
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                }
                else {
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
                }
            }
        }


        function showMenu(show) {
            if (show == 'T') {

                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "800px";
                    document.getElementById('divGrid1').style.overflow = "scroll";
                }

                document.getElementById('divMenu').style.display = 'Block';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
        }

    </script>
</asp:Content>

