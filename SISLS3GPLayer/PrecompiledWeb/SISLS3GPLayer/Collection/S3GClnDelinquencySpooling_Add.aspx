<%@ page language="C#" autoeventwireup="true" inherits="Collection_S3GClnDelinquencySpooling_Add, App_Web_la20gqab" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <asp:Panel ID="pnlType" runat="server" GroupingText="Delinquency Type" CssClass="stylePanel"
                        Width="99%">
                        <div>
                            <asp:RadioButtonList ID="rdDelintype" runat="server" RepeatDirection="Horizontal"
                                OnSelectedIndexChanged="rdDelintype_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="Statutory" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Company" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">
                    <asp:Panel ID="Panel1" runat="server" GroupingText="Delinquency Parameter Details"
                        CssClass="stylePanel" Width="99%">
                        <div>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddllLineOfBusiness" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddllLineOfBusiness_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="ddllLineOfBusiness" InitialValue="0" ErrorMessage="Select a Line of business"
                                                Display="None" ValidationGroup="Submit">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business" CssClass="styleFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" AutoPostBack="True" OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                            ServiceMethod="GetBranchList" IsMandatory="true" ValidationGroup="Submit" ErrorMessage="Select a Location" WatermarkText="--Select--" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" Text="Location"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlYearMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYearMonth_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="ddlYearMonth" InitialValue="0" ErrorMessage="Select the Year Month."
                                                Display="None" Enabled="false">
                                            </asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="ddlYearMonth" InitialValue="0" ErrorMessage="Select a Delinquency Month"
                                                Display="None" ValidationGroup="Submit">
                                            </asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="ddlYearMonth" ErrorMessage="Select a Delinquency Month"
                                                Display="None" ValidationGroup="Submit">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblyearmoth" runat="server" Text="Delinquency Month" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDelinquenctDate" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDelinquenctDate" runat="server" Text="Delinquency Run Date" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div id="Div1" class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:Button ID="btnReport" runat="server" CssClass="styleGridShortButton" Text="Report" AccessKey="R" ToolTip="Report,Alt+R"
                                            OnClick="btnReport_Click" OnClientClick="return fnCheckPageValidators('Submit',false);" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">
                    <asp:Panel ID="pnlSpoolingDetails" runat="server" GroupingText="Delinquency Spooling Details"
                        CssClass="stylePanel" Width="99%" Visible="false">
                        <div>
                            <div class="row">
                                <div style="overflow-x: auto; overflow-y: auto; height: 220px; border-bottom-width: thin"
                                    class="styleContentTable" id="divSpool" runat="server" visible="false">
                                    <asp:GridView ID="grvDelinquencyspooling" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                        AutoGenerateColumns="false" OnRowDataBound="grvDelinquencyspooling_RowDataBound"
                                        Width="100%" Visible="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("SlNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location" ItemStyle-Width="7%" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Branch") %>' ToolTip="Location"></asp:Label>
                                                    <asp:Label ID="lblBranchID" runat="server" Text='<%# Bind("Branch_ID") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomer" runat="server" Text='<%# Bind("Customer") %>' ToolTip="Customer"></asp:Label>
                                                    <asp:Label ID="lblCustomerID" runat="server" Text='<%# Bind("Customer_ID") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prime Account Number" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PANum") %>' ToolTip="PANumber"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sub Account Number" ItemStyle-Width="14%" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SANum") %>' ToolTip="SANumber"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="No.of Installments" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoOfIns" runat="server" Text='<%# Bind("No_of_Installment") %>'
                                                        ToolTip="No.of Installments" Style="padding-right: 10px"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Principal Due" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrincipalDue" runat="server" Text='<%# Bind("PrincipalDue") %>'
                                                        ToolTip="Principal Due"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Interest Due" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInterestDue" runat="server" Text='<%# Bind("Income_Deferred") %>'
                                                        ToolTip="Interest Due"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Future Principal" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFuturePrincipal" runat="server" Text='<%# Bind("FutPrincipal") %>'
                                                        ToolTip="Future Principal"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Due Amount" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDueAmount" runat="server" Text='<%# Bind("Due_Amount") %>' ToolTip="Due Amount"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Market/SLM Value" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMarketValue" runat="server" Text='<%# Bind("TotalAssetValue") %>'
                                                        ToolTip="Market/SLM Value"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Secured Principal" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSecuredPrincipal" runat="server" Text='<%# Bind("Secure_Amt") %>'
                                                        ToolTip="Secured Principal"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UnSecured Principal">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnSecurePrincipal" runat="server" Text='<%# Bind("Unsecure_Amt") %>'
                                                        ToolTip="UnSecured Principal"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Provision">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProvision" runat="server" Text='<%# Bind("Provision") %>' ToolTip="Provision"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Income Deferred" ItemStyle-Width="9%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIncomeDeferred" runat="server" Text='<%# Bind("Income_Deferred") %>'
                                                        ToolTip="Unsecured"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Secured Provisioning" ItemStyle-Width="9%" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSecured" runat="server" Text='<%# Bind("Secured") %>' ToolTip="Secured"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unsecured Provisioning" ItemStyle-Width="9%" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnsecured" runat="server" Text='<%# Bind("Unsecured") %>' ToolTip="Unsecured"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Other Income" ItemStyle-Width="9%" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOtherIncome" runat="server" Text='<%# Bind("Other_Income") %>'
                                                        ToolTip="Unsecured"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div style="overflow-x: auto; overflow-y: auto; height: 220px; border-bottom-width: thin">
                                    <asp:Panel ID="pnlLeasing" runat="server" GroupingText="Leasing Details"
                                        CssClass="stylePanel">
                                        <div>
                                            <asp:GridView ID="grvDelinq" OnRowDataBound="grvTEst_RowDataBound" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                AutoGenerateColumns="true"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("SlNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <div style="overflow-x: auto; overflow-y: auto; height: 220px; border-bottom-width: thin">
                                    <asp:Panel ID="pnlFactoring" runat="server" GroupingText="Factoring Details"
                                        CssClass="stylePanel" Width="99%">
                                        <div>
                                            <asp:GridView ID="grvFac" OnRowDataBound="grvFac_RowDataBound" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                AutoGenerateColumns="true"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("SlNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row" style="float: right; margin-top: 5px;">
                    <button class="css_btn_enabled" id="btnExecl" title="Leasing Excel[Alt+E]" causesvalidation="false"
                        onserverclick="btnExecl_Click" runat="server"
                        type="button" accesskey="E">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Leasing <u>E</u>xcel
                    </button>
                    <button class="css_btn_enabled" id="btnFacExcel" title="Factoring Excel[Alt+F]" causesvalidation="false"
                        onserverclick="btnFacExcel_Click" runat="server"
                        type="button" accesskey="F">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>F</u>actoring Excel
                    </button>
                    <button class="css_btn_enabled" id="btnFlatFile" title="Flat File[Alt+E]" causesvalidation="false"
                        onserverclick="btnFlatFile_Click" runat="server"
                        type="button" accesskey="F" visible="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>F</u>lat File
                    </button>
                    <asp:Button ID="btnEmail" runat="server" CssClass="styleGridShortButton" Text="Email" AccessKey="M" ToolTip="Email,Alt+M"
                        OnClick="btnEmail_Click" Visible="false" />
                </div>
                <div class="row">
                    <span id="lblErrorMessage" runat="server" style="color: Red; font-size: medium"></span>
                </div>
                <div id="Div2" class="row" runat="server" visible="false">
                    <asp:Button ID="btnSave" runat="server" CausesValidation="False" CssClass="styleSubmitButton" AccessKey="S" ToolTip="Save,Alt+S"
                        Text="Save" OnClientClick="return fnCheckPageValidators('Submit');" OnClick="btnSave_Click"
                        ValidationGroup="Submit" />
                    <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton" AccessKey="L" ToolTip="Clear,Alt+L"
                        Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton" AccessKey="X" ToolTip="Exit,Alt+X"
                        Text="Exit" OnClick="btnCancel_Click" OnClientClick="return fnConfirmExit();" />
                </div>
                <div class="row" style="display: none;">
                    <asp:ValidationSummary ID="lblsErrorMessage" runat="server" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="Submit" />
                    <asp:CustomValidator ID="cvDelinq" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" Width="98%" ValidationGroup="Submit" Display="None" />
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnFlatFile" />
            <asp:PostBackTrigger ControlID="btnExecl" />
            <asp:PostBackTrigger ControlID="btnFacExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <div>
        <div class="row">
            <asp:Panel ID="PnlLetterPreview" Style="display: none" runat="server" Height="80%"
                BackColor="White" BorderStyle="Solid" BorderColor="Black" Width="50%">
                <div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtTo" ReadOnly="false" EnableTheming="true" runat="server" Width="99%"
                                    MaxLength="12"></asp:TextBox>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="To" ID="lblTo" CssClass="styleDisplayLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtSubject" runat="server" Width="99%" Text="Delinquency Spooling"
                                    ReadOnly="False"></asp:TextBox>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Subject" ID="lblSubject" CssClass="styleDisplayLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtBody" TextMode="MultiLine" runat="server" Width="99%" Height="300px"
                                    ReadOnly="False"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <asp:Button runat="server" ID="btnSendMail" Text="Send Mail" OnClick="btnSendMail_Click" AccessKey="D" ToolTip="Send Mail,Alt+D"
                            CausesValidation="False" CssClass="styleSubmitButton" />
                        <asp:Button ID="btnClose" runat="server" Text="Exit" CssClass="styleSubmitButton" AccessKey="T" ToolTip="Exit,Alt+T"
                            OnClick="btnClosePreview_Click" />
                        <asp:Button ID="btnModal" runat="server" Width="0px" Height="0px" />
                        <cc1:ModalPopupExtender ID="ModalPopupExtenderMailPreview" runat="server" TargetControlID="btnModal"
                            PopupControlID="PnlLetterPreview" BackgroundCssClass="styleModalBackground" DynamicServicePath=""
                            Enabled="True">
                        </cc1:ModalPopupExtender>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <script language="javascript" type="text/javascript">

        function Resize() {
            if (document.getElementById('divSpool') != null) {
                if (document.getElementById('divMenu').style.display == 'none') {
                    (document.getElementById('divSpool')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
                    //(document.getElementById('ctl00_ContentPlaceHolder1_grvDelinquencyspooling')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                }
                else {
                    (document.getElementById('divSpool')).style.width = screen.width - 280;
                    //(document.getElementById('ctl00_ContentPlaceHolder1_grvDelinquencyspooling')).style.width = screen.width - 300;
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

                if (document.getElementById('divSpool') != null)
                    (document.getElementById('divSpool')).style.width = screen.width - 280;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                if (document.getElementById('divSpool') != null)
                    (document.getElementById('divSpool')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
        }

    </script>

</asp:Content>
