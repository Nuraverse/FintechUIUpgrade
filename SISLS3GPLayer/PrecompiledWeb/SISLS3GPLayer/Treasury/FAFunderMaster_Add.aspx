<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAFunderMaster_Add, App_Web_ezlcepmc" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <cc1:TabContainer ID="tcFunderMaster" runat="server" CssClass="styleTabPanel" Width="99%"
                        TabStripPlacement="top" ActiveTabIndex="0">
                        <cc1:TabPanel runat="server" HeaderText="Funder Details" ID="tbAddress" CssClass="tabpan"
                            BackColor="Red" TabIndex="0">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upAddress" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Funder Informations" ID="pnlFunderInfo" runat="server" CssClass="stylePanel">

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFunderName" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Funder Name');" onfocusOut="fnvalidFundername(this);"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtFunderName" ValidChars="-/()&&#8216;., " TargetControlID="txtFunderName"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvfFunderName" runat="server"
                                                                        ErrorMessage="Enter Funder Name" ControlToValidate="txtFunderName" CssClass="grid_validation_msg_box"
                                                                        Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFunderName" CssClass="styleReqFieldLabel" Text="Funder Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFundercode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <cc1:ComboBox ID="ddlGLCode" runat="server" Visible="false" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_OnSelectedIndexChanged"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvGLCode" runat="server" ControlToValidate="ddlGLCode"
                                                                        InitialValue="--Select--" ErrorMessage="Select Account" Display="None" SetFocusOnError="True"
                                                                        ValidationGroup="Main" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Visible="false" ID="lblGLCode" CssClass="styleReqFieldLabel" Text="Account"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>




                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <cc1:ComboBox ID="ddlSLCode" runat="server" Visible="false" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlSLCode_OnSelectedIndexChanged"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <asp:RequiredFieldValidator ID="rfvSLCode" runat="server" ControlToValidate="ddlSLCode"
                                                                    InitialValue="--Select--" ErrorMessage="Select Sub Account" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblSLCode" Visible="false" Text="Sub Account"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>



                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTAXNo" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'TAX Number');" ToolTip="TAX Number"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" ValidChars="-/, ." TargetControlID="txtTAXNo"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTAXNo" CssClass="styleReqFieldLabel" Text="TAX Number" />
                                                                </label>
                                                            </div>
                                                        </div>



                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtVATNo" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'VAT Number');" ToolTip="VAT Number"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" ValidChars="-/, ." TargetControlID="txtVATNo"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblVATNo" CssClass="styleReqFieldLabel" Text="VAT Number" />
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="Simple"
                                                                    AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblLocation" Text="Branch" />
                                                                </label>
                                                            </div>
                                                        </div>






                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRemarks" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Remarks');" onkeyup="maxlengthfortxt(100);" TextMode="MultiLine"
                                                                    ToolTip="Remarks" class="md-form-control form-control login_form_content_input requires_true" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblRemarks" Text="Remarks" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkActive" runat="server" ToolTip="Active" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                                <asp:Label runat="server" ID="lblActive" Text="Active" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

                                                        <asp:Panel GroupingText="Communication Address" ID="pnlCommAddress" runat="server"
                                                            CssClass="stylePanel">
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtComAddress1" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Address1 in Communication Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvComAddress1" runat="server" ControlToValidate="txtComAddress1"
                                                                                ErrorMessage="Enter Address1 in Communication Address" Display="Dynamic" SetFocusOnError="True"
                                                                                ValidationGroup="Main" CssClass="grid_validation_msg_box" />
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblComAddress1" runat="server" CssClass="styleReqFieldLabel" Text="Address1"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCOmAddress2" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Address2 in Communication Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblComAddress2" runat="server" CssClass="styleDisplayLabel" Text="Address2"></asp:Label>
                                                                        </label>
                                                                        <%-- <asp:TextBox ID="txtCOmAddress2" runat="server" MaxLength="60" TextMode="MultiLine"
                                                                    Columns="30" onkeyup="maxlengthfortxt(64)"></asp:TextBox>--%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="txtComCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                            onblur="FunTrimwhitespace(this,'City in Communication Address');" AppendDataBoundItems="true"
                                                                            CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvComCity" runat="server" ControlToValidate="txtComCity"
                                                                                CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Main"
                                                                                ErrorMessage="Enter City in Communication Address" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblComcity" runat="server" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>




                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="txtComState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                            onblur="FunTrimwhitespace(this,'State in Communication Address');" AppendDataBoundItems="true"
                                                                            CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                        </cc1:ComboBox>

                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvComState" runat="server" ControlToValidate="txtComState"
                                                                                InitialValue="0" CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True"
                                                                                ErrorMessage="Enter State in Communication Address" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="txtComCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="Simple"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                        </cc1:ComboBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblComCountry" runat="server" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtComPincode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Pincode/Zipcode in Communication Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtComPincode" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtComPincode" ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvComCountry" runat="server" ControlToValidate="txtComCountry"
                                                                                InitialValue="0" CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True"
                                                                                ErrorMessage="Enter Country in Communication Address" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCompincode" runat="server" CssClass="styleReqFieldLabel" Text="Pin"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtComTelephone" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Telephone in Communication Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtComTelephone" runat="server" Enabled="True"
                                                                            FilterType="Numbers" TargetControlID="txtComTelephone">
                                                                        </cc1:FilteredTextBoxExtender>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblComTelephone" runat="server" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtComMobile" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtComMobile" runat="server" Enabled="True" FilterType="Numbers"
                                                                            TargetControlID="txtComMobile" ValidChars=" -">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblComMobile" runat="server" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtComEmail" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'e-Mail Id in Communication Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtComEmail"
                                                                            ErrorMessage=" Enter valid e-Mail Id in Communication Address" CssClass="styleMandatoryLabel"
                                                                            Display="None" SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"
                                                                            ValidationGroup="Main"></asp:RegularExpressionValidator>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblComEmail" runat="server" CssClass="styleDisplayLabel" Text="e-Mail Id"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtComWebsite" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Web Site in Communication Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="revComWebsite" runat="server" ControlToValidate="txtComWebsite"
                                                                            ErrorMessage=" Enter valid website in Communication Address (like www.s3g.com)"
                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                                                            ValidationGroup="Main"></asp:RegularExpressionValidator>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblComWebSite" runat="server" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>



                                                            </table>
                                                        </asp:Panel>
                                                    </div>
                                                   
                                                  <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Permanent Address" ID="pnlPermenantAddress" runat="server"
                                                            CssClass="stylePanel">

                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPerAddress1" runat="server" MaxLength="60" Width="95%" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Address1 in Permanent Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvtxtPerAddress1" runat="server"
                                                                                ErrorMessage="Enter Address1 in Permanent Address" ControlToValidate="txtPerAddress1"
                                                                                CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPerAddress1" CssClass="styleReqFieldLabel" Text="Address1"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPerAddress2" runat="server" Columns="30" MaxLength="60" Width="95%"
                                                                            onmouseover="txt_MouseoverTooltip(this)" onblur="FunTrimwhitespace(this,'Address2 in Permanent Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPerAddress2" CssClass="styleDisplayLabel" Text="Address2"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="txtPerCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerCity" runat="server"
                                                                                ErrorMessage="Enter City in Permanent Address" ControlToValidate="txtPerCity"
                                                                                CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblPerCity" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="txtPerState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerState" runat="server"
                                                                                ErrorMessage="Enter State in Permanent Address" ControlToValidate="txtPerState"
                                                                                CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblPerState" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="txtPerCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerCountry" runat="server"
                                                                                ErrorMessage="Enter Country in Permanent Address" ControlToValidate="txtPerCountry"
                                                                                CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblPerCountry" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPerPincode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtPerPincode" runat="server" ValidChars=" " FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            Enabled="True" TargetControlID="txtPerPincode">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPerpincode" CssClass="styleReqFieldLabel" Text="Pin"
                                                                                onblur="FunTrimwhitespace(this,'Pincode/Zipcode in Permanent Address');"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPerTelephone" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Telephone in Permanent Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtPerTelephone" runat="server" FilterType="Numbers"
                                                                            Enabled="True" TargetControlID="txtPerTelephone">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPerTelephone" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPerMobile" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtPerMobile" runat="server" ValidChars=" -" FilterType="Numbers"
                                                                            Enabled="True" TargetControlID="txtPerMobile">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPerMobile" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPerEmail" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'e-Mail Id in Permanent Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ValidationGroup="Main" ID="revPerEmail" ErrorMessage=" Enter valid e-Mail Id in Permanent Address"
                                                                            runat="server" ControlToValidate="txtPerEmail" Display="None" CssClass="styleMandatoryLabel"
                                                                            SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"></asp:RegularExpressionValidator>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPerEmail" CssClass="styleDisplayLabel" Text="e-Mail Id"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPerWebSite" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onblur="FunTrimwhitespace(this,'Web Site in Permanent Address');"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ValidationGroup="Main" ID="revPerWebSite" runat="server"
                                                                            ErrorMessage=" Enter valid website in Permanent Address (like www.s3g.com)" ControlToValidate="txtPerWebSite"
                                                                            Display="None" CssClass="styleMandatoryLabel" SetFocusOnError="True" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPerWebSite" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                            </table>
                                                        </asp:Panel>
                                                    </div>


                                                </div>
                                                  <div>
                                                     <asp:Button ID="btnCopyAddress" runat="server" Text=">>" ToolTip="Copy Address" OnClick="btnCopyAddress_Click" />
                                                  </div>
                                            </div>
                                        </div>


                                         
                                       
                                       

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Conditions" ID="tpConditions" CssClass="tabpan"
                            BackColor="Red" Enabled="false">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upConditions" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Conditional Details" ID="Panel1" runat="server" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvConditions" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                                    OnRowDataBound="gvConditions_RowDataBound" OnRowCommand="gvConditions_RowCommand"
                                                                    OnRowDeleting="gvConditions_RowDeleting" OnRowEditing="gvConditions_RowEditing"
                                                                    OnRowCancelingEdit="gvConditions_RowCancelingEdit" OnRowUpdating="gvConditions_RowUpdating">
                                                                    <Columns>
                                                                        <%--Serial Number--%>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle />
                                                                        </asp:TemplateField>
                                                                        <%--Line of Business --%>
                                                                        <asp:TemplateField HeaderText="Line of Business">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLOB" runat="server" Text='<%#Eval("LOB") %>' ToolTip="Line of Business" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FunProGet_S3G_Credit_Exposure"
                                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                            InitialValue="0" ErrorMessage="Select Line of Business" Display="Dynamic" SetFocusOnError="True"
                                                                                            ValidationGroup="vgAdd" CssClass="grid_validation_msg_box" />
                                                                                    </div>
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <center>
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_OnSelectedIndexChanged"
                                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                                InitialValue="0" ErrorMessage="Select Line of Business" Display="Dynamic" SetFocusOnError="True"
                                                                                                ValidationGroup="vgAdd" CssClass="grid_validation_msg_box" />
                                                                                        </div>
                                                                                    </div>

                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="13%" />
                                                                            <FooterStyle Width="13%" />
                                                                        </asp:TemplateField>
                                                                        <%--Asset --%>
                                                                        <asp:TemplateField HeaderText="Asset Category">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAsset" runat="server" Text='<%#Eval("AssetCat") %>' ToolTip="Asset Category" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlAssetCategory" AutoPostBack="true" runat="server"
                                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <center>
                                                                                    <div class="md-input">

                                                                                        <asp:DropDownList ID="ddlAssetCategory" runat="server" AutoPostBack="true"
                                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="13%" />
                                                                            <FooterStyle Width="13%" />
                                                                        </asp:TemplateField>
                                                                        <%--Asset Class--%>
                                                                        <asp:TemplateField HeaderText="Asset Class">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetClass" runat="server" Text='<%#Eval("AssetClass") %>' ToolTip="Asset Class" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlAssetClass" runat="server"
                                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <center>
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlAssetClass" runat="server"
                                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="13%" />
                                                                            <FooterStyle Width="13%" />
                                                                        </asp:TemplateField>
                                                                        <%--Category--%>
                                                                        <asp:TemplateField HeaderText="Bucket Category">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("BucketCat") %>' ToolTip="Category" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList AutoPostBack="true" ID="ddlBucketCategory" runat="server"
                                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <center>
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlBucketCategory" AutoPostBack="true" runat="server"
                                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="13%" />
                                                                            <FooterStyle Width="13%" />
                                                                        </asp:TemplateField>
                                                                        <%--Bucket--%>
                                                                        <asp:TemplateField HeaderText="Bucket Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBucket" runat="server" Text='<%#Eval("BucketVal") %>' ToolTip="Bucket" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlBucket" AutoPostBack="true" runat="server"
                                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <center>
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlBucket" AutoPostBack="true" runat="server"
                                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="13%" />
                                                                            <FooterStyle Width="13%" />
                                                                        </asp:TemplateField>
                                                                        <%--Credit Score --%>
                                                                        <asp:TemplateField HeaderText="Collateral">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExpVar" runat="server" Text='<%#Eval("ExpVar") %>' ToolTip="Exposure Variance" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:Label ID="lblExpVar" runat="server" Text='<%#Eval("ExpVar") %>' ToolTip="Exposure Variance" />
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblftExpVar" runat="server" Text='<%#Eval("ExpVar") %>' />
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                                            <FooterStyle Width="10%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Credit Score">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCreditScore" runat="server" Text='<%#Eval("CreditScore") %>' ToolTip="Credit Score" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:Label ID="lblCreditScore" runat="server" Text='<%#Eval("CreditScore") %>' ToolTip="Credit Score" />
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblftCreditScore" runat="server" Text='<%#Eval("CreditScore") %>' />
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                                            <FooterStyle Width="10%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <%--Exposure Variance --%>
                                                                        <%--Add Edit Update Cancel Delete--%>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <%-- &nbsp;
                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                            CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                        &nbsp;--%>
                                                                                <asp:LinkButton ID="lnkRemove" runat="server" Text="Remove" CommandName="Delete"
                                                                                    OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                    ValidationGroup="vgAdd" CausesValidation="false"></asp:LinkButton>
                                                                                &nbsp; &nbsp;
                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                            CausesValidation="false"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgAdd"
                                                                                    CausesValidation="true" ToolTip="Add,Alt+T" AccessKey="T"></asp:LinkButton>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="10%" Font-Bold="true" HorizontalAlign="Center" />
                                                                            <FooterStyle Width="10%" Font-Bold="true" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>

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
                        <cc1:TabPanel runat="server" HeaderText="Bank Details" ID="tpBank" CssClass="tabpan"
                            BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upBank" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlBankdetails" runat="server" Width="100%" GroupingText="Bank Details"
                                                    CssClass="stylePanel">
                                                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal" CssClass="stylePanel">

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvBankDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                        EmptyDataText="No Bank Details Found!..." Width="100%" ShowFooter="true" OnRowCommand="grvBankDetails_RowCommand"
                                                                        OnRowDataBound="grvBankDetails_RowDataBound" OnRowDeleting="grvBankDetails_RowDeleting">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Bank Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblBankName" runat="server" Text='<%# Eval("Bank_Name")%>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <center>
                                                                                        <div class="md-input">
                                                                                            <asp:TextBox ID="txtBankName" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                onblur="FunTrimwhitespace(this,'Bank Name');" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtBankName" CssClass="grid_validation_msg_box"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtBankName"
                                                                                                    ErrorMessage="Enter Bank Name"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtBankName" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                                TargetControlID="txtBankName" runat="server" ValidChars=" " Enabled="True">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                        </div>
                                                                                    </center>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" Width="18%" />
                                                                                <FooterStyle Width="18%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Bank Address">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblBankAddress" runat="server" Text='<%# Eval("Bank_Address")%>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <center>
                                                                                        <div class="md-input">
                                                                                            <asp:TextBox ID="txtBankAddress" runat="server" TextMode="MultiLine"
                                                                                                onmouseover="txt_MouseoverTooltip(this)" onkeyup="maxlengthfortxt(50)" onblur="FunTrimwhitespace(this,'Bank Address');"
                                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtBankAddress" CssClass="grid_validation_msg_box"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtBankAddress"
                                                                                                    ErrorMessage="Enter Bank Address"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </center>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                                <FooterStyle Width="20%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="IFS Code">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblIFSCCode" runat="server" Text='<%# Eval("IFSC")%>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <center>
                                                                                        <div class="md-input">
                                                                                            <asp:TextBox ID="txtIFSCCode" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                runat="server" onblur="FunTrimwhitespace(this,'IFS Code');"
                                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtIFSCCodeF" CssClass="grid_validation_msg_box"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtIFSCCode"
                                                                                                    ErrorMessage="Enter IFSC Code"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </center>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" Width="12%" />
                                                                                <FooterStyle Width="12%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Bank A/C Type">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAccountTypeID" Visible="false" runat="server" Text='<%# Eval("Bank_Acct_Type")%>' />
                                                                                    <asp:Label ID="lblAccountType" runat="server" Text='<%# Eval("Bank_Acct_Type_Desc")%>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <center>
                                                                                        <div class="md-input">
                                                                                            <asp:DropDownList ID="ddlAccountType" AutoPostBack="true" runat="server"
                                                                                                CssClass="md-form-control form-control login_form_content_input" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlAccountTypeF" CssClass="grid_validation_msg_box"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="ddlAccountType"
                                                                                                    ErrorMessage="Select Account Type" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </center>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                                <FooterStyle Width="15%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Bank A/C Number">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAccountNumber" runat="server" Text='<%# Eval("Bank_Acct_No")%>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <center>
                                                                                        <div class="md-input">
                                                                                            <asp:TextBox ID="txtAccountNumber" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                runat="server" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtAccountNumberF" CssClass="styleMandatoryLabel"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtAccountNumber"
                                                                                                    ErrorMessage="Enter Account Number"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtAccountNumberF" FilterType=" Numbers, UppercaseLetters, LowercaseLetters"
                                                                                                TargetControlID="txtAccountNumber" runat="server" Enabled="True">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                        </div>
                                                                                    </center>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" Width="13%" />
                                                                                <FooterStyle Width="13%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Default Account">
                                                                                <ItemTemplate>
                                                                                    <center>
                                                                                        <%--Modified By Chandrasekar K On 08-Oct-2012--%>
                                                                                        <%--<asp:CheckBox ID="chkDefAcc" runat="server" AutoPostBack="true" OnCheckedChanged="FunPriSetDefault_BankAccount"
                                                                    Checked='<%# Eval("Def_Account") %>' />--%>
                                                                                        <asp:CheckBox ID="chkDefAcc" runat="server" AutoPostBack="true" OnCheckedChanged="FunPriSetDefault_BankAccount"
                                                                                            Checked='<%#DataBinder.Eval(Container.DataItem, "Def_Account").ToString().ToUpper() == "TRUE"%>' />
                                                                                    </center>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <center>
                                                                                        <asp:CheckBox ID="chkDefAcc" runat="server" Enabled="false" AutoPostBack="true" OnCheckedChanged="FunPriSetDefault_BankAccount" />
                                                                                    </center>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                                                <FooterStyle Width="6%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                      <button class="grid_btn" id="btnAdd" validationgroup="BVgAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="btnAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                                   
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                                <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Borrower Repayment schedule Details" ID="tpRepay"
                            CssClass="tabpan" BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upRepay" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Repay Details" ID="pnlRepay" runat="server" CssClass="stylePanel"
                                                    Width="80%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvRepayDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                                                                    ShowFooter="true">
                                                                    <Columns>
                                                                        <%--Serial Number--%>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="3%" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="Funder Reference Number" DataField="Fund_Ref_No" ItemStyle-Width="20%" />
                                                                        <asp:TemplateField HeaderText="Repay Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRepayDate" runat="server" Text='<%#Eval("Repay_Date") %>' ToolTip="Repay Date" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="15%" />
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTotal" runat="server" Text="Total " ToolTip="Total" />
                                                                            </FooterTemplate>
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <%--   <asp:BoundField HeaderText="Repayment Date" DataField="Repay_Date" ItemStyle-Width="20%" />--%>
                                                                        <asp:TemplateField HeaderText="Repay Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRepay" runat="server" Text='<%#Eval("Repay_Amount") %>' ToolTip="Repay Amount" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblRepayF" runat="server" Text='<%#Eval("TotRepay") %>' ToolTip="Total Repay Amount" />
                                                                            </FooterTemplate>
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <%--  <asp:BoundField HeaderText="Repay Amount" DataField="Repay_Amount" ItemStyle-Width="15%" />--%>
                                                                        <asp:BoundField HeaderText="JV Reference Number" DataField="JV_No" ItemStyle-Width="20%" />
                                                                    </Columns>
                                                                </asp:GridView>
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
                        <cc1:TabPanel runat="server" HeaderText="Accounts Allocation Details" ID="tpAllocation"
                            CssClass="tabpan" BackColor="Red" Enabled="false">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upAllocation" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Accounts Allocation Details" ID="pnlAllocation" runat="server"
                                                    CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvAllocation" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAllocation_RowDataBound"
                                                                    ShowFooter="true">
                                                                    <Columns>
                                                                        <%--Serial Number--%>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Line of Business">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLOB" runat="server" Text='<%#Eval("LOBName") %>' ToolTip="Line of Business" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Customer Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Customer_Name") %>' ToolTip="Customer Name" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Number">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPANum" runat="server" Text='<%#Eval("PANum") %>' ToolTip="Account Number" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="11%" HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sub Account Number">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSANum" runat="server" Text='<%#Eval("SANum") %>' ToolTip="Sub Account Number" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTot" runat="server" Text="Total" ToolTip="Total" />
                                                                            </FooterTemplate>
                                                                            <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                                            <ItemStyle Width="11%" HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Gross Exposure">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblGross" runat="server" Text='<%#Eval("Gross_Exposure") %>' ToolTip="Gross Exposure" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTotGross" runat="server" Text="" ToolTip="Total Gross Exposure" />
                                                                            </FooterTemplate>
                                                                            <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Net Exposure">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNet" runat="server" Text='<%#Eval("Net_Exposure") %>' ToolTip="Net Exposure" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTotNet" runat="server" Text="" ToolTip="Total Net Exposure" />
                                                                            </FooterTemplate>
                                                                            <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Dues">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDue" runat="server" Text='<%#Eval("Dues") %>' ToolTip="Due" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTotDue" runat="server" Text="" ToolTip="Total Dues" />
                                                                            </FooterTemplate>
                                                                            <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="No of Dues">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNOD" runat="server" Text='<%#Eval("NoofDues") %>' ToolTip="No of Dues" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTotNOD" runat="server" Text="" ToolTip="Total No of Dues" />
                                                                            </FooterTemplate>
                                                                            <FooterStyle Width="8%" HorizontalAlign="Center" />
                                                                            <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Maturity Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMaturityDate" runat="server" Text='<%#Eval("Maturity_Date") %>'
                                                                                    ToolTip="Maturity Date" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="11%" HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <%--<asp:BoundField HeaderText="Line of Business" DataField="LOBName" ItemStyle-Width="13%" />
                                                <asp:BoundField HeaderText="Customer Name" DataField="Customer_Name" ItemStyle-Width="13%" />
                                                <asp:BoundField HeaderText="Account Number" DataField="PANum" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Sub Account Number" DataField="SANum" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Gross Exposure" DataField="Gross_Exposure" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Net Exposure" DataField="Net_Exposure" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Due" DataField="Dues" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="No of Dues" DataField="NoofDues" ItemStyle-Width="8%" />
                                                <asp:BoundField HeaderText="Maturity Date" DataField="Maturity_Date" ItemStyle-Width="13%" />
                                                                        --%>
                                                                    </Columns>
                                                                </asp:GridView>
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
                        <cc1:TabPanel runat="server" ID="TabAccountMap" CssClass="tabpan" BackColor="Red"
                            Width="65%">
                            <HeaderTemplate>
                                Account Map
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                                       <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                    <asp:GridView ID="grvAcctMapDtls" runat="server" Width="98%" AutoGenerateColumns="false"
                                                        ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvAcctMapDtls_RowCommand"
                                                        OnRowDataBound="grvAcctMapDtls_RowDataBound" OnRowDeleting="grvAcctMapDtls_RowDeleting">
                                                        <Columns>
                                                            <%--Fund Type--%>
                                                            <asp:TemplateField HeaderText="Fund Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblfundtypehdn" runat="server" Text='<%#Bind("Fund_Type") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblFund_Type" runat="server" Text='<%#Eval("Fund_Type") %>' ToolTip="Fund Type" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <%--<asp:TextBox ID="txtFund_Type" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" ToolTip="Fund Type" />--%>
                                                                    <div class="md-input">
                                                                    <asp:DropDownList ID="ddlFundType" OnSelectedIndexChanged="ddlFund_Type_OnSelectedIndexChanged" AutoPostBack="true" runat="server"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                          <span class="bar"></span>
                                                                        <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFund_Type" CssClass="grid_validation_msg_box"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="AccVgAdd" ControlToValidate="ddlFundType"
                                                                        ErrorMessage="Select Fund Type"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--Fund Type--%>
                                                            <asp:TemplateField HeaderText="Fund Type Id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFund_Type_Id" runat="server" Text='<%#Eval("Fund_Type_Id") %>'
                                                                        ToolTip="Fund Type Id" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--Account--%>
                                                            <asp:TemplateField HeaderText="Account">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGL_Account" runat="server" Text='<%#Eval("GL_Account") %>' ToolTip="CashFlow" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <%-- <asp:TextBox ID="txtGL_Account" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" ToolTip="Account" />--%>
                                                                    <div class="md-input">
                                                                    <asp:DropDownList ID="ddlGL_Account" AutoPostBack="true" OnSelectedIndexChanged="ddlGL_Account_SelectedIndexChanged"
                                                                        runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                          <span class="bar"></span>
                                                                    <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlGL_Account" CssClass="grid_validation_msg_box"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="AccVgAdd" ControlToValidate="ddlGL_Account"
                                                                        ErrorMessage="Select GL Account"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--Account Code--%>
                                                            <asp:TemplateField HeaderText="GL Code" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGL_Code" runat="server" Text='<%#Eval("GL_Code") %>' ToolTip="CashFlow" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--Sub Account--%>
                                                            <asp:TemplateField HeaderText="Sub Account">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSL_Account" runat="server" Style="text-align: right;" Text='<%#Eval("SL_Account") %>'
                                                                        ToolTip="Frequency" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <%-- <asp:TextBox ID="txtSL_Account" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" ToolTip="Sub Account" Style="text-align: right;" />--%>
                                                                    <div class="md-input">
                                                                    <asp:DropDownList ID="ddlSL_Account" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                          <span class="bar"></span>
                                                                        </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--Amount--%>
                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFund_Amt" runat="server" Style="text-align: right;" Text='<%#Eval("Fund_Amt") %>'
                                                                        ToolTip="Amount" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                    <asp:TextBox ID="txtFund_Amt"  onmouseover="txt_MouseoverTooltip(this)"
                                                                        runat="server" ToolTip="Amount" Style="text-align: right;" 
                                                                       class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                          <span class="bar"></span>
                                                                    <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtFund_Amt" CssClass="grid_validation_msg_box"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="AccVgAdd" ControlToValidate="txtFund_Amt"
                                                                        ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtFund_Amt" runat="server" TargetControlID="txtFund_Amt"
                                                                        ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                        </div>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="3%" />
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Maturity Date" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMaturityDate" runat="server" Style="text-align: Center;" Text='<%#Eval("Maturity_Date") %>'
                                                                        ToolTip="Maturity Date" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                    <asp:TextBox ID="txtMaturityDate" runat="server" ToolTip="Maturity Date" Style="text-align: Center;"
                                                                         class="md-form-control form-control login_form_content_input requires_true"/>
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtMaturityDate"
                                                                        ID="CaetMaturityDate">
                                                                    </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                          <span class="bar"></span>
                                                                        </div>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="3%" />
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Fund Type Bank AC Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccNum" runat="server" Text='<%# Eval("Bnk_Acc_No")%>' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <center>
                                                                        <div class="md-input">
                                                                        <asp:TextBox ID="txtAccNum"  onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"/>
                                                                            <span class="highlight"></span>
                                                                          <span class="bar"></span>
                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAccNumF" FilterType=" Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtAccNum" runat="server" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </center>
                                                                    
                                                                    <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtAccNum" CssClass="grid_validation_msg_box"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="AccVgAdd" ControlToValidate="txtAccNum"
                                                                        ErrorMessage="Enter Fund Type Bank AC Number"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Left" Width="13%" />
                                                                <FooterStyle Width="13%" />
                                                            </asp:TemplateField>
                                                            <%--Sub Account Code--%>
                                                            <asp:TemplateField HeaderText="SL Code" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSL_Code" runat="server" Text='<%#Eval("SL_Code") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%-- Action --%>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                        CausesValidation="false" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <button class="grid_btn" id="btnAddrow" validationgroup="AccVgAdd" title=",Alt+D" accesskey="D" runat="server" onserverclick="btnAddrow_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                    
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" />
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                                            </div>
                                                           </div>
                                                          <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Interest Details">
                                                        
                                                             <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                             <asp:DropDownList ID="ddlBaseRate" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                 class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvbaserate" runat="server" Display="Dynamic" ControlToValidate="ddlBaseRate"
                                                                        ValidationGroup="Main" InitialValue="0" ErrorMessage="Select Base Rate"
                                                                        CssClass="grid_validation_msg_box" Enabled="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblBaseRate" ToolTip="Base Rate" runat="server" Text="Base Rate" CssClass="styleReqFieldLabel" />
                                                                
                                                                    </label>
                                                                </div>
                                                            </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtbaserateTrn" ToolTip="Base Rate%" runat="server" Style="text-align: right"
                                                                       class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                     <span class="bar"></span>
                                                                    <label>
                                                                    <asp:Label ID="lblbaserateTrn" ToolTip="Base Rate %" runat="server" Text="Base Rate %"
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
                        <cc1:TabPanel runat="server" ID="tbContactPerson" CssClass="tabpan" BackColor="Red" Width="65%">
                            <HeaderTemplate>
                                Contact Person Details
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="updContactPersondetails" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel GroupingText="Contact Person Details" ID="pnlContactPersonDetails" Width="60%" runat="server"
                                            CssClass="stylePanel">
                                            <div class="row">
                                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                            <asp:GridView ID="gvContactPersonDetails" Width="100%" runat="server" OnRowDeleting="gvContactPersonDetails_RowDeleting" OnRowCommand="gvContactPersonDetails_RowCommand" AutoGenerateColumns="false"
                                                ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl No" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                        </ItemTemplate>
                                                        <%-- <ItemStyle Width="2%" HorizontalAlign="Left" />--%>
                                                        <%-- <FooterStyle Width="10%" HorizontalAlign="Left" />--%>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contact Person Name" ItemStyle-Width="18%" FooterStyle-Width="18%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblContactPersonName" runat="server" Text='<%#Eval("ContactPersionName") %>' ToolTip="Contact Person Name" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input">
                                                           <asp:TextBox ID="txtContactPersonName" runat="server"
                                                               class="md-form-control form-control login_form_content_input requires_true" ></asp:TextBox>
                                                            <span class="highlight"></span>
                                                             <span class="bar"></span>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Designation" ItemStyle-Width="18%" FooterStyle-Width="18%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDesignation" runat="server" Text='<%#Eval("Designation") %>' ToolTip="Contact Person Designation" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                             <div class="md-input">
                                                            <asp:TextBox ID="txtContactPersonDesignation" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                 <span class="highlight"></span>
                                                             <span class="bar"></span>
                                                                 </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                CausesValidation="false" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <button class="grid_btn" id="btnAddrow" validationgroup="AccVgAdd" title=",Alt+U" accesskey="U" runat="server" onserverclick="btnAddrow_ServerClick1"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                            <%--<asp:Button ID="btnAddrow" CausesValidation="True" runat="server" CommandName="Add"
                                                                CssClass="styleGridShortButton" Text="Add" ToolTip="Add,Alt+U" AccessKey="U"></asp:Button>--%>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="1%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
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
                    </cc1:TabContainer>
                </div>
            </div>
        </div>
    </div>

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
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>

    <tr>
        <td>
            <br />
            <asp:ValidationSummary ID="vsFunderMaster" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
            <asp:ValidationSummary ID="vsAdd" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                ValidationGroup="vgAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
            <asp:ValidationSummary ID="vsAddAcc" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                ValidationGroup="AccVgAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
            <asp:CustomValidator ID="cvFunderMaster" runat="server" CssClass="styleMandatoryLabel"
                Enabled="true" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                CssClass="styleMandatoryLabel" ValidationGroup="BVgAdd" ShowMessageBox="false"
                HeaderText="Correct the following validation(s):" />
        </td>
    </tr>
    </table>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
    <asp:HiddenField ID="hdn_DefAcc" runat="server" />
    <%--    <script src="../Scripts/Common.js" language="javascript" type="text/javascript"></script>
    --%>

    <script language="javascript" type="text/javascript">
        //            var querymode;
        //            querymode=location.search.split("qsMode=");
        //            querymode=querymode[1];

        //            var tab ;


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



    </script>
</asp:Content>
