<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GOrg_RiskLimitGuide_Master, App_Web_54a2gfky" %>

<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading"> </asp:Label>
                            </h6>
                        </div>

                    </div>
                    <div class="row">

                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFromYearMonthBase" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlFromYearMonthBase_SelectedIndexChanged"
                                        ToolTip="Base From Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlFromYearMonthBase" runat="server" CssClass="validation_msg_box_sapn"
                                            ErrorMessage="Select From Year Month" ValidationGroup="Ok" Display="Dynamic"
                                            SetFocusOnError="True" ControlToValidate="ddlFromYearMonthBase" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFromYearMonthBase" runat="server" Text="From Year Month" CssClass="styleReqFieldLabel" ToolTip="Base From Year Month"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlToYearMonthBase" runat="server"
                                        OnSelectedIndexChanged="ddlToYearMonthBase_SelectedIndexChanged" AutoPostBack="true"
                                        ToolTip="Base To Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlToYearMonthBase" runat="server" ErrorMessage="Select To Year Month"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlToYearMonthBase"
                                            InitialValue="0" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblToYearMonthBase" runat="server" Text="To Year Month" CssClass="styleReqFieldLabel" ToolTip="Base To Year Month"> </asp:Label>
                                    </label>
                                </div>
                            </div>


                        </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlTolerance" runat="server" ToolTip="Details" GroupingText="Tolerance"
                                CssClass="stylePanel">
                                <div class="row">

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCreditRiskH" runat="server" MaxLength="18" onChange="return fnCheckPercentage(this,'Credit Rish-High')"
                                                 class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                               <%-- <asp:RangeValidator ID="RvCrtxtCreditRiskH" runat="server" ControlToValidate="txtCreditRiskH" Display="Dynamic" MaximumValue="100.00" MinimumValue="0.00" ErrorMessage="Invalid Percentage">
                                                </asp:RangeValidator>--%>
                                                <asp:RequiredFieldValidator ID="rfvCreditRiskH" runat="server" ControlToValidate="txtCreditRiskH"
                                                    ValidationGroup="Save" ErrorMessage="Enter Credit Risk High" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                <cc1:FilteredTextBoxExtender ID="fteCreditRiskH" TargetControlID="txtCreditRiskH"
                                                    FilterType="Custom,Numbers"
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblCreditRiskH" runat="server" Text="Credit Risk - High" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCreditRiskM" runat="server" MaxLength="18" onChange="return fnCheckPercentage(this,'Credit Rish-Medium')"
                                                 class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCreditRiskM" runat="server" ControlToValidate="txtCreditRiskM"
                                                    ValidationGroup="Save" ErrorMessage="Enter Credit Risk Medium" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                 <cc1:FilteredTextBoxExtender ID="fteCreditRiskM" TargetControlID="txtCreditRiskM"
                                                    FilterType="Custom,Numbers"
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblCreditRiskM" runat="server" Text="Credit Risk - Medium" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCreditRiskML" runat="server" MaxLength="18" onChange="return fnCheckPercentage(this,'Credit Rish-Medium Low')"
                                                 class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCreditRiskML" runat="server" ControlToValidate="txtCreditRiskML"
                                                    ValidationGroup="Save" ErrorMessage="Enter Credit Risk Medium Low" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                <cc1:FilteredTextBoxExtender ID="fteCreditRiskML" TargetControlID="txtCreditRiskML"
                                                    FilterType="Custom,Numbers"
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblCreditRiskML" runat="server" Text="Credit Risk - Medium Low" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCreditRiskL" runat="server" MaxLength="18" onChange="return fnCheckPercentage(this,'Credit Risk - Low')"
                                                 class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCreditRiskL" runat="server" ControlToValidate="txtCreditRiskL"
                                                    ValidationGroup="Save" ErrorMessage="Enter Credit Risk Low" Display="Dynamic" CssClass="validation_msg_box_sapn"/>

                                                <cc1:FilteredTextBoxExtender ID="fteCreditRiskL" TargetControlID="txtCreditRiskL"
                                                    FilterType="Custom,Numbers"
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblCreditRiskL" runat="server" Text="Credit Risk - Low" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    
                                </div>
                               

                            </asp:Panel>
                        </div>
                    </div>

                     <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <asp:Panel ID="pnlBankBorrowings" runat="server" ToolTip="Bank Borrowings" GroupingText="Bank Borrowings"
                                CssClass="stylePanel">
                                 <div class="row">

                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtLongTermMin" runat="server"  MaxLength="18" onChange="return fnCheckPercentage(this,'Long Term Min')"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLongTermMin" runat="server" ControlToValidate="txtLongTermMin"
                                                    ValidationGroup="Save" ErrorMessage="Enter Long Term Min" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                 <cc1:FilteredTextBoxExtender ID="fteLongTermMin" TargetControlID="txtLongTermMin"
                                                    FilterType="Custom,Numbers" ValidChars="."
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblLongTermMin" runat="server" Text="Long Term Min" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtLongTermMax" runat="server"   MaxLength="18" onChange="return fnCheckPercentage(this,'Long Term Max')"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLongTermMax" runat="server" ControlToValidate="txtLongTermMax"
                                                    ValidationGroup="Save" ErrorMessage="Enter Long Term Max" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                 <cc1:FilteredTextBoxExtender ID="fteLongTermMax" TargetControlID="txtLongTermMax"
                                                    FilterType="Custom,Numbers" ValidChars="."
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="Label1" runat="server" Text="Long Term Max" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtShortTermMin" runat="server"   MaxLength="18" onChange="return fnCheckPercentage(this,'Short Term Min')"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvShortTermMin" runat="server" ControlToValidate="txtShortTermMin"
                                                    ValidationGroup="Save" ErrorMessage="Enter Short Term Min" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                <cc1:FilteredTextBoxExtender ID="fteShortTermMin" TargetControlID="txtShortTermMin"
                                                    FilterType="Custom,Numbers" ValidChars="."
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="Label2" runat="server" Text="Short Term Min" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtShortTermMax" runat="server"   MaxLength="18" onChange="return fnCheckPercentage(this,'Short Term Max')"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvShortTermMax" runat="server" ControlToValidate="txtShortTermMax"
                                                    ValidationGroup="Save" ErrorMessage="Enter Short Term Max" Display="Dynamic" CssClass="validation_msg_box_sapn"/>

                                                <cc1:FilteredTextBoxExtender ID="fteShortTermMax" TargetControlID="txtShortTermMax"
                                                    FilterType="Custom,Numbers" ValidChars="."
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="Label3" runat="server" Text="Short Term Max" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                </div>
                               
                               

                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <asp:Panel ID="pnlIndExposure" runat="server" ToolTip="Industry Exposure" GroupingText="Industry Exposure"
                                CssClass="stylePanel">
                                 <div class="row">

                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTrading" runat="server" MaxLength="5"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftbexTrading" TargetControlID="txtTrading"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvTrading" runat="server" ControlToValidate="txtTrading"
                                                    ValidationGroup="Save" ErrorMessage="Enter Trading" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="Label4" runat="server" Text="Trading" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtConstruc" runat="server"  MaxLength="5"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftbexConstruc" TargetControlID="txtConstruc"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvConstruc" runat="server" ControlToValidate="txtConstruc"
                                                    ValidationGroup="Save" ErrorMessage="Enter Construction" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="Label5" runat="server" Text="Construction" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtServices" runat="server"  MaxLength="5"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftbexServices" TargetControlID="txtServices"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvServices" runat="server" ControlToValidate="txtServices"
                                                    ValidationGroup="Save" ErrorMessage="Enter Services" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="Label6" runat="server" Text="Services" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtManufacture" runat="server"  MaxLength="5"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                             <cc1:FilteredTextBoxExtender ID="ftbexManufacture" TargetControlID="txtManufacture"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvManufacture" runat="server" ControlToValidate="txtManufacture"
                                                    ValidationGroup="Save" ErrorMessage="Enter Manufacturing" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="Label7" runat="server" Text="Manufacturing" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPersonal" runat="server" 
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            
                                             <cc1:FilteredTextBoxExtender ID="ftbexPersonal" TargetControlID="txtPersonal"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPersonal" runat="server" ControlToValidate="txtPersonal"
                                                    ValidationGroup="Save" ErrorMessage="Enter Personal" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="Label8" runat="server" Text="Personal" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtQuickMor" runat="server" MaxLength="5"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                            <cc1:FilteredTextBoxExtender ID="ftbexQuickMor" TargetControlID="txtQuickMor"
                                                    FilterType="Numbers"
                                                    runat="server" Enabled="True" />

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvQuickMor" runat="server" ControlToValidate="txtQuickMor"
                                                    ValidationGroup="Save" ErrorMessage="Enter Quick Mortality Months" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="Label9" runat="server" Text="Quick Mortality Months" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                </div>
                               
                               

                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlBankBorrowings1" runat="server" ToolTip="Risk Limit Details" GroupingText="Risk Limit Details"
                                CssClass="stylePanel">
                              <div class="row">
                                 <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)"
                                                AutoPostBack="true">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                    ValidationGroup="btnDetailsAdd" ErrorMessage="Select Line of Business" InitialValue="0"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label runat="server" Text="Line of Business" ID="lbllOB" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                 <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtOverDue" runat="server" MaxLength="5" onChange="return fnCheckPercentage(this,'Overdue %')"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvOverDue" runat="server" ControlToValidate="txtOverDue"
                                                    ValidationGroup="btnDetailsAdd" ErrorMessage="Enter Overdue %" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                
                                            <cc1:FilteredTextBoxExtender ID="fteOverDue" TargetControlID="txtOverDue"
                                                    FilterType="Numbers" ValidChars="." 
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="Label10" runat="server" Text="Overdue %" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtNPA" runat="server"  MaxLength="5" onChange="return fnCheckPercentage(this,'NPA%')"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvNPA" runat="server" ControlToValidate="txtNPA"
                                                    ValidationGroup="btnDetailsAdd" ErrorMessage="Enter NPA %" Display="Dynamic" CssClass="validation_msg_box_sapn"/>

                                                <cc1:FilteredTextBoxExtender ID="fteNPA" TargetControlID="txtNPA"
                                                    FilterType="Numbers" ValidChars="." 
                                                    runat="server" Enabled="True" />

                                            </div>
                                            <label>
                                                <asp:Label ID="Label11" runat="server" Text="NPA%" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtProvision" runat="server"  MaxLength="5" onChange="return fnCheckPercentage(this,'Provision Coverage %')"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvProvision" runat="server" ControlToValidate="txtProvision"
                                                    ValidationGroup="btnDetailsAdd" ErrorMessage="Enter Provision Coverage %" Display="Dynamic" CssClass="validation_msg_box_sapn"/>

                                                <cc1:FilteredTextBoxExtender ID="fteProvision" TargetControlID="txtProvision"
                                                    FilterType="Numbers" ValidChars="." 
                                                    runat="server" Enabled="True" />
                                            </div>
                                            <label>
                                                <asp:Label ID="Label12" runat="server" Text="Provision Coverage %" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>

                                    <asp:Label ID="lblExecutiveSlNo" runat="server" Visible="False"></asp:Label>

                                    </div>

                                  </div>

                                <div align="right">
                                    <button class="css_btn_enabled" id="btnAdd" title="Add" onclick="if(fnConfirmAdd('btnDetailsAdd'))" causesvalidation="false" onserverclick="btnAdd_Click" runat="server"
                                        type="button">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;Add
                                    </button>
                                    <button class="css_btn_enabled" id="btnModify" title="Edit" onclick="if(fnConfirmAdd('btnDetailsAdd'))" causesvalidation="false" onserverclick="btnModify_Click" runat="server"
                                        type="button">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Modify
                                    </button>
                                    <button class="css_btn_enabled" id="btnCleargrid" title="Clear" causesvalidation="false" onserverclick="btnCleargrid_Click" runat="server"
                                        type="button">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clear
                                    </button>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvDetails" runat="server" AutoGenerateColumns="False" OnRowDeleting="grvDetails_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBDetailsSelect_CheckedChanged"
                                                                AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sl No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvSerialNo" runat="server" Text='<%#Eval("slno") %> '></asp:Label>
                                                            <asp:Label ID="lblgvRiskLimitDtlID" runat="server" Text='<%#Eval("RiskLimitDtlID") %> ' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Line of Business">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvLOB" runat="server" Text='<%#Eval("LOB") %> '></asp:Label>
                                                            <asp:Label ID="lblLOBid" runat="server" Visible="false" Text='<%#Eval("LOB_ID") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Overdue %">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvOverdue" runat="server" Text='<%#Eval("Overdue") %> '></asp:Label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="NPA %">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvNPA" runat="server" Text='<%#Eval("NPA") %> '></asp:Label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Provision Coverage %">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvProvision" runat="server" Text='<%#Eval("Provision") %> '></asp:Label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Delete" >
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn_delete"
                                                                CausesValidation="false"></asp:Button>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlFAMapping" runat="server" ToolTip="FA Mapping" GroupingText="Risk FA Mapping"
                                CssClass="stylePanel">
                                <div class="row">

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlGLCode" runat="server" ServiceMethod="GetGLCodeList" IsMandatory="true"
                                                ValidationGroup="AddFAMapDetails" ErrorMessage="Enter GL Code" AutoPostBack="true" OnItem_Selected="ddlGLCode_Item_Selected" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            
                                            <label>
                                                <asp:Label runat="server" Text="GL Code" ID="Label14" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtGLDesc" runat="server" Enabled="false"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            
                                            <label>
                                                <asp:Label ID="Label15" runat="server" Text="GL Desc" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtProvCovrg" runat="server" MaxLength="5"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvProvCovrg" runat="server" ControlToValidate="txtProvCovrg"
                                                    ValidationGroup="AddFAMapDetails" ErrorMessage="Enter Provision Coverage %" Display="Dynamic"
                                                     CssClass="validation_msg_box_sapn"/>
                                                
                                                <cc1:FilteredTextBoxExtender ID="fteProvCovrg" TargetControlID="txtProvCovrg"
                                                    FilterType="Custom,Numbers" ValidChars="." 
                                                    runat="server" Enabled="True" />

                                            </div>
                                            <label>
                                                <asp:Label ID="Label13" runat="server" Text="Provision Coverage %" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <asp:Label ID="lblFAMapSlNo" runat="server" Visible="false"></asp:Label>

                                </div>

                                <div align="right">
                                    <button class="css_btn_enabled" id="btnFAMapAdd" title="Add" onclick="if(fnConfirmAdd('AddFAMapDetails'))" causesvalidation="false" onserverclick="btnFAMapAdd_ServerClick" runat="server"
                                        type="button">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;Add
                                    </button>
                                    <button class="css_btn_enabled" id="btnFAMapModify" title="Edit" onclick="if(fnCheckPageValidators('Edit'))" causesvalidation="false" onserverclick="btnFAMapModify_ServerClick" runat="server"
                                        type="button">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Modify
                                    </button>
                                    <button class="css_btn_enabled" id="btnFAMapClear" title="Clear" causesvalidation="false" onserverclick="btnFAMapClear_ServerClick" runat="server"
                                        type="button">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clear
                                    </button>
                                </div>

                                <div class="row">
                                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvFAMapping" runat="server" AutoGenerateColumns="false" OnRowDeleting="grvFAMapping_RowDeleting" OnRowDataBound="grvFAMapping_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:RadioButton ID="rdbtnFAMapSelect" runat="server" Checked="false" OnCheckedChanged="rdbtnFAMapSelect_CheckedChanged"
                                                                AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sl No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvFAMapSlNo" runat="server" Text='<%#Eval("SlNo") %> '></asp:Label>
                                                            <asp:Label ID="lblgvFAMap_Detail_ID" runat="server" Text='<%#Eval("FAMap_Detail_ID") %> ' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                   
                                                     <asp:TemplateField HeaderText="GL Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvGLCode" runat="server" Text='<%#Eval("GL_Code") %> '></asp:Label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                    <asp:BoundField HeaderText="GL Desc" DataField="GL_Desc" />

                                                    <asp:BoundField HeaderText="Provision Coverage" DataField="Provision_Coverage" />


                                                    
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnFAMapDelete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete" CssClass="grid_btn_delete"></asp:Button>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10px" />
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
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click"
                            runat="server" type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnclear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnclear_Click"
                            runat="server" type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btncancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btncancel_Click"
                            runat="server" type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                    <div>

                        <asp:ValidationSummary ID="vsSave" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="Save" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="VSbtnAdd" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="btnDetailsAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />

                        <asp:ValidationSummary ID="vsAddFAMapDetails" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="AddFAMapDetails" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                    </div>



                </div>
            </div>
        </ContentTemplate>
        
    </asp:UpdatePanel>



    <script type="text/javascript">
        function fnConfirmSave() {
            if (confirm('Do you sure want to save?')) {
                return true;
            }
            else {
                return false;
            }
        }

      
        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }
        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }
    </script>
</asp:Content>

