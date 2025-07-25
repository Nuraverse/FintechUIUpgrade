<%@ page language="C#" autoeventwireup="true" inherits="S3GClnDebtCollector, App_Web_f2u5fcxj" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function Trim(strInput) {
            var FieldValue = document.getElementById(strInput).value;
            document.getElementById(strInput).value = FieldValue.trim();
        }


        function fnClearGrid() {
            var Prevval;
            var Dropdown;

            Prevval = document.getElementById('<%=hdnFT.ClientID %>').value;
            Dropdown = document.getElementById('<%=ddlFrequencyType.ClientID %>')
            if (confirm('Are you sure want to Reset values in Grid?')) {
            }
            else {
                Dropdown.value = Prevval;
                return false;
            }
        }



    </script>

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </h6>
                </div>
            </div>

            <asp:UpdatePanel ID="upnlRegion" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true"
                RenderMode="Block">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel runat="server" ID="pnlLegendGroup" CssClass="stylePanel" GroupingText="Debt Collector">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLineofBusiness" AutoPostBack="true" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged"
                                                runat="server" class="md-form-control form-control" ToolTip="Line Of Business">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" class="md-form-control form-control" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged"></asp:DropDownList>
                                            <%-- <uc:Suggest ID="ddlBranch" ToolTip="Branch" runat="server" AutoPostBack="True"
                                                ServiceMethod="GetBranchList" WatermarkText="--All--" />--%>
                                            <asp:DropDownList ID="ddlRegion" runat="server"
                                                ToolTip="Region" Visible="false" class="md-form-control form-control">
                                            </asp:DropDownList>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" Text="Branch"></asp:Label>
                                                <asp:Label ID="lbRegion" runat="server" Text="Region" Visible="false"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDebtCollectorType" runat="server" OnSelectedIndexChanged="ddlDebtCollectorType_SelectedIndexChanged"
                                                AutoPostBack="true" ToolTip="Debt Collector Type" class="md-form-control form-control">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="EMPLOYEE" Value="E"></asp:ListItem>
                                                <%--<asp:ListItem Text="THIRD PARTY USER" Value="T"></asp:ListItem>--%>
                                                <asp:ListItem Text="SUPERVISOR " Value="S"></asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlDebtCollectorType" runat="server" Display="Dynamic"
                                                    InitialValue="0" ValidationGroup="btnSave" ControlToValidate="ddlDebtCollectorType"
                                                    ErrorMessage="Select Debt Collector Type" SetFocusOnError="true"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDebtCollectorType" runat="server" CssClass="styleReqFieldLabel" Text="Debt Collector Type"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlEmployeeName" runat="server" OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged"
                                                AutoPostBack="true" class="md-form-control form-control" ToolTip="Employee">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlEmployeeName" runat="server" Display="Dynamic"
                                                    InitialValue="0" ValidationGroup="btnSave" ControlToValidate="ddlEmployeeName"
                                                    ErrorMessage="Select Employee" SetFocusOnError="true"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEmployeeName" runat="server" CssClass="styleReqFieldLabel" Text="Employee"></asp:Label>
                                                <%--/Third Party Name--%>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFrequencyType" runat="server" AutoPostBack="true"
                                                ToolTip="Frequency Type" OnSelectedIndexChanged="ddlFrequencyType_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hdnFT" runat="server" />
                                            <asp:Button ID="btnFreqChange" Text="" runat="server" Style="display: none" OnClick="btnFreqChange_Click" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFrequencyType" runat="server" Display="Dynamic" InitialValue="0"
                                                    ValidationGroup="btnSave" ControlToValidate="ddlFrequencyType" ErrorMessage="Select Frequency Type"
                                                    SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblFrequencyType" runat="server" Text="Frequency Type" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <input id="hidDate" type="hidden" runat="server" />
                                            <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="True"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <%--<asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />--%>
                                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                                TargetControlID="txtStartDateSearch">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                    ErrorMessage="Enter a Effective Start Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Effective Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="True"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <%--<asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />--%>
                                            <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                                TargetControlID="txtEndDateSearch">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                                    runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter a Effective End Date"
                                                    Display="None"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblEndDateSearch" Text="Effective End Date" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDbtCode" runat="server" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDbtCode" Text="Debt Collector Code" runat="server" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtName" runat="server" ReadOnly="true" ToolTip="Name"
                                                class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDcShortName" runat="server" ReadOnly="true" ToolTip="DC Short Name"
                                                class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDcShortName" runat="server" Text="DC Short Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvaddress" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" ReadOnly="true"
                                                ToolTip="Address"
                                                class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlReportingLevel" runat="server" ToolTip="Next Level"
                                                class="md-form-control form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblNxtlevel" runat="server" Text="Next Level"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlHigherLevel" runat="server" class="md-form-control form-control"
                                                ToolTip="Super Level">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSuplevel" runat="server" Text="Super Level"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="ChkActive" runat="server" Enabled="false" Checked="true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>

                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row" style="display: none;">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div style="height: auto; margin-bottom: 10px; margin-top: 10px; overflow-x: hidden; overflow-y: auto;">
                                <asp:UpdatePanel ID="UpdatePanel_AssetAcquisition" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div style="height: auto; margin-bottom: 10px; margin-top: 10px; overflow-x: hidden; overflow-y: auto;">
                                                    <asp:Panel runat="server" ID="pnlLegendDetails" CssClass="stylePanel" GroupingText="Debt Collector Details">

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="gvDebtCollectorDetails" runat="server" AutoGenerateColumns="false"
                                                                        Width="99%" ShowFooter="true" OnRowDataBound="gvDebtCollectorDetails_RowDataBound"
                                                                        OnRowCommand="gvDebtCollectorDetails_RowCommand" OnRowDeleting="gvDebtCollectorDetails_RowDeleting"
                                                                        OnRowEditing="gvDebtCollectorDetails_RowEditing" OnRowCancelingEdit="gvDebtCollectorDetails_RowCancelingEdit"
                                                                        OnRowUpdating="gvDebtCollectorDetails_RowUpdating">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Bind("Serial_Number") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <EditItemTemplate>
                                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Bind("Serial_Number") %>'></asp:Label>
                                                                                </EditItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Age" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblPeriod" runat="server" Text='<%#Bind("Period") %>' Style="text-align: left;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <EditItemTemplate>
                                                                                    <asp:Label ID="lblPeriod" runat="server" Text='<%#Bind("Period") %>' Style="text-align: left;" />
                                                                                    <%--<asp:TextBox ID="txtPeriod1" runat="server" Text='<%#Bind("Period") %>' MaxLength="6" Width ="60px"
                                                                           Style="text-align: right;" onblur="ChkIsZero(this,'Period');"></asp:TextBox>--%>
                                                                                    <%--<asp:RequiredFieldValidator ID="rfvtxtPeriod1" runat="server" Display="None" ErrorMessage="Enter the Period."
                                                                            ControlToValidate="txtPeriod1" SetFocusOnError="True" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>--%>
                                                                                    <%--<asp:RangeValidator ID="rvtxtPeriod" runat="server" ControlToValidate="txtPeriod"
                                                                            SetFocusOnError="True" ErrorMessage="Period should be valid like 201101" Display="None"
                                                                            ValidationGroup="vgAdd" CssClass="styleMandatoryLabel" Type="Integer" MinimumValue="0"
                                                                            MaximumValue="999999"></asp:RangeValidator>--%>
                                                                                    <%-- <cc1:FilteredTextBoxExtender ID="FtexPeriod" runat="server" TargetControlID="txtPeriod"
                                                                            FilterType="Numbers" Enabled="True" ValidChars="">
                                                                        </cc1:FilteredTextBoxExtender>--%>
                                                                                    <%--<cc1:MaskedEditExtender ID="MEErvtxtPeriod" runat="server" InputDirection="LeftToRight"
                                                                                                Mask="999999" MaskType="Number" TargetControlID="txtPeriod">
                                                                                            </cc1:MaskedEditExtender>--%>
                                                                                </EditItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:Label ID="lblPeriodFoot" runat="server" Text='<%#Bind("Period") %>' Style="text-align: right;" />
                                                                                    <%--<asp:TextBox ID="txtPeriod" runat="server" MaxLength="6" onblur="ChkIsZero(this,'Period');"
                                                                         Width ="60px"   Style="text-align: right;"></asp:TextBox>--%>
                                                                                    <%--<asp:RequiredFieldValidator ID="rfvtxtPeriod" runat="server" Display="None" ErrorMessage="Enter the Period."
                                                                            ControlToValidate="txtPeriod" SetFocusOnError="True" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>--%>
                                                                                    <%--<asp:RangeValidator ID="rvtxtPeriod" runat="server" ControlToValidate="txtPeriod"
                                                                            SetFocusOnError="True" ErrorMessage="Period should be valid like 201101 or 2011"
                                                                            Display="None" ValidationGroup="vgAdd" CssClass="styleMandatoryLabel" Type="Integer"
                                                                            MinimumValue="0" MaximumValue="999999"></asp:RangeValidator>--%>
                                                                                    <%-- <cc1:FilteredTextBoxExtender ID="FtexPeriod" runat="server" TargetControlID="txtPeriod"
                                                                            FilterType="Numbers" Enabled="True" ValidChars="">
                                                                        </cc1:FilteredTextBoxExtender>--%>
                                                                                </FooterTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                <ItemStyle HorizontalAlign="Left" Width="11%" />
                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Target Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblTargetAmount" runat="server" Text='<%#Bind("Target_Amount") %>'
                                                                                        Width="100%" Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="txtTargetAmount" Text='<%#Bind("Target_Amount") %>' MaxLength="15"
                                                                                        ToolTip="Target Amount" Width="120px" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                        Style="text-align: right;" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <%--   <asp:RequiredFieldValidator ID="rfvtxtTargetAmount1" runat="server" Display="None"
                                                                            ValidationGroup="vgAdd" ErrorMessage="Enter Target Amount." ControlToValidate="txtTargetAmount"
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                                    <%--<asp:RangeValidator runat="server" ID="rvtxtTargetAmount" ControlToValidate="txtTargetAmount"
                                                                            SetFocusOnError="True" ErrorMessage="Target Amount should be less than 1000000"
                                                                            Type="Double" MinimumValue="0" MaximumValue="999999.9999" Display="None" ValidationGroup="vgAdd"
                                                                            CssClass="styleMandatoryLabel"></asp:RangeValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FtexTargetAmount" runat="server" TargetControlID="txtTargetAmount"
                                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </EditItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <asp:TextBox ID="txtTargetAmount" runat="server" MaxLength="15" Style="text-align: right;"
                                                                                        ToolTip="Target Amount" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                        class="md-form-control form-control login_form_content_input requires_true" Width="120px"></asp:TextBox>
                                                                                    <%--    onblur="funChkDecimial(this,6,4,'Target Amount');ChkIsZero(this,'Target Amount');"--%>
                                                                                    <%--<asp:RequiredFieldValidator ID="rfvtxtTargetAmount" runat="server" Display="None"
                                                                            ValidationGroup="vgAdd" ErrorMessage="Enter Target Amount." ControlToValidate="txtTargetAmount"
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                                    <%-- <asp:RangeValidator runat="server" ID="rvtxtTargetAmount" ControlToValidate="txtTargetAmount"
                                                                            SetFocusOnError="True" ErrorMessage="Target Amount should be less than 1000000"
                                                                            Type="Double" MinimumValue="0" MaximumValue="999999.9999" Display="None" ValidationGroup="vgAdd"
                                                                            CssClass="styleMandatoryLabel"></asp:RangeValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FtexTargetAmount" runat="server" TargetControlID="txtTargetAmount"
                                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>

                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Commission %">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCommissionPercentage" runat="server" Text='<%#Bind("Commission_Percentage") %>'
                                                                                        Width="100%" Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="txtCommissionPercentage" runat="server" onblur="funChkDecimial(this,2,2,'Commission %');" Text='<%#Bind("Commission_Percentage") %>'
                                                                                        ToolTip="Commission %" onkeypress="fnAllowNumbersOnly(true,false,this)" Width="60px"
                                                                                        Style="text-align: right;" MaxLength="5" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <%--
                                                                        onblur="funChkDecimial(this,2,2,'Special Commission Percentage');" 
                                                                        <asp:RequiredFieldValidator ID="rfvtxtCommissionPercentage1" runat="server" Display="None"
                                                                            ValidationGroup="vgAdd" ErrorMessage="Enter Commission %." ControlToValidate="txtCommissionPercentage"
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                                    <%--<asp:RangeValidator runat="server" ID="rvtxtCommissionPercentage" ControlToValidate="txtCommissionPercentage"
                                                                            SetFocusOnError="True" ErrorMessage="Commission Percentage should be less than 100"
                                                                            Type="Double" MinimumValue="0" MaximumValue="99.99" Display="None" ValidationGroup="vgAdd"
                                                                            CssClass="styleMandatoryLabel"></asp:RangeValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FtexCommissionPercentage" runat="server" TargetControlID="txtCommissionPercentage"
                                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </EditItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:TextBox ID="txtCommissionPercentage" runat="server" onblur="funChkDecimial(this,2,2,'Commission %');"
                                                                                        MaxLength="5" Style="text-align: right;" ToolTip="Commission %" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                        Width="60px" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <%--    
                                                                            onblur="funChkDecimial(this,2,2,'Commission Percentage');"
                                                                        <asp:RequiredFieldValidator ID="rfvtxtCommissionPercentage" runat="server" Display="None"
                                                                            ValidationGroup="vgAdd" ErrorMessage="Enter Commission %." ControlToValidate="txtCommissionPercentage"
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                                    <%-- <asp:RangeValidator runat="server" ID="rvtxtCommissionPercentage" ControlToValidate="txtCommissionPercentage"
                                                                            SetFocusOnError="True" ErrorMessage="Commission Percentage should be less than 100"
                                                                            Type="Double" MinimumValue="0" MaximumValue="99.99" Display="None" ValidationGroup="vgAdd"
                                                                            CssClass="styleMandatoryLabel"></asp:RangeValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FtexCommissionPercentage" runat="server" TargetControlID="txtCommissionPercentage"
                                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </FooterTemplate>
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Special Commision %">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSplCommissionPercentage" runat="server" Text='<%#Bind("SplCommision_Percentage") %>'
                                                                                        Width="100%" Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="txtSplCommissionPercentage" runat="server" Text='<%#Bind("SplCommision_Percentage") %>'
                                                                                        ToolTip="Special Commision %" onkeypress="fnAllowNumbersOnly(true,false,this)" onblur="funChkDecimial(this,2,2,'Special Commission %');" MaxLength="5"
                                                                                        Width="60px" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <%--
                                                                        onblur="funChkDecimial(this,2,2,'Special Commission Percentage');"
                                                                        <asp:RequiredFieldValidator ID="rfvtxtSplCommissionPercentage" runat="server" Display="None"
                                                                        ValidationGroup="vgAdd" ErrorMessage="Please enter Spl Commission %." ControlToValidate="txtSplCommissionPercentage"
                                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                                    <%-- <asp:RangeValidator runat="server" ID="rvtxtSplCommissionPercentage" ControlToValidate="txtSplCommissionPercentage"
                                                                            SetFocusOnError="True" ErrorMessage="Special Commision Percentage should be less than 100"
                                                                            Type="Double" MinimumValue="0" MaximumValue="99.99" Display="None" ValidationGroup="vgAdd"
                                                                            CssClass="styleMandatoryLabel">
                                                                        </asp:RangeValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FtexSplCommissionPercentage" runat="server" TargetControlID="txtSplCommissionPercentage"
                                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </EditItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:TextBox ID="txtSplCommissionPercentage" Style="text-align: right;" runat="server"
                                                                                        ToolTip="Special Commision %" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                        Width="60px" onblur="funChkDecimial(this,2,2,'Special Commission %');" MaxLength="5"
                                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <%-- onblur="funChkDecimial(this,2,2,'Special Commission Percentage');ChkIsZero(this,'Special Commission Percentage');"--%>
                                                                                    <%--<asp:RequiredFieldValidator ID="rfvtxtSplCommissionPercentage" runat="server" Display="None"
                                                                        ValidationGroup="vgAdd" ErrorMessage="Please enter Spl Commission %." ControlToValidate="txtSplCommissionPercentage"
                                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                                    <%--<asp:RangeValidator runat="server" ID="rvtxtSplCommissionPercentage" ControlToValidate="txtSplCommissionPercentage"
                                                                            SetFocusOnError="True" ErrorMessage="Special Commision Percentage should be less than 100"
                                                                            Type="Double" MinimumValue="0" MaximumValue="99.99" Display="None" ValidationGroup="vgAdd"
                                                                            CssClass="styleMandatoryLabel"></asp:RangeValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FtexSplCommissionPercentage" runat="server" TargetControlID="txtSplCommissionPercentage"
                                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="grid_btn" CommandName="Edit" CausesValidation="false" AccessKey="N"
                                                                                        ToolTip="Edit,Alt+N">
                                                                                    </asp:LinkButton>
                                                                                    <%--<asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="grid_btn" AccessKey="N" CausesValidation="false"></asp:LinkButton>--%>
                                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete,Alt+T" CommandName="Delete" CssClass="grid_btn_delete" AccessKey="T"
                                                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <EditItemTemplate>
                                                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn" AccessKey="U" ToolTip="Update, Alt+U"
                                                                                        CausesValidation="false" />
                                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn" AccessKey="V" ToolTip="Cancel, Alt+V"
                                                                                        CausesValidation="false" />
                                                                                </EditItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:LinkButton ID="lnkAdd" AccessKey="A" runat="server" CssClass="grid_btn" Text="Add" ToolTip="Add,Alt+A" CommandName="Add" CausesValidation="true" />
                                                                                    <%-- <asp:Button ID="lnkAdd" runat="server" Text="Add" CommandName="Add" 
                                                                            CausesValidation="true"  CssClass="styleSubmitShortButton" />--%>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                        <RowStyle HorizontalAlign="Center" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" causesvalidation="true" title="Save[Alt+S]" validationgroup="btnSave"
                            onclientclick="return fnCheckPageValidators();">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                            onserverclick="btnClear_Click"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                            type="button" accesskey="X" title="Exit[Alt+X]">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                        </button>
                    </div>
                    <tr>
                        <td colspan="5" align="center">
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:CustomValidator ID="cvDebtCollectorDetails" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                            <%--   <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                        HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="vgAdd" />--%>
                            <asp:ValidationSummary ID="vsDebtMaster" runat="server" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" Enabled="false" />
                            <%-- ValidationGroup="btnSave"--%>
                        </td>
                    </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
