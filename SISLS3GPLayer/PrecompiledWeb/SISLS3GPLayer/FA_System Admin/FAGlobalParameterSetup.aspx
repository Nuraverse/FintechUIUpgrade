<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FAGlobalParameterSetup, App_Web_tfexpijv" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="tabpan" BackColor="">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcGPS" runat="server" CssClass="styleTabPanel" ScrollBars="None"
                                ActiveTabIndex="0">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" ID="tpGeneral" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Global Parameters  
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="upGeneralDet" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                        <asp:Panel ID="pnlMultiCompany_Curr_Level" GroupingText="Multi Company and Currency Level"
                                                                            runat="server" CssClass="stylePanel">
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:CheckBox ID="chkMultiCompany" runat="server" Checked="true" />
                                                                                        <asp:Label ID="lblchkMultiCompany" runat="server" Text="Multi Company" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:RadioButtonList ID="rblCurrencyLevel" runat="server" RepeatDirection="Horizontal" ToolTip="Currency Level" class="md-form-control form-control radio">
                                                                                            <asp:ListItem Value="0" Text="Company"></asp:ListItem>
                                                                                            <asp:ListItem Value="1" Text="Location"></asp:ListItem>
                                                                                        </asp:RadioButtonList>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvCurrencyLevel" ControlToValidate="rblCurrencyLevel"
                                                                                                SetFocusOnError="true" runat="server" ErrorMessage="Select the Currency Level"
                                                                                                Display="None" InitialValue="" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:Panel ID="Panel1" GroupingText="Financial Year Details" runat="server" CssClass="stylePanel">
                                                                                        <div class="row">

                                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                <div class="md-input">
                                                                                                    <asp:DropDownList ID="ddlFinancialYearStart" CssClass="md-form-control form-control"
                                                                                                        runat="server" onmouseover="ddl_itemchanged(this)">
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:DropDownList ID="ddlFinancialYearEnd" runat="server" AutoPostBack="True"
                                                                                                        onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlFinancialYearEnd_SelectedIndexChanged"
                                                                                                        CssClass="md-form-control form-control">
                                                                                                    </asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <label>
                                                                                                        <asp:Label runat="server" Text="Financial Year" ID="lblFinancialYear" CssClass="styleReqFieldLabel">
                                                                                                        </asp:Label>
                                                                                                    </label>

                                                                                                </div>

                                                                                            </div>
                                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                <div class="md-input">
                                                                                                    <asp:DropDownList ID="ddlFinancialYearStartMonth" runat="server" AutoPostBack="True"
                                                                                                        onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlFinancialYearStartMonth_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>

                                                                                                    <asp:DropDownList ID="ddlFinancialYearEndMonth" runat="server" AutoPostBack="false"
                                                                                                        onmouseover="ddl_itemchanged(this)">
                                                                                                    </asp:DropDownList>
                                                                                                    <div class="validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvddlFinancialYearEndMonth" ControlToValidate="ddlFinancialYearEndMonth"
                                                                                                            CssClass="validation_msg_box_sapn" SetFocusOnError="true" runat="server" ErrorMessage="Select the Financial Year End month"
                                                                                                            Display="Dynamic" InitialValue="0" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                                    </div>

                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <label>
                                                                                                        <asp:Label ID="lblFinancialYearStartMonth" runat="server" Text="Month Range" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                                    </label>

                                                                                                    <div>
                                                                                                    </div>

                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </asp:Panel>
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <asp:Panel ID="panDateFormat" GroupingText="Date Format" runat="server" CssClass="stylePanel">

                                                                                                <div class="row">
                                                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                        <div class="md-input">
                                                                                                            <asp:DropDownList ID="ddlDateFormat" runat="server" AutoPostBack="false" onmouseover="ddl_itemchanged(this)">
                                                                                                            </asp:DropDownList>
                                                                                                            <div class="validation_msg_box">
                                                                                                                <asp:RequiredFieldValidator ID="rfvDateFormat" ControlToValidate="ddlDateFormat" CssClass="validation_msg_box_sapn"
                                                                                                                    SetFocusOnError="true" runat="server" ErrorMessage="Select the Date Format" Display="Dynamic"
                                                                                                                    InitialValue="0" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                                            </div>

                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                            <label>
                                                                                                                <asp:Label ID="lblDateFormat" runat="server" Text="Date Format" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </asp:Panel>
                                                                                            <div class="row">
                                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                    <asp:Panel runat="server" ID="Panel5" GroupingText="Currency Particulars" CssClass="stylePanel">
                                                                                                        <div class="row">
                                                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                                <div class="md-input">
                                                                                                                    <label class="tess">
                                                                                                                        <asp:Label ID="lblMAxdigit" runat="server" Text="Maximum Digit" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                                                    </label>
                                                                                                                    <asp:TextBox ID="txtMaxDigit" runat="server" onblur="ChkIsZero(this)"
                                                                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right"
                                                                                                                        onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                                    <span class="highlight"></span>
                                                                                                                    <span class="bar"></span>
                                                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtamount" TargetControlID="txtMaxDigit" FilterType="Custom,Numbers"
                                                                                                                        runat="server" Enabled="True" />
                                                                                                                    <div class="validation_msg_box">
                                                                                                                        <asp:RequiredFieldValidator ID="rfvMaxDigit" ControlToValidate="txtMaxDigit" runat="server"
                                                                                                                            Display="None" ErrorMessage="Enter the maximum digits" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                                                    </div>
                                                                                                                </div>


                                                                                                            </div>

                                                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                                <div class="md-input">
                                                                                                                    <label class="tess">
                                                                                                                        <asp:Label ID="lblmaxdecimal" runat="server" Text="Maximum Decimals" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                                                    </label>
                                                                                                                    <asp:TextBox ID="txtMaxDecimal" runat="server" onblur="ChkIsZero(this)"
                                                                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right"
                                                                                                                        onkeypress="fnAllowNumbersOnly('false',false,this)" ReadOnly="true"
                                                                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                                    <span class="highlight"></span>
                                                                                                                    <span class="bar"></span>
                                                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtMaxDecimal"
                                                                                                                        FilterType="Custom,Numbers" runat="server" Enabled="True" />

                                                                                                                </div>
                                                                                                            </div>

                                                                                                        </div>
                                                                                                    </asp:Panel>

                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                        <asp:Panel runat="server" ID="upAuthorizations" GroupingText="Authorizations" CssClass="stylePanel">
                                                                            <div style="overflow: auto; height: 206px; margin-left: 2px; width: 99%; vertical-align: top;">
                                                                                <div class="row">
                                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                        <div class="grid">
                                                                                            <asp:GridView ID="gvAuthorization" runat="server" AutoGenerateColumns="false">
                                                                                                <Columns>
                                                                                                    <asp:TemplateField HeaderText="Program ID" HeaderStyle-Width="40%" ItemStyle-Width="40%"
                                                                                                        Visible="false">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Label ID="lblProgram_ID" runat="server" Text='<%#Bind("Program_ID") %>' Visible="false"></asp:Label>
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateField>
                                                                                                    <asp:TemplateField HeaderText="Program Name" HeaderStyle-Width="40%" ItemStyle-Width="40%"
                                                                                                        ItemStyle-HorizontalAlign="Left">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Bind("Program_Name") %>'></asp:Label>
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateField>
                                                                                                    <asp:TemplateField HeaderText="Authorization" HeaderStyle-Width="40%" ItemStyle-Width="40%">
                                                                                                        <ItemTemplate>
                                                                                                            <%--Modified By Chandrasekar K On 20-09-2012--%>
                                                                                                            <%--<asp:CheckBox ID="chkAuthorize" runat="server" Checked='<%#Bind("Is_Authorize") %>' />--%>
                                                                                                            <asp:CheckBox ID="chkAuthorize" Checked='<%#DataBinder.Eval(Container.DataItem, "Is_Authorize").ToString().ToUpper() == "TRUE"%>'
                                                                                                                runat="server" />
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateField>
                                                                                                </Columns>
                                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                                <RowStyle HorizontalAlign="Center" />
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                        </asp:Panel>
                                                                        <div class="row">
                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <div class="md-input">
                                                                                                <asp:DropDownList ID="ddlPandLAccountcode" runat="server" AutoPostBack="false" onmouseover="ddl_itemchanged(this)"
                                                                                                    class="md-form-control form-control">
                                                                                                </asp:DropDownList>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                                <label>
                                                                                                    <asp:Label ID="lblPandLAccountCode" runat="server" Text="P&L Account Code" CssClass="styleReqFieldLabel">

                                                                                                    </asp:Label>

                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <div class="md-input">
                                                                                                <asp:DropDownList ID="ddlibsaccountliability" runat="server" AutoPostBack="false"
                                                                                                    onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                                                                                </asp:DropDownList>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                                <label>
                                                                                                    <asp:Label ID="lblIBSAccount" runat="server" Text="IBS Account (Liability)" CssClass="styleReqFieldLabel"></asp:Label>

                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <div class="md-input">
                                                                                                <asp:DropDownList ID="ddlibsaccountasset" runat="server" AutoPostBack="false" onmouseover="ddl_itemchanged(this)"></asp:DropDownList>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                                <label>
                                                                                                    <asp:Label ID="lblIBSAccountasset" runat="server" Text="IBS Account (Asset)" CssClass="styleReqFieldLabel"></asp:Label>

                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>



                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>




                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

                                                <cc1:TabPanel ID="tpTransactionDetails" runat="server" CssClass="tabpan" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Transaction Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>

                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

                                                                <asp:Panel ID="pnlTransDet" runat="server" GroupingText="Transaction Details" CssClass="stylePanel">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox runat="server" ID="txtdenominator" Style="text-align: right"
                                                                                    onkeypress="fnAllowNumbersOnly('false',false,this)" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvDenominatordays" ControlToValidate="txtdenominator"
                                                                                        runat="server" ErrorMessage="Enter the NOD Per Year " InitialValue=" " Display="Dynamic"
                                                                                        ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblDenominatordays" runat="server" Text="NOD Per Year" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:CheckBox ID="chkBudgetApplicable" runat="server" Checked="true" />

                                                                                <asp:Label ID="lblBudgetApplicable" runat="server" CssClass="styleReqFieldLabel"
                                                                                    Text="Budget Applicable"></asp:Label>


                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:CheckBox ID="chkDimension" runat="server" Checked="true" />


                                                                                <asp:Label ID="lblDimension" runat="server" CssClass="styleReqFieldLabel"
                                                                                    Text="Dimension Applicable"></asp:Label>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:CheckBox ID="chkDim2LinkWithDim1" runat="server" Checked="true" />

                                                                                <asp:Label ID="lblDim2LinkWithDim1" runat="server" Text="Dimension2 link with Dimension1" CssClass="styleReqFieldLabel"></asp:Label>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox runat="server" ID="txtIntrumentValiedDays" Style="text-align: right"
                                                                                    onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                                    onmouseover="txt_MouseoverTooltip(this)"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvIntrumentValiedDays" ControlToValidate="txtIntrumentValiedDays"
                                                                                        runat="server" ErrorMessage="Enter the Instrument Valid Days" Display="dynamic"
                                                                                        ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblIntrumentValiedDays" runat="server" Text="Instrument Valid Days" CssClass="styleReqFieldLabel">

                                                                                    </asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox runat="server" ID="txtProjectedYears" Style="text-align: right"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" MaxLength="5"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                                <cc1:FilteredTextBoxExtender ID="FTBENoOfPRJYears" runat="server" TargetControlID="txtProjectedYears"
                                                                                    FilterType="Numbers">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVProjectedYears" ControlToValidate="txtProjectedYears"
                                                                                        runat="server" ErrorMessage="Enter No Of Projectded Years" Display="dynamic"
                                                                                        ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    <asp:RangeValidator ID="RGVProjectedYears" runat="server" ErrorMessage="Year should be greater than 0"
                                                                                        ValidationGroup="btnSave" CssClass="validation_msg_box_sapn" ControlToValidate="txtProjectedYears"
                                                                                        Display="dynamic" MinimumValue="1" Type="Integer" MaximumValue="10"></asp:RangeValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="Label1" runat="server" Text="No Of Projected Years" CssClass="styleReqFieldLabel">

                                                                                    </asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </asp:Panel>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

                                                                <asp:Panel ID="Panel4" runat="server" GroupingText="Other Details" CssClass="stylePanel">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlDepreciationMethod" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                                    class="md-form-control form-control">
                                                                                    <asp:ListItem Text="Straight Line Method" Value="SLM" Selected="True" />
                                                                                    <asp:ListItem Text="Written Down Value" Value="WDV" />
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlDepreciationMethod"
                                                                                        runat="server" ErrorMessage="Select Depreciation Method" InitialValue="0" Display="Dynamic"
                                                                                        ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblDepreciationMethod" runat="server" Text="Depreciation Method" CssClass="styleReqFieldLabel">

                                                                                    </asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox runat="server" ID="txtFixedAssetValue" Style="text-align: right"
                                                                                    onkeypress="fnAllowNumbersOnly('false',false,this)" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVtxtFixedAssetValue" ControlToValidate="txtFixedAssetValue"
                                                                                        runat="server" ErrorMessage="Enter Least Fixed Asset Value" Display="Dynamic" ValidationGroup="btnSave"
                                                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblFixedAssetValue" runat="server" Text="Least Fixed Asset Value" CssClass="styleReqFieldLabel">
                                                                                    </asp:Label>
                                                                                </label>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        </div>
                                               
                                                    </ContentTemplate>
                                                </cc1:TabPanel>

                                            </div>
                                        </div>
                                        <cc1:TabPanel runat="server" HeaderText="Password Policy" ID="tpPasswordPloicy" CssClass="tabpan" Visible="false"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Password Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:Panel runat="server" GroupingText="Password Rules" ID="Panel2" CssClass="stylePanel">
                                                    <table>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblForcePWDchange" runat="server" Text="Force Password Change" CssClass="styleDisplayLabel"></asp:Label>
                                                                <asp:CheckBox ID="chkForcePWDChange" runat="server" OnCheckedChanged="chkForcePWDChange_CheckedChanged"
                                                                    Checked="true" />
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblDays" runat="server" Text="Days" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtDaysPWD" runat="server" MaxLength="2" Width="30px" onblur="fnCheckZero()"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtDaysPWD"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--<asp:RequiredFieldValidator ID="rfvDays" ControlToValidate="txtDaysPWD" runat="server"
                                                        Display="None" ErrorMessage="Enter Days"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" colspan="2">
                                                                <asp:Label ID="lblEnforcePWD" runat="server" Text="Enforce initial change password"
                                                                    CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:CheckBox ID="chkInitialChangePWD" runat="server" OnCheckedChanged="chkInitialChangePWD_CheckedChanged"
                                                                    Checked="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" colspan="2">
                                                                <asp:Label ID="lblDisableAccess" runat="server" Text="Disable access after wrong password"
                                                                    CssClass="styleReqFieldLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtDisableAccess" runat="server" MaxLength="2" Width="30px" onblur="fnCheckZero()"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtDisableAccess"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvDisableAccess" ControlToValidate="txtDisableAccess"
                                                                    runat="server" Display="None" ErrorMessage="Enter Disable Access Count"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" colspan="2">
                                                                <asp:Label ID="lblMiniPWDLen" runat="server" Text="Minimum password length" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtMiniPWDLen" runat="server" MaxLength="2" Width="30px" onblur="fnCheckZero()"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtMiniPWDLen"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvMinPwdlen" ControlToValidate="txtMiniPWDLen" runat="server"
                                                                    Display="None" ErrorMessage="Enter Minimum Password Length"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" colspan="2">
                                                                <asp:Label ID="lblpwdrecycleitr" runat="server" Text="Password Re-cycle Iteration"
                                                                    CssClass="styleReqFieldLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtpwdrecycleitr" runat="server" MaxLength="2" Width="30px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtpwdrecycleitr"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvPwdrecycle" ControlToValidate="txtpwdrecycleitr"
                                                                    runat="server" Display="None" ErrorMessage="Enter Password Re-cycle Iteration"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <asp:Panel runat="server" GroupingText="Password Composition" ID="Panel3" CssClass="stylePanel">
                                                    <table>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="lblUpperCase" runat="server" Text="Upper Case character" CssClass="styleDisplayLabel"></asp:Label>
                                                                <asp:CheckBox ID="chkUpperCaseChar" runat="server" OnCheckedChanged="chkForcePWDChange_CheckedChanged"
                                                                    Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="lblNumbers" runat="server" Text="Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                <asp:CheckBox ID="chkNumbers" runat="server" OnCheckedChanged="chkNumbers_CheckedChanged"
                                                                    Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="lblSpecialCharacters" runat="server" Text="Special characters" CssClass="styleDisplayLabel"></asp:Label>
                                                                <asp:CheckBox ID="chkSpecialCharacters" runat="server" OnCheckedChanged="chkSpecialCharacters_CheckedChanged"
                                                                    Checked="true" />
                                                            </td>
                                                        </tr>

                                                        <br />
                                                        <br />
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upGPS" runat="server">
        <ContentTemplate>
            <div align="right">
                
                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                     onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false"
                    type="button" accesskey="S" title="Save,Alt+S" validationgroup="btnSave">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnClear" causesvalidation="false" onserverclick="btnClear_Click" runat="server" onclick="if(fnConfirmClear())"
                    type="button" accesskey="L" title="Clear_FA,Alt+L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>

                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                    type="button" accesskey="X" title="Exit,Alt+X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
                <asp:HiddenField ID="hdnGPS_ID" runat="server" />
                <asp:HiddenField ID="hdnUserLevelAccess" runat="server" />
            </div>
            </div>
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>
    <%--  <div style="text-align: left; vertical-align: middle; width: 99%; margin-left: 4px; margin-top: 2px;">
    </div>--%>
    <tr class="styleButtonArea">
        <td colspan="3">
            <asp:CustomValidator ID="cvGPS" runat="server" Display="None" ValidationGroup="btnSave"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:ValidationSummary runat="server" ID="vsGPS" HeaderText="Correct the following validation(s):"
                CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnSave"
                ShowSummary="true" />
        </td>
    </tr>


    <script type="text/javascript">
        function fnCheckZero() {
            var txtDaysPWD = (document.getElementById('<%=txtDaysPWD.ClientID %>'));
            var txtDisableAccess = (document.getElementById('<%=txtDisableAccess.ClientID %>'));
            var txtMiniPWDLen = (document.getElementById('<%=txtMiniPWDLen.ClientID %>'));

            //debugger;
            if (document.getElementById('<%=chkForcePWDChange.ClientID %>').checked == true) {

                if ((txtDaysPWD.value != " ") && !(isNaN(txtDaysPWD.value))) {
                    var pwdDays
                    pwdDays = parseInt(txtDaysPWD.value, 10);
                }

                if ((document.getElementById('<%=chkForcePWDChange.ClientID %>').checked == true) && pwdDays == "0") {
                    alert("On force password change - Days should not be zero");
                }
                else if ((document.getElementById('<%=chkForcePWDChange.ClientID %>').checked == true) && (isNaN(txtDaysPWD.value))) {
                    alert("On force password change - Days should not be empty");
                }
                else {
                    return;
                }

            }

            if ((txtDaysPWD.value != " ") && !(isNaN(txtDaysPWD.value)) || (txtDisableAccess.value != " ") && !(isNaN(txtDisableAccess.value)) || (txtMiniPWDLen.value != " ") && !(isNaN(txtMiniPWDLen.value))) {
                var pwdDays
                var disAccess
                var pwdlen

                pwdDays = parseInt(txtDaysPWD.value, 10);
                disAccess = parseInt(txtDisableAccess.value, 10);
                pwdlen = parseInt(txtMiniPWDLen.value, 10);

                //                if(document.getElementById('ctl00_ContentPlaceHolder1_tcGlobalParamSetup_tpPasswordPloicy_chkForcePWDChange').checked==true)
                //                {
                //                    if (pwdDays == "0") 
                //                    {
                //                        alert("Days cannot be Zero");
                //                        txtDaysPWD.focus();
                //                    }
                //                }
                //                
                //                if(disAccess == 0)
                //                {
                //                    alert("Disable Access Count cannot be Zero");
                //                    txtDisableAccess.focus();
                //                }
                //                else if(pwdlen == 0)
                //                {
                //                    alert("Password Length cannot be Zero");
                //                    txtMiniPWDLen.focus();
                //                }
                //                else 


                if (pwdlen < "6") {
                    alert("Password Length should be minimum 6");
                    txtMiniPWDLen.focus();
                }
                else {
                    return;
                }
            }
            else {
                return;
            }

        }
    </script>

</asp:Content>








































