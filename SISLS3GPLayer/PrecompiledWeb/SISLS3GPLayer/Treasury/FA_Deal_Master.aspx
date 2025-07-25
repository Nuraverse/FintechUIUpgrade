<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_Deal_Master, App_Web_zogfwrp2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel" BackColor=""> 
                        </asp:Label>
                    </h6>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <cc1:TabContainer ID="tcDealMaster" runat="server" CssClass="styleTabPanel" Width="99%"
                        TabStripPlacement="top" ActiveTabIndex="0">
                        <cc1:TabPanel runat="server" HeaderText="Deal Details" ID="tbAddress" CssClass="tabpan"
                            BackColor="Red">
                            <HeaderTemplate>
                                Deal Details
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upAddress" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Deal Informations" ID="pnlDealInfo" runat="server" CssClass="stylePanel">

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <cc1:ComboBox ID="ddlFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="Simple"
                                                                    AutoPostBack="True" AppendDataBoundItems="false" MaxLength="3" ToolTip="Funder"
                                                                    AutoCompleteMode="None" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged">
                                                                </cc1:ComboBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">

                                                                    <asp:Label runat="server" ID="lblfunder" CssClass="styleReqFieldLabel" Text="Funder"></asp:Label>
                                                                </label>
                                                            </div>

                                                        </div>



                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtdealno" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblDealNumber" CssClass="styleReqFieldLabel" Text="Deal Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>



                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLocation" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ToolTip="Location" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblLocation" Text="Branch" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDealDate" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"> 
                                                                </asp:TextBox>
                                                                <cc1:CalendarExtender ID="CEtxtDealDate" runat="server" Enabled="True" TargetControlID="txtDealDate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDealDate" ToolTip="Currency Code" runat="server" Text="Deal Date"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtglcode" runat="server" Width="165px" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Account');" ToolTip="TAX Number" Visible="false"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblGLCode" CssClass="styleReqFieldLabel" Text="Account"
                                                                        Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtsubaccount" runat="server" ReadOnly="true" Visible="false"
                                                                    onmouseover="txt_MouseoverTooltip(this)" onblur="FunTrimwhitespace(this,'Account');"
                                                                    ToolTip="TAX Number" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblSLCode" Text="Sub Account" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>



                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTAXNo" runat="server" MaxLength="20"
                                                                    ToolTip="TAX Number" Visible="false" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTAXNo" CssClass="styleReqFieldLabel" Text="TAX Number" Visible="false" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtVATNo" runat="server" MaxLength="20" Visible="false"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblVATNo" CssClass="styleReqFieldLabel" Text="VAT Number" Visible="false" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtcommitmentamount" runat="server" MaxLength="20" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'TAX Number');" ToolTip="Commitment Amount" Style="text-align: right;"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="flttxtcommitmentamount" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtcommitmentamount">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="Rfvcommitmentamount" runat="server" ControlToValidate="txtcommitmentamount"
                                                                        Display="Dynamic" ErrorMessage="Enter Commitment Amount" SetFocusOnError="True"
                                                                        ValidationGroup="Main" CssClass="grid_validation_msg_box" />
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtcommitmentamount" runat="server" TargetControlID="txtcommitmentamount"
                                                                    ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblCommittment" CssClass="styleReqFieldLabel" Text="Committment Amount" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFunderType" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFunderType_SelectedIndexChanged"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFunder_Type" ToolTip="Deal Type" runat="server" Text="Deal Type"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRemarks" runat="server" MaxLength="100" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Remarks');" onkeyup="maxlengthfortxt(100);" TextMode="MultiLine"
                                                                    Rows="3" ToolTip="Remarks" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblRemarks" runat="server" Text="Remarks" ToolTip="Remarks" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlcurrencycode" onmouseover="ddl_itemchanged(this)" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlcurrencycode_SelectedIndexChanged" runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvcurrencycode" runat="server" Display="Dynamic" ControlToValidate="ddlcurrencycode"
                                                                        ValidationGroup="Main" InitialValue="0" ErrorMessage="Select Currency Code"
                                                                        Enabled="True" SetFocusOnError="True" CssClass="grid_validation_msg_box"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblcurrencycode" ToolTip="Currency Code" runat="server" Text="Currency Code"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>



                        <cc1:TabPanel runat="server" HeaderText="Deal Details Contd." ID="tbfund" CssClass="tabpan"
                            BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>

                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel3" runat="server" GroupingText="Fund Details" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFundType" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                    OnSelectedIndexChanged="ddlFundType_SelectedIndexChanged" AutoPostBack="true"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFundType" runat="server" Display="dynamic" ControlToValidate="ddlFundType"
                                                                        ValidationGroup="btnAddDDC" InitialValue="0" ErrorMessage="Select Funder Type"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFundTypeM" runat="server" Display="dynamic" ControlToValidate="ddlFundType"
                                                                        ValidationGroup="btnModifyDDC" InitialValue="0" ErrorMessage="Select Funder Type"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFunderType" ToolTip="Funder Type" runat="server" Text="Funder Type"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlNatureofFund" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlNatureofFund_SelectedIndexChanged"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVNatureofFund" runat="server" Display="dynamic" ControlToValidate="ddlNatureofFund"
                                                                        ValidationGroup="btnAddDDC" InitialValue="0" ErrorMessage="Select Nature of Fund"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVNatureofFundM" runat="server" Display="dynamic" ControlToValidate="ddlNatureofFund"
                                                                        ValidationGroup="btnModifyDDC" InitialValue="0" ErrorMessage="Select Nature of Fund"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblNatureofFund" ToolTip="Nature of Fund" runat="server" Text="Nature of Fund"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTrancheNoD" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVtxtTrancheNoD" runat="server" Display="dynamic" ControlToValidate="txtTrancheNoD"
                                                                        ValidationGroup="btnAddDDC" ErrorMessage="Select Tranche/Serial Ref. No." CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVtxtTrancheNoM" runat="server" Display="dynamic" ControlToValidate="txtTrancheNoD"
                                                                        ValidationGroup="btnModifyDDC" ErrorMessage="Enter Tranche/Serial Ref. No." CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTrancheNoD" ToolTip="Tranche/Serial Ref. No." runat="server" Text="Tranche/Serial Ref. No."
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFacilityAmt" Style="text-align: right" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    OnTextChanged="txtFacilityAmount_OnTextChanged" AutoPostBack="true"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtFacilityAmt" runat="server" TargetControlID="txtFacilityAmt"
                                                                    ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtFacilityAmt" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtFacilityAmt">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFacilityAmt" ToolTip="Facility Amount" runat="server" Text="Facility Amount"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <%--<asp:RequiredFieldValidator ID="RFVFacilityAmt" runat="server" Display="None" ControlToValidate="txtFacilityAmt"
                                                        ValidationGroup="btnAddDDC" ErrorMessage="Select Facility Amount" CssClass="styleMandatoryLabel"
                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RFVFacilityAmtM" runat="server" Display="None" ControlToValidate="txtFacilityAmt"
                                                        ValidationGroup="btnModifyDDC" ErrorMessage="Select Facility Amount" CssClass="styleMandatoryLabel"
                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFacilityAmtINR" Style="text-align: right" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="flttxtFacilityAmtINR" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtFacilityAmtINR">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFacilityAmtINR" runat="server" Display="dynamic"
                                                                        ControlToValidate="txtFacilityAmtINR" ValidationGroup="btnAddDDC" ErrorMessage="Enter Facility Amount(OMR)"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFacilityAmtINRM" runat="server" Display="dynamic"
                                                                        ControlToValidate="txtFacilityAmtINR" ValidationGroup="btnModifyDDC" ErrorMessage="Enter Facility Amount(OMR)"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtFacilityAmtINR" runat="server" TargetControlID="txtFacilityAmtINR"
                                                                    ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFacilityAmtINR" ToolTip="Facility Amount(OMR)" runat="server" Text="Facility Amount(OMR)"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSanction_Ref_NoDDC" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSanction_Ref_No" ToolTip="Sanction Ref No" runat="server" Text="Sanction Ref No"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>


                                                            </div>

                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkInLieuOf" runat="server" ToolTip="In Lieu Of" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                                <asp:Label ID="Label3" ToolTip="In Lieu Of" runat="server" Text=" Lieu Of"
                                                                    CssClass="styleReqFieldLabel" />


                                                            </div>
                                                        </div>
                                                        <%--<asp:TextBox ID="txtInLieuOf" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                        Width="130px" />--%>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlInLieuOf" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblInLieuOf" ToolTip="In Lieu Of" runat="server" Text="In Lieu Of"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <%--<asp:RequiredFieldValidator ID="RFVSanction_Ref_No" runat="server" Display="None"
                                                        ControlToValidate="txtSanction_Ref_NoDDC" ValidationGroup="btnAddDDC" ErrorMessage="Select Sanction Ref No"
                                                        CssClass="styleMandatoryLabel" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RFVSanction_Ref_NoM" runat="server" Display="None"
                                                        ControlToValidate="txtSanction_Ref_NoDDC" ValidationGroup="btnModifyDDC" ErrorMessage="Select Sanction Ref No"
                                                        CssClass="styleMandatoryLabel" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDDCRemarks" runat="server" MaxLength="100" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Remarks');" onkeyup="maxlengthfortxt(100);" TextMode="MultiLine"
                                                                    ToolTip="Remarks" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDDCRemarks" ToolTip="Remarks" runat="server" Text="Remarks" CssClass="styleReqFieldLabel" />
                                                                    <asp:Label ID="lblDDCSlNo" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lblDDCMode" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lblFunder_Tran_ID" runat="server" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <div id="CPLinfo" runat="server" visible="false">
                                                                    <asp:DropDownList ID="ddlCPLimit" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlCPLimit_SelectedIndexChanged"
                                                                        class="md-form-control form-control">
                                                                        <asp:ListItem Text="Outside Limit" Value="0" Selected="True"></asp:ListItem>
                                                                        <asp:ListItem Text="Within Limit" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblCPLimit" ToolTip="CP Limit" runat="server" Text="Limit" CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div align="right">
                                                            <button class="css_btn_enabled" id="btnAddDDC" title="Add,Alt+A" onclick="if(fnConfirmAdd('btnAddDDC'))" causesvalidation="false" onserverclick="btnAddDDC_Click" runat="server"
                                                                type="button" accesskey="A">
                                                                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnModifyDDC" title="Edit,Alt+M" onclick="if(fnCheckPageValidators('btnAddDDC'))" causesvalidation="false" onserverclick="btnModifyDDC_Click" runat="server"
                                                                type="button" accesskey="M">
                                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnClearDDC" title="ClearDDC,Alt+R" causesvalidation="false" onserverclick="btnClearDDC_Click" runat="server"
                                                                type="button" accesskey="R">
                                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                                                            </button>

                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>





                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="grvFunderDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        OnRowDataBound="grvFunderDetails_RowDataBound" OnRowDeleting="grvFunderDetails_RowDeleting"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelectDDC_CheckedChanged"
                                                                        AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15px" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <%-- <ItemStyle Width="6%" HorizontalAlign="Center" />--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Tran Details ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTran_Details_ID" runat="server" Text='<%#Eval("Tran_Details_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Funder ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFunder_ID" runat="server" Text='<%#Eval("Funder_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Funder Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFunder_Type" runat="server" Text='<%#Eval("Funder_Type") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Nature ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNature_ID" runat="server" Text='<%#Eval("Nature_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Fund Nature">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFund_Nature" runat="server" Text='<%#Eval("Fund_Nature") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Tranche Ref no">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTranche_Ref_no" runat="server" Text='<%#Eval("Tranche_Ref_no") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="InLieuof Id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInLiequof_Id" runat="server" Text='<%#Eval("InLiequof_Id") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="InLieu of">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInLiequof" runat="server" Text='<%#Eval("InLiequof") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Sanction Ref No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSanction_Ref_No" runat="server" Text='<%#Eval("Sanction_Ref_No") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Facility Amount" ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFacility_Amount" Style="text-align: right" runat="server" Text='<%#Eval("Facility_Amount") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Facility Amount OMR" ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFacility_AmountINR" Style="text-align: right" runat="server" Text='<%#Eval("Facility_AmountINR") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRemarks" runat="server" Text='<%#Eval("Remarks") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Fund Tran Id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFunder_Tran_ID" runat="server" Text='<%#Eval("Funder_Tran_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>

                                                    <asp:ValidationSummary ID="VSbtnAddDDC" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnAddDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                    <asp:ValidationSummary ID="VSbtnModifyDDC" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnModifyDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />

                                                </div>

                                            </div>


                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>

                        <cc1:TabPanel runat="server" ID="TabPanelInterest" CssClass="tabpan" BackColor="Red">
                            <HeaderTemplate>
                                Interest Rate Details
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>

                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Interest Rate Details">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlTrancheNo" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVddlTrancheNo" runat="server" Display="dynamic" ControlToValidate="ddlTrancheNo"
                                                                        ValidationGroup="btnAddInt" InitialValue="0" ErrorMessage="Select Tranche Ref no"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVddlTrancheNoM" runat="server" Display="dynamic" ControlToValidate="ddlTrancheNo"
                                                                        ValidationGroup="btnModifyInt" InitialValue="0" ErrorMessage="Select Tranche Ref no"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTrancheNo" ToolTip="Tranche Ref no" runat="server" Text="Tranche Ref no"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlInterestType" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvinterestrate" runat="server" Display="dynamic" ControlToValidate="ddlBaseRate"
                                                                        ValidationGroup="btnAddInt" InitialValue="0" ErrorMessage="Select Interest Type"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblInterestType" ToolTip="Interest Type" runat="server" Text="Interest Type"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBaseRate" onmouseover="ddl_itemchanged(this)" runat="server">
                                                                </asp:DropDownList>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvbaserate" runat="server" Display="dynamic" ControlToValidate="ddlBaseRate"
                                                                        ValidationGroup="btnAddInt" InitialValue="0" ErrorMessage="Select Base Rate"
                                                                        CssClass="grid_validation_msg_box" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblBaseRate" ToolTip="Base Rate" runat="server" Text="Base Rate" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlvariablerate" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                    OnSelectedIndexChanged="ddlvariablerate_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvvariablerate" runat="server" Display="None" ControlToValidate="ddlvariablerate"
                                                                        ValidationGroup="btnAddInt" InitialValue="0" ErrorMessage="Select Spread Rate"
                                                                        CssClass="grid_validation_msg_box" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblvariablerate" ToolTip="Spread Rate" runat="server" Text="Spread Rate"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkdiscount" runat="server" ToolTip="Discount" AutoPostBack="true"
                                                                    OnCheckedChanged="chkdiscount_OnCheckedChanged" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <asp:Label ID="Label2" ToolTip="Discount Rate%" runat="server" Text="Discount Rate%"
                                                                    CssClass="styleReqFieldLabel" />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtdiscount" runat="server" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="flttxtdiscount" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtdiscount">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDiscount" ToolTip="Discount Rate%" runat="server" Text="Discount Rate%"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>

                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtdiscountamount" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="flttxtdiscountamount" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtdiscountamount">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lbldiscountamt" ToolTip="Discount Amount" runat="server" Text="Amount"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtcurrencyvalue" Visible="false" runat="server" ReadOnly="true"
                                                                    onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="flttxtcurrencyvalue" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtcurrencyvalue">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblcurrencyvalue" ToolTip="Currency Value" runat="server" Text="Currency Value"
                                                                        CssClass="styleReqFieldLabel" Visible="false" />

                                                                    <asp:Label ID="lblIntSlNo" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lblIntMode" runat="server" Visible="False"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div align="right">
                                                                <button class="css_btn_enabled" id="btnAddInt" title="Add,Alt+A" onclick="if(fnConfirmAdd('btnAddInt'))" causesvalidation="false" onserverclick="btnAddInt_Click" runat="server"
                                                                    type="button" accesskey="A">
                                                                    <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                </button>
                                                                <button class="css_btn_enabled" id="btnModifyInt" title="Edit,Alt+M" onclick="if(fnCheckPageValidators('btnModifyInt'))" causesvalidation="false" onserverclick="btnModifyInt_Click" runat="server"
                                                                    type="button" accesskey="M">
                                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                                </button>
                                                                <button class="css_btn_enabled" id="btnhClearInt" title="btnhClearInt,Alt+R" causesvalidation="false" onserverclick="btnClearInt_Click" runat="server"
                                                                    type="button" accesskey="R">
                                                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                                                                </button>
                                                            </div>

                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvInterestRateDtls" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                        Width="100%" ShowFooter="false" OnRowDeleting="grvInterestRateDtls_RowDeleting">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Select">
                                                                                <ItemTemplate>
                                                                                    <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelectInt_CheckedChanged"
                                                                                        AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Sl No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="6%" HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Tranche Ref no">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblTranche_Ref_no" runat="server" Text='<%#Eval("Tranche_Ref_no") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Base Rate Id" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblBase_Rate_Id" runat="server" Text='<%#Eval("Base_Rate_Id") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Base Rate">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblBase_Rate" runat="server" Text='<%#Eval("Base_Rate") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Interest Type Id" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblInterest_Type_Id" runat="server" Text='<%#Eval("Interest_Type_Id") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Interest Type">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblInterest_Type" runat="server" Text='<%#Eval("Interest_Type") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Spread Rate Id" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSpread_Rate_Id" runat="server" Text='<%#Eval("Spread_Rate_Id") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Spread Rate">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSpread_Rate" runat="server" Text='<%#Eval("Spread_Rate") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Discount Id" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDiscount_Id" runat="server" Text='<%#Eval("Discount_Id") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Discount Rate">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDiscount_Rate" runat="server" Text='<%#Eval("Discount_Rate") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Discount Amount" ItemStyle-HorizontalAlign="Right">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDiscount_Amount" runat="server" Text='<%#Eval("Discount_Amount") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Currency Value" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCurrency_Value" runat="server" Text='<%#Eval("Currency_Value") %> '></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Delete">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                                        CausesValidation="false">
                                                                                    </asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>

                                                                    <asp:ValidationSummary ID="VSbtnAddInt" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                                        ValidationGroup="btnAddInt" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                                    <asp:ValidationSummary ID="VSbtnModifyInt" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                                        ValidationGroup="btnModifyInt" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />


                                                                </div>
                                                            </div>
                                                        </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" ID="TabPanel3" CssClass="tabpan" BackColor="Red" Visible="false">
                            <HeaderTemplate>
                                Board Details
                            </HeaderTemplate>
                            <ContentTemplate>

                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlrating" runat="server" CssClass="stylePanel" GroupingText="Rating Details">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvRateDtls" runat="server" Width="98%" AutoGenerateColumns="false"
                                                                    ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvRateDtls_RowCommand"
                                                                    OnRowDataBound="grvRateDtls_RowDataBound" OnRowDeleting="grvRateDtls_RowDeleting">
                                                                    <Columns>
                                                                        <%--Serial Number--%>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRate_Sl" runat="server" Text='<%#Eval("Rate_Sl") %>' ToolTip="Cashflow Type" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Rate Agency--%>
                                                                        <asp:TemplateField HeaderText="Rate Agency">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRate_Agency" runat="server" Text='<%#Eval("Rate_Agency") %>' ToolTip="Cashflow Type" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtRate_Agency" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="Rate Agency"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Rating--%>
                                                                        <asp:TemplateField HeaderText="Rating">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRating" runat="server" Text='<%#Eval("Rating") %>' ToolTip="CashFlow" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtRating" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="Rating" />
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Rate Amount--%>
                                                                        <asp:TemplateField HeaderText="Rate Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRate_Amt" runat="server" Style="text-align: right;" Text='<%#Eval("Rate_Amt") %>'
                                                                                    ToolTip="Frequency" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtRate_Amt" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="Rate Amount" Style="text-align: right;" />
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="3%" />
                                                                        </asp:TemplateField>
                                                                        <%--Rate From--%>
                                                                        <asp:TemplateField HeaderText="Valid From">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRate_From" runat="server" Text='<%#Eval("Rate_From") %>' ToolTip="Frequency" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtRate_From" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="CashFlow Date" />
                                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRate_From"
                                                                                    PopupButtonID="txtRate_From" ID="CERate_From" Enabled="True">
                                                                                </cc1:CalendarExtender>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Rate To--%>
                                                                        <asp:TemplateField HeaderText="Valid To">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRate_To" runat="server" Text='<%#Eval("Rate_To") %>' ToolTip="Frequency" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtRate_To" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="CashFlow Date" />
                                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRate_To"
                                                                                    PopupButtonID="txtRate_To" ID="CERate_To" Enabled="True">
                                                                                </cc1:CalendarExtender>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%-- Action --%>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                                    CausesValidation="false" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAddrow" CausesValidation="false" runat="server" CommandName="Add"
                                                                                    CssClass="styleGridShortButton" Text="Add"></asp:Button>
                                                                            </FooterTemplate>
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>


                                                <asp:Panel ID="pnlboard" runat="server" CssClass="stylePanel" GroupingText="Board Details">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvBoardDtls" runat="server" Width="98%" AutoGenerateColumns="false"
                                                                    ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvBoardDtls_RowCommand"
                                                                    OnRowDataBound="grvBoardDtls_RowDataBound" OnRowDeleting="grvBoardDtls_RowDeleting">
                                                                    <Columns>
                                                                        <%--Serial Number--%>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRate_Sl" runat="server" Text='<%#Eval("Board_Sl") %>' ToolTip="Cashflow Type" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Tranche Ref No--%>
                                                                        <asp:TemplateField HeaderText="Tranche Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTranche_Ref_No" runat="server" Text='<%#Eval("Tranche_Ref_No") %>'
                                                                                    ToolTip="Tranche Ref No" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlTrancheNo" onmouseover="ddl_itemchanged(this)" runat="server">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVddlTrancheNo" runat="server" Display="None" ControlToValidate="ddlTrancheNo"
                                                                                        ValidationGroup="btnAddInt" InitialValue="0" ErrorMessage="Select Tranche Ref no"
                                                                                        CssClass="styleMandatoryLabel" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Board Resol Date--%>
                                                                        <asp:TemplateField HeaderText="Board Resol Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBoard_Resol_Date" runat="server" Text='<%#Eval("Board_Resol_Date") %>'
                                                                                    ToolTip="CashFlow" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtBoard_Resol_Date" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="Board Resol Date" />
                                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtBoard_Resol_Date"
                                                                                    PopupButtonID="txtBoard_Resol_Date" ID="CEBoard_Resol_Date" Enabled="True">
                                                                                </cc1:CalendarExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Board Resol Amt   --%>
                                                                        <asp:TemplateField HeaderText="Board Resol Amt" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBoard_Resol_Amt" Style="text-align: right" runat="server" Text='<%#Eval("Board_Resol_Amt") %>'
                                                                                    ToolTip="Frequency" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtBoard_Resol_Amt" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="Board Resol Amt" Style="text-align: right;" />
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Board Resol Remark  --%>
                                                                        <asp:TemplateField HeaderText="Board Resol Remark">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBoard_Resol_Remark" runat="server" Text='<%#Eval("Board_Resol_Remark") %>'
                                                                                    ToolTip="Frequency" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtBoard_Resol_Remark" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ToolTip="Board Resol Remark" TextMode="MultiLine" Rows="2" />
                                                                                <%--  <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtBoard_Resol_Remark"
                                                                        PopupButtonID="txtBoard_Resol_Remark" ID="CEBoard_Resol_Remark" Enabled="True">
                                                                    </cc1:CalendarExtender>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <%-- Action --%>
                                                                        <asp:TemplateField ItemStyle-Width="10px" FooterStyle-Width="10px" HeaderStyle-Width="10px">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                                    CausesValidation="false" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAddrow" CausesValidation="false" runat="server" CommandName="Add"
                                                                                    CssClass="styleGridShortButton" Text="Add"></asp:Button>
                                                                            </FooterTemplate>
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="pnlsecuritydetails" runat="server" CssClass="stylePanel" GroupingText="Security Details">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlsecuritytype" onmouseover="ddl_itemchanged(this)" runat="server">
                                                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                                    <asp:ListItem Value="0">UnMapped</asp:ListItem>
                                                                    <asp:ListItem Value="1">Mapped</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblsecuritytype" ToolTip="Security Type" runat="server" Text="Security Type"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMargin" runat="server" Width="165px" MaxLength="20" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtMargin" runat="server" TargetControlID="txtMargin"
                                                                    ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblmargin" ToolTip="Margin" runat="server" Text="Margin Amount" CssClass="styleReqFieldLabel" />
                                                                </label>

                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtsecurityname" runat="server" Width="165px" MaxLength="40" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSecurityName" ToolTip="Security Name" runat="server" Text="Security Name"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtchargeid" runat="server" MaxLength="20" Width="165px" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblchargeid" ToolTip="Margin" runat="server" Text="Charge ID" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txttrustdeeddate" runat="server" ToolTip="Trust Deed Date" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txttrustdeeddate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="txttrustdeeddate"
                                                                    ID="CEtrustdeeddate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lbltrustdeeddate" ToolTip="Trust Deed Date" runat="server" Text="Trust Deed Date"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtHypotheticationDeedDate" runat="server" ToolTip="Hypothetication Deed Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtHypotheticationDeedDate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="txtHypotheticationDeedDate"
                                                                    ID="CElHypoDeedDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblHypotheticationDeedDate" ToolTip="Hypothetication Deed Date" runat="server"
                                                                        Text="Hypothetication Deed Date" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtpropertymortgage" runat="server" ToolTip="Property Mortgage"
                                                                    TextMode="MultiLine" onmouseover="txt_MouseoverTooltip(this)" Rows="2" onkeyup="maxlengthfortxt(100);" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblPropertyMorgage" ToolTip="Property Mortgage" runat="server" Text="Property Mortgage"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtloanagreementdate" runat="server" ToolTip="Hypothetication Deed Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtloanagreementdate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="txtloanagreementdate"
                                                                    ID="CEloanagreementdate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblloanagreemnetdate" ToolTip="Loan Agreement Date" runat="server"
                                                                        Text="Loan Agreement Date" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Fund Pool" ID="tpconsortium" CssClass="tabpan"
                            BackColor="Red" Visible="false">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlconsortium" runat="server" Width="100%" GroupingText="Fund Pool Details"
                                                    CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlTrancheNoCon" onmouseover="ddl_itemchanged(this)" runat="server">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVTrancheNoCon" runat="server" Display="dynamic" ControlToValidate="ddlTrancheNoCon"
                                                                        ValidationGroup="btnAddCon" InitialValue="0" ErrorMessage="Select Tranche Ref no"
                                                                        CssClass="grid_validation_msg_box" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVTrancheNoConM" runat="server" Display="dynamic" ControlToValidate="ddlTrancheNoCon"
                                                                        ValidationGroup="btnModifyCon" InitialValue="0" ErrorMessage="Select Tranche Ref no"
                                                                        CssClass="grid_validation_msg_box" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTrancheNoCon" ToolTip="Tranche Ref no" runat="server" Text="Tranche Ref no"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFunderNameCon" runat="server" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFunderName" runat="server" Display="dynamic" ControlToValidate="txtFunderNameCon"
                                                                        ValidationGroup="btnAddCon" ErrorMessage="Enter Funder Name" CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFunderNameM" runat="server" Display="dynamic" ControlToValidate="txtFunderNameCon"
                                                                        ValidationGroup="btnModifyCon" ErrorMessage="Enter Funder Name" CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFunderNameCon" ToolTip="Funder Name" runat="server" Text="Funder Name"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFunderAddressCon" runat="server" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFunderAddress" runat="server" Display="dynamic" ControlToValidate="txtFunderAddressCon"
                                                                        ValidationGroup="btnAddCon" ErrorMessage="Enter Funder Address" CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFunderAddressM" runat="server" Display="dynamic"
                                                                        ControlToValidate="txtFunderAddressCon" ValidationGroup="btnModifyCon" ErrorMessage="Enter Funder Address"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFunderAddressCon" ToolTip="Funder " runat="server" Text="Funder Address"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtPhoneNoCon" Width="165px" runat="server" MaxLength="100" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ToolTip="Phone Number" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblPhoneNoCon" ToolTip="Phone Number" runat="server" Text="Phone Number"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtContactPersonCon" runat="server" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVContactPerson" runat="server" Display="dynamic" ControlToValidate="txtContactPersonCon"
                                                                        ValidationGroup="btnAddCon" ErrorMessage="Enter Contact Person" CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVContactPersonM" runat="server" Display="dynamic"
                                                                        ControlToValidate="txtContactPersonCon" ValidationGroup="btnModifyCon" ErrorMessage="Enter Contact Person"
                                                                        CssClass="grid_validation_msg_box" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblContactPersonCon" ToolTip="Contact Person" runat="server" Text="Contact Person"
                                                                        CssClass="styleReqFieldLabel" />

                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtEmailIdCon" runat="server" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVEmailIdCon" runat="server" Display="dynamic" ControlToValidate="txtEmailIdCon"
                                                                        ValidationGroup="btnAddCon" ErrorMessage="Enter Email Id" CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVEmailIdConM" runat="server" Display="dynamic" ControlToValidate="txtEmailIdCon"
                                                                        ValidationGroup="btnModifyCon" ErrorMessage="Enter Email Id" CssClass="grid_validation_msg_box"
                                                                        Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblEmailIdCon" ToolTip="Funder " runat="server" Text="Email Id" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAmountPoolPer" runat="server" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtAmountPoolPer" runat="server" TargetControlID="txtAmountPoolPer"
                                                                    ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAmountPoolPer" ToolTip="Amount Pool%" runat="server" Text="Amount Pool%"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAmountPooled" runat="server" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtAmountPooled" runat="server" TargetControlID="txtAmountPooled"
                                                                    ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAmountPooled" ToolTip="Amount Pooled" runat="server" Text="Amount Pooled"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRemarksCon" Width="165px" runat="server" MaxLength="100" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Remarks');" onkeyup="maxlengthfortxt(100);" TextMode="MultiLine"
                                                                    ToolTip="Remarks" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblRemarksCon" ToolTip="Remarks" runat="server" Text="Remarks" CssClass="styleReqFieldLabel" />
                                                                    <asp:Label ID="lblConSlNo" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lblConMode" runat="server" Visible="False"></asp:Label>
                                                            </div>
                                                        </div>


                                                        <tr align="center">
                                                            <td align="center" colspan="4" width="100%" valign="top" height="30px">
                                                                <asp:Button ID="btnAddCon" runat="server" CssClass="styleSubmitShortButton" Text="Add"
                                                                    ValidationGroup="btnAddCon" OnClick="btnAddCon_Click" />
                                                                <asp:Button ID="btnModifyCon" runat="server" CssClass="styleSubmitShortButton" Text="Edit"
                                                                    ValidationGroup="btnModifyCon" Enabled="False" OnClick="btnModifyCon_Click" />
                                                                <asp:Button ID="btnClearCon" runat="server" CausesValidation="False" CssClass="styleSubmitShortButton"
                                                                    Text="Clear_FA" OnClick="btnClearCon_Click" />


                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="grvconsortium" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                OnRowDeleting="grvconsortium_RowDeleting" Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Select">
                                                                                        <ItemTemplate>
                                                                                            <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelectCon_CheckedChanged"
                                                                                                AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Sl No">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="6%" HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Tran Details ID" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblTran_Details_ID" runat="server" Text='<%#Eval("Tran_Details_ID") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Tranche Ref no">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblTranche_Ref_no" runat="server" Text='<%#Eval("Tranche_Ref_no") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Funder Name">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblFunder_Name" runat="server" Text='<%#Eval("Funder_Name") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Funder Address">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblFunder_Address" runat="server" Text='<%#Eval("Funder_Address") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Contact Person">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblContact_Person" runat="server" Text='<%#Eval("Contact_Person") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Email Id">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmail_Id" runat="server" Text='<%#Eval("Email_Id") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Phone Number">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblPhone_Number" runat="server" Text='<%#Eval("Phone_Number") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Amount Pool Percentage" ItemStyle-HorizontalAlign="Right">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAmount_Pool_Per" runat="server" Text='<%#Eval("Amount_Pool_Per") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Amount Pooled" ItemStyle-HorizontalAlign="Right">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAmount_Pooled" runat="server" Text='<%#Eval("Amount_Pooled") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="remarks">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("remarks") %> '></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Delete">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                                                CausesValidation="false">
                                                                                            </asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>

                                                                            <asp:ValidationSummary ID="VSbtnAddCon" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                                                ValidationGroup="btnAddCon" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                                            <asp:ValidationSummary ID="VSbtnModifyCon" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                                                ValidationGroup="btnModifyCon" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                    </div>
                                                </asp:Panel>

                                            </div>
                                        </div>


                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Tranche Details" ID="TabPanel2" CssClass="tabpan"
                            BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel5" runat="server" Width="100%" GroupingText="tranche Details"
                                                    CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddltrancherefnoTrn" ToolTip="Tranche Ref No/Serial No" runat="server"
                                                                    AutoPostBack="true" Style="text-align: Left" OnSelectedIndexChanged="ddltrancherefnoTrn_SelectedIndexChanged"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">

                                                                    <asp:RequiredFieldValidator ID="RFVddltrancherefnoTrn" runat="server" Display="dynamic"
                                                                        ControlToValidate="ddltrancherefnoTrn" ValidationGroup="btnAddTrn" InitialValue="0"
                                                                        ErrorMessage="Select Tranche Ref no" CssClass="grid_validation_msg_box" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVddltrancherefnoTrnM" runat="server" Display="dynamic"
                                                                        ControlToValidate="ddltrancherefnoTrn" ValidationGroup="btnModifyTrn" InitialValue="0"
                                                                        ErrorMessage="Select Tranche Ref no" CssClass="grid_validation_msg_box" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTranche_Ref_NoTrn" ToolTip="Tranche Ref No/Serial No" runat="server"
                                                                        Text="Tranche Ref No/Serial No" CssClass="styleReqFieldLabel" class="md-form-control form-control login_form_content_input requires_true" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFromDateTrn" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                    ToolTip="Due Date" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFromDateTrn"
                                                                    PopupButtonID="txtFromDateTrn" ID="CEtxtFromDateTrn" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVtxtFromDateTrn" runat="server" ControlToValidate="txtFromDateTrn"
                                                                        CssClass="grid_validation_msg_box" Display="dynamic" SetFocusOnError="True" ValidationGroup="btnAddTrn"
                                                                        ErrorMessage="Enter From date"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVtxtFromDateTrnM" runat="server" ControlToValidate="txtFromDateTrn"
                                                                        CssClass="grid_validation_msg_box" Display="dynamic" SetFocusOnError="True" ValidationGroup="btnModifyTrn"
                                                                        ErrorMessage="Enter From date"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFromDateTrn" ToolTip="From Date" runat="server" Text="From Date"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtToDateTrn" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                    ToolTip="Due Date" Visible="false" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtToDateTrn"
                                                                    PopupButtonID="txtToDateTrn" ID="CEtxtToDateTrn" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVtxtToDateTrn" runat="server" ControlToValidate="txtToDateTrn"
                                                                        CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnAddTrn"
                                                                        ErrorMessage="Enter To date" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVtxtToDateTrnM" runat="server" ControlToValidate="txtToDateTrn"
                                                                        CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnModifyTrn"
                                                                        ErrorMessage="Enter To date" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblToDateTrn" ToolTip="To Date" runat="server" Text="To Date" Visible="false"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtbaserateTrn" ToolTip="Base Rate%" runat="server" Style="text-align: right"
                                                                    onchange="FuncalculateTotalRate();" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtbaserateTrn" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtbaserateTrn">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblbaserateTrn" ToolTip="Base Rate %" runat="server" Text="Base Rate %"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtVariablerateTrn" ToolTip="Base Rate%" runat="server" Style="text-align: right"
                                                                    onchange="FuncalculateTotalRate();" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtVariablerateTrn" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtVariablerateTrn">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSpreadRateTrn" ToolTip="Spread Rate %" runat="server" Text="Spread Rate %"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <%-- <asp:RequiredFieldValidator ID="RFVtxtVariablerateTrn" runat="server" ControlToValidate="txtVariablerateTrn"
                                                        CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnAddTrn"
                                                        ErrorMessage="Enter Spread Rate %"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RFVtxtVariablerateTrnM" runat="server" ControlToValidate="txtVariablerateTrn"
                                                        CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnModifyTrn"
                                                        ErrorMessage="Enter Spread Rate %" Enabled="false" Visible="false"></asp:RequiredFieldValidator>--%>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txttotalrateTrn" ToolTip="Total Rate%" runat="server" Style="text-align: right"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxttotalrateTrn" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txttotalrateTrn">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTotalRateTrn" ToolTip="Total Rate %" runat="server" Text="Total Rate %"
                                                                        CssClass="styleReqFieldLabel" class="md-form-control form-control login_form_content_input requires_true" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTDSrateTrn" ToolTip="TDS Rate%" runat="server" Style="text-align: right"
                                                                    Visible="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:DropDownList ID="ddlTDSsection" ToolTip="Tranche Ref No/Serial No" runat="server"
                                                                    AutoPostBack="true" Style="text-align: Left" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTDSrateTrn" ToolTip="TDS Section" runat="server" Text="TDS Section"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtservicerateTrn" ToolTip="Service Rate%" runat="server" Style="text-align: right"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtservicerateTrn" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtservicerateTrn">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblservicerate" ToolTip="Service Rate %" runat="server" Text="Service Tax"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtotheramt" ToolTip="Others Rate%" runat="server" Style="text-align: right"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtotheramt" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtotheramt">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblOthersRateTrn" ToolTip="Others-Rate(AMT)" runat="server" Text="Others_Rate(Amt)"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtothersTrn" ToolTip="Others Rate%" runat="server" Style="text-align: right"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtothersTrn" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtothersTrn">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label1" ToolTip="Others-Rate(AMT)" runat="server" Text="Others_Rate(Amt)"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkgrossup" runat="server" ToolTip="Gross Up" AutoPostBack="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                                <asp:Label ID="lblgrossup" ToolTip="Gross Up" runat="server" Text="Gross Up" CssClass="styleReqFieldLabel" />

                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkcof" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                                <asp:Label ID="lblcof" runat="server" Text="Part of COF" CssClass="styleReqFieldLabel" />

                                                            </div>
                                                        </div>

                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtCostofFundTrn" ToolTip="Cost of Fund%" runat="server" Visible="false"
                                                                    Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCostofFundTrn" ToolTip="Cost of Fund %" runat="server" Text="Cost of Fund %"
                                                                        CssClass="styleReqFieldLabel" Visible="false" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDiscPer" ToolTip="Discount Percentage" runat="server" Style="text-align: right"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtDiscPer" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtDiscPer">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDiscPer" ToolTip="Discount Percentage" runat="server" Text="Discount %"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDiscAmount" ToolTip="Discount Amount" runat="server" Style="text-align: right"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtDiscAmount" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                    TargetControlID="txtDiscAmount">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDiscAmount" ToolTip="Discount Amount" runat="server" Text="Discount Amount"
                                                                        CssClass="styleReqFieldLabel" />
                                                                    <asp:Label ID="lblTrnSlNo" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lblTrnMode" runat="server" Visible="False"></asp:Label>
                                                                    <asp:HiddenField ID="hdnSpreadRateId" runat="server"></asp:HiddenField>
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="row">
                                                            <div align="right">
                                                                <button class="css_btn_enabled" id="btnAddTrn" title="Add,Alt+A" onclick="if(fnConfirmAdd('btnAddTrn'))" 
                                                                    causesvalidation="false" onserverclick="btnAddTrn_Click" runat="server"
                                                                    type="button" accesskey="A">
                                                                    <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                </button>
                                                                <button class="css_btn_enabled" id="btnModifyTrn" title="Edit,Alt+M" onclick="if(fnCheckPageValidators('btnModifyTrn'))" causesvalidation="false" onserverclick="btnModifyTrn_Click" runat="server"
                                                                    type="button" accesskey="M">
                                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                                </button>
                                                                <button class="css_btn_enabled" id="btnClearTrn" title="btnClearTrn,Alt+R" causesvalidation="false" onserverclick="btnClearTrn_Click" runat="server"
                                                                    type="button" accesskey="R">
                                                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                                                                </button>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvtranche" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                        Width="100%" OnRowDataBound="grvtranche_RowDataBound" OnRowDeleting="grvtranche_RowDeleting">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Select">
                                                                                <ItemTemplate>
                                                                                    <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelectTrn_CheckedChanged"
                                                                                        AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnSlno1" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Tranche Ref. No."
                                                                                FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblLookupCode" runat="server" Text='<%#Bind("tranche_Ref_No") %>'
                                                                                        Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lbltrancheNo" ToolTip="Tranche Ref. No." Width="95%" runat="server"
                                                                                        Text='<%#Eval("tranche_Ref_No")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="From Date">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblFromDate" runat="server" Text='<%#Eval("From_Date") %>' ToolTip="From Date" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="To Date" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblToDate" runat="server" Text='<%#Eval("To_Date") %>' ToolTip="From Date" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Base Rate%" FooterStyle-Width="20%"
                                                                                ItemStyle-Width="12%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblbaserate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Base_Rate_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Variable Rate%"
                                                                                FooterStyle-Width="12%" ItemStyle-Width="12%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblvariablerate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Variable_Rate_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Total Rate%" FooterStyle-Width="20%"
                                                                                ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbltotalrate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Total_Rate_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="TDS Section" FooterStyle-Width="20%"
                                                                                ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbltdsrate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("TDS_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Service Tax%" FooterStyle-Width="20%"
                                                                                ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblservicetaxrate" ToolTip="Base Rate%" Width="95%" runat="server"
                                                                                        Text='<%#Eval("Service_Tax_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Others%" FooterStyle-Width="20%"
                                                                                ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblothers" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Others_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Others AMT" FooterStyle-Width="20%"
                                                                                ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblothersamt" ToolTip="Others Amt" Width="95%" runat="server" Text='<%#Eval("Others_Amt")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Cost of Fund%" Visible="false"
                                                                                FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblcost" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Cost_of_Funds_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Discount %" FooterStyle-Width="20%"
                                                                                ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDisc_Per" ToolTip="Discount %" Width="95%" runat="server" Text='<%#Eval("Disc_Per")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Discount Amount"
                                                                                FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDisc_Amt" ToolTip="Discount Amount" Width="95%" runat="server"
                                                                                        Text='<%#Eval("Disc_Amt")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Gross_up" ItemStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkGrossUp" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem, "Gross_up").ToString().ToUpper() == "TRUE" %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="COF" ItemStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkcof" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem, "COF").ToString().ToUpper() == "TRUE" %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Action">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                                                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>


                                                            <asp:ValidationSummary ID="VSbtnAddTrn" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                                ValidationGroup="btnAddTrn" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                            <asp:ValidationSummary ID="VSbtnModifyTrn" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                                                ValidationGroup="btnModifyTrn" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                        </div>
                                                    </div>

                                                </asp:Panel>
                                            </div>
                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tpDocuments" runat="server" HeaderText="Documents Details" CssClass="tabpan"
                            BackColor="Red" Width="99%">
                            <HeaderTemplate>
                                Documents Details
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upDocDtls" runat="server">
                                    <ContentTemplate>
                                        <%--<div style="overflow-x: auto; overflow-y: auto; height: 300px; width: 100%">--%>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="grvDocDtls" runat="server" AutoGenerateColumns="False" Width="100%"
                                                        BorderColor="Gray" DataKeyNames="Doc_Type_Id" CssClass="styleInfoLabel" ShowFooter="true"
                                                        OnRowDataBound="grvDocDtls_RowDataBound" OnRowCommand="grvDocDtls_RowCommand"
                                                        OnRowDeleting="grvDocDtls_RowDeleting" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="SlNo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Tranche Ref No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTranche_Ref_No" runat="server" Text='<%#Eval("Tranche_Ref_No") %>'
                                                                        ToolTip="Tranche Ref No" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlTrancheNo" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RFVddlTrancheNo" runat="server" Display="dynamic" ControlToValidate="ddlTrancheNo"
                                                                                ValidationGroup="btnAddDoc" InitialValue="0" ErrorMessage="Select Tranche Ref no"
                                                                                CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Type Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc_Type_Id" runat="server" Text='<%# Bind("Doc_Type_Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Type" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc_Type" runat="server" Text='<%# Bind("Doc_Type") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlDoc_Type" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RFVddlDoc_Type" runat="server" Display="dynamic" ControlToValidate="ddlDoc_Type"
                                                                                ValidationGroup="lnkAddDoc" InitialValue="0" ErrorMessage="Select Doc Type" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Description" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc_Description" runat="server" Text='<%# Bind("Doc_Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtDoc_Description" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CollectedById" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCollectedBy" runat="server" Text='<%# Bind("Collected_By_Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Collected By" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblColletedBy" runat="server" Text='<%# Bind("Collected_By") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlCollectedBy" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RFVddlCollectedBy" runat="server" Display="dynamic"
                                                                                ControlToValidate="ddlCollectedBy" ValidationGroup="lnkAddDoc" InitialValue="0"
                                                                                ErrorMessage="Select Collected By" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Collected Date" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCollected_Date" runat="server" Text='<%# Bind("Collected_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtCollectedDate" runat="server" class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CECollectedDate" runat="server" Enabled="True" TargetControlID="txtCollectedDate"
                                                                            OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RFVtxtCollectedDate" runat="server" Display="dynamic"
                                                                                ControlToValidate="txtCollectedDate" ValidationGroup="lnkAddDoc" ErrorMessage="Enter Collected Date"
                                                                                CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblScanned_Date" runat="server" Text='<%# Bind("Scanned_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtScanned_Date" runat="server" class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CEScanned_Date" runat="server" Enabled="True" TargetControlID="txtScanned_Date"
                                                                            OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Scanned Ref No" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblScanned_Ref_No" runat="server" Visible="false" Text='<%# Bind("Scanned_Ref_No") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="File View">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Scanned_Ref_No") %>'
                                                                        OnClick="hyplnkView_Click" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEditDisabled"
                                                                        runat="server" />
                                                                    <asp:Label ID="lblFile_Upload" runat="server" Visible="false" Text='<%# Bind("Scanned_Ref_No") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <cc1:AsyncFileUpload ID="asyFileUpload" runat="server" Width="175px" OnUploadedComplete="asyncFileUpload_UploadedComplete"
                                                                        onmouseover="FunShowPath(this);" />
                                                                    <asp:Label runat="server" ID="myThrobber"></asp:Label>
                                                                    <asp:HiddenField runat="server" ID="hidThrobber" />
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:LinkButton ID="lnkAdd" Width="100%" ToolTip="Add to the grid" CommandName="Add"
                                                                        ValidationGroup="lnkAddDoc" runat="server" Text="Add"></asp:LinkButton>
                                                                </FooterTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:Panel ID="pnlNCDDetails" runat="server" GroupingText="NCD / BONDS Details" CssClass="stylePanel">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSubscriptionFrom" runat="server" ToolTip="Subscription From"
                                                                        onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender ID="CESubscriptionFrom" runat="server" Enabled="True" TargetControlID="txtSubscriptionFrom"
                                                                        OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblSubscriptionFrom" Text="Subscription From"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSubscriptionTo" runat="server" ToolTip="Subscription To"
                                                                        onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender ID="CESubscriptionTo" runat="server" Enabled="True" TargetControlID="txtSubscriptionTo"
                                                                        OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblSubscriptionTo" Text="Subscription To"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div style="margin-top: 10px;" id="chkCall" runat="server" visible="true">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:CheckBoxList CssClass="styleDisplayLabel" RepeatDirection="Horizontal" runat="server"
                                                                            ID="chkCallPut">
                                                                            <asp:ListItem Text="call" Value="0"></asp:ListItem>

                                                                        </asp:CheckBoxList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="margin-top: 10px;" id="chkput" runat="server" visible="true">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:CheckBoxList CssClass="styleDisplayLabel" RepeatDirection="Horizontal" runat="server"
                                                                            ID="chkCallPut1">
                                                                            <asp:ListItem Text="Put" Value="1"></asp:ListItem>

                                                                        </asp:CheckBoxList>
                                                                        <%-- <label>
                                                                        <asp:Label runat="server" ID="lblCall" Text="Call"></asp:Label>
                                                                        <asp:Label runat="server" ID="lblPut" Text="Put"></asp:Label>
                                                                    </label>--%>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>

                                        <asp:ValidationSummary ID="VSlnkAddDoc" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                            ValidationGroup="lnkAddDoc" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />

                                        <%-- </div>--%>
                                        <%--   <table style="border-collapse: collapse; border-left: solid 1px #aaaaff; border-top: solid 1px #aaaaff;"
                                        runat="server" cellpadding="3" id="clientSide" />
                                    <asp:Label runat="server" Text="&nbsp;" ID="uploadResult" />--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
            </div>
        </div>
    </div>





    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <div align="right">
                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Save'))"
                    type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="Main"
                    onclientclick="return fnCheckPageValidators('Main')">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                    type="button" accesskey="L" title="Clear[Alt+L]">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                    type="button" accesskey="X" title="Exit[Alt+X]">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
            </div>

            <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" /> --%>
        </ContentTemplate>
    </asp:UpdatePanel>

    <br />
    <asp:ValidationSummary ID="vsDealMaster" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
        ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
    <asp:ValidationSummary ID="vsAdd" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
        ValidationGroup="vgAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
    <asp:CustomValidator ID="cvDealMaster" runat="server" CssClass="styleMandatoryLabel"
        Enabled="true" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false"
        CssClass="styleMandatoryLabel" ValidationGroup="BVgAdd" ShowMessageBox="false"
        HeaderText="Correct the following validation(s):" />


    <script type="text/javascript">

        function FunShowPath(input) {
            if (input != null) {
                var objID = input.id;
                var myThrobber = document.getElementById((input.id).replace('asyFileUpload', 'myThrobber'));
                if (myThrobber != null) {
                    if (myThrobber.innerText != "")
                        input.setAttribute('title', myThrobber.innerText);
                }
            }
        }


        function FuncalculateTotalRate() {
            var txtbaserateTrn = document.getElementById('<%=txtbaserateTrn.ClientID%>');
            var txtVariablerateTrn = document.getElementById('<%=txtVariablerateTrn.ClientID%>');
            var txttotalrateTrn = document.getElementById('<%=txttotalrateTrn.ClientID%>');
            var hdnSpreadRateId = document.getElementById('<%=hdnSpreadRateId.ClientID%>');

            var baserate = 0;
            var varbrate = 0; var SpreadRateId = 0;
            if (txtbaserateTrn != null) {
                if (txtbaserateTrn.value != '')
                    baserate = txtbaserateTrn.value;

            }
            if (txtVariablerateTrn != null) {
                if (txtVariablerateTrn.value != '')
                    varbrate = txtVariablerateTrn.value;

            }

            txttotalrateTrn.value = parseFloat(baserate) + parseFloat(varbrate);
            if (hdnSpreadRateId != null) {
                if (hdnSpreadRateId.value == '5')
                    txttotalrateTrn.value = parseFloat(baserate) - parseFloat(varbrate);

            }
        }

    </script>

    <%--    <script src="../Scripts/Common.js" language="javascript" type="text/javascript"></script>
    --%>
    <%--  <script language="javascript" type="text/javascript">
        //            var querymode;
        //            querymode=location.search.split("qsMode=");
        //            querymode=querymode[1];

        //            var tab ;
        function TAX() {
            var TAX = document.getElementById('<%=txtTAXNo.ClientID%>');
            var VAT = document.getElementById('<%=txtVATNo.ClientID%>');
            var rfvVAT = document.getElementById('<%=rfvVAT.ClientID%>');
            var rfvTAX = document.getElementById('<%=rfvTAX.ClientID%>');

            if (TAX.value != "") {
                rfvVAT.Enabled = false;

            }
            else if (VAT.value != "") {
                rfvTAX.Enabled = false;
            }
            else {
                rfvTAX.Enabled = true;
            }

            //   if(TAX.value=="")
            //   {
            //   rfvVAT.Enabled=true ;
            //   VAT .Enabled=true  ;
            //   }
            //   else
            //   {
            //   VAT .Enabled=false ;
            //   rfvVAT .Enabled =false ;
            //   }

        }

        function fnTAX_VATvalidation() {
            var TAX = document.getElementById('<%=txtTAXNo.ClientID%>');
            var VAT = document.getElementById('<%=txtVATNo.ClientID%>');
            var rfvVAT = document.getElementById('<%=rfvVAT.ClientID%>');
            var rfvTAX = document.getElementById('<%=rfvTAX.ClientID%>');

            if (TAX.value != "") {
                ValidatorEnable(rfvVAT, false);
                //       rfvVAT .enabled=false ;
                //       VAT.setAttribute("Readonly","true") ;
                //       VAT .enabled=false ;

            }
            else if (VAT.value != "") {
                ValidatorEnable(rfvTAX, false);
            }
            else {
                ValidatorEnable(rfvTAX, false);
                ValidatorEnable(rfvVAT, false);
            }
        }

        function fnvalidFundername(txtFunderName) {
            if (txtFunderName.value == "0") {
                alert('Funder Name should not be 0');
                document.getElementById(txtFunderName.id).focus();
            }
        }
        //var index=0;

        function funCheckFirstLetterisNumeric(textbox, msg) {

            var FieldValue = new Array();
            FieldValue = textbox.value.trim();
            if (FieldValue.length > 0 && FieldValue.value != '') {
                if (isNaN(FieldValue[0])) {
                    return true;
                }
                else {
                    alert(msg + ' name cannot begin with a number');
                    textbox.focus();
                    textbox.value = '';
                    event.returnValue = false;
                    return false;
                }
            }
        }


        function FnValidate(txtTAXNo, txtVATNo, rfvVAT, rfvTAX) {
            //alert(rfvTAX);
            //document.getElementById(rfvTAX).enabled=false;
            if ((document.getElementById(txtTAXNo).value == '') && (document.getElementById(txtVATNo).value == '')) {

                document.getElementById(rfvVAT).enabled = true;
                document.getElementById(rfvTAX).enabled = true;
                //document.getElementById(rfvVAT).className = 'styleReqFieldFocus';
                //document.getElementById(rfvTAX).className = 'styleReqFieldFocus';
            }
            else {
                document.getElementById(rfvVAT).enabled = false;
                document.getElementById(rfvTAX).enabled = false;

            }
            //        if(!fnCheckPageValidators('Main',false))
            //            return false;

            return true;
        }

        function fnDiableCredit(txtTAXNo, txtVATNo, ctrlId) {

            var txtTAXNo = document.getElementById(txtTAXNo);
            var txtVATNo = document.getElementById(txtVATNo);

            //var txtTAXNo=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtTAXNo');
            //var txtVATNo=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtVATNo');
            txtVATNo.disabled = false;
            txtTAXNo.disabled = false;
            //alert(txtTAXNo.value);
            if ((txtTAXNo.value == "") && (txtVATNo.value == "")) {
                txtTAXNo.value = "";
                txtVATNo.value = "";
                return;
            }

            if ((txtTAXNo.value != "") && (ctrlId == 'C')) {
                txtVATNo.value = "";
                return;
            }
            if ((txtVATNo.value != "") && (ctrlId == 'D')) {
                txtTAXNo.value = "";
                return;
            }

        }
      
    </script>--%>
</asp:Content>
