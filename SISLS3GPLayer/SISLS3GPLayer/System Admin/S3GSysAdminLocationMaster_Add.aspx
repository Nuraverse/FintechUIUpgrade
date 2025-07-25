<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminLocationMaster_Add.aspx.cs" Inherits="System_Admin_S3GSysAdminLocationMaster_Add"
    Title="S3G - Location Master" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
        function fnConfirmSave() {

            if (confirm('Do you want to Save?')) {
                return true;
            }
            else
                return false;

        }
    </script>

    <div id="tab-content" class="tab-content">
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="Location Master" ID="lblHeading"> </asp:Label>
                </h6>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div id="divpnlHierarchyType" runat="server">
                    <asp:Panel ID="pnlHierarchyType" runat="server" GroupingText="Hierarchy Type" CssClass="stylePanel"
                        Visible="false">

                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:RadioButtonList ID="rblHierarchy" runat="server" RepeatDirection="Horizontal"
                                        ValidationGroup="vgLocationGroup">
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="rfvHierarchy" runat="server" ValidationGroup="vgLocationGroup"
                                        Display="None" InitialValue="" ControlToValidate="rblHierarchy" ErrorMessage="Select the Hierarchy Type"></asp:RequiredFieldValidator>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <span class="styleReqFieldLabel">Hierarchy Type</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div id="divLocationCatDetails" runat="server">
                    <asp:Panel Visible="true" runat="server" ID="pnlLocationCatDetails" GroupingText="Branch Category Details"
                        CssClass="stylePanel">
                        <asp:UpdatePanel ID="upLocationdetails" runat="server">
                            <ContentTemplate>
                                <div class="row">

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divParent" runat="server">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlParent" runat="server" DataTextField="CurrenctMapping_Code"
                                                AutoPostBack="true" DataValueField="Mapping_Description" OnSelectedIndexChanged="ddlParent_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocationParent" ValidationGroup="vgLocationGroup" CssClass="validation_msg_box_sapn"
                                                    runat="server" ErrorMessage="Select the Previous Branch" SetFocusOnError="True"
                                                    ControlToValidate="ddlParent" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblParent" runat="server" Text="Previous Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                         <asp:Label ID="lblMappingCodeDescription" runat="server"></asp:Label>
                                    </div>
                                    <%--  <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none;">
                                    <div class="md-input">
                                        <asp:Label ID="lblLastCode" runat="server" Text="Last Generated Code" CssClass="styleInfoLabel"></asp:Label>
                                        <asp:Label ID="lblLastGenCode" runat="server" CssClass="styleInfoLabel"></asp:Label>
                                    </div>
                                </div>--%>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtLocationCode" runat="server" ValidationGroup="vgLocationGroup" class="md-form-control form-control login_form_content_input requires_true"
                                                MaxLength="3"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocationCode"
                                                    runat="server" ErrorMessage="Enter the Branch Code" SetFocusOnError="True" ValidationGroup="vgLocationGroup"
                                                    ControlToValidate="txtLocationCode" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <cc1:FilteredTextBoxExtender ID="ftexLocationCode" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                TargetControlID="txtLocationCode" runat="server" Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblLocationCode" runat="server" CssClass="styleReqFieldLabel" Text="Branch Code"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtLocationName" runat="server" ValidationGroup="vgLocationGroup"
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                onkeypress="return fnCheckSpecialChars(true);"
                                                onkeyup="fnAvoidFirstCharSpace(event.key,this)"
                                                MaxLength="50"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocationName" ValidationGroup="vgLocationGroup"
                                                    runat="server" ErrorMessage="Enter the Branch Name" SetFocusOnError="True"
                                                    ControlToValidate="txtLocationName" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:RegularExpressionValidator ID="revLocationName" runat="server" ValidationGroup="vgLocationGroup"
                                                ErrorMessage="Enter a valid Location Name" ControlToValidate="txtLocationName"
                                                ValidationExpression="^[a-zA-Z_0-9](\w|\W)*" Display="None"></asp:RegularExpressionValidator>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLocationDescription" runat="server" Text="Branch Description"
                                                    CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCBOBranchCode" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCBOBranchCode" runat="server" Text="CBO Branch Code" CssClass="styleDisplayFieldLabel"></asp:Label><br />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPrevCBOBranchCode" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPrevCBOBranchCode" runat="server" Text="Previous CBO Branch Code"></asp:Label><br />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="chkOperational" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:CheckBox ID="cbxOperationalLoc" runat="server" />
                                            <asp:Label runat="server" Text="Previous Branch" ID="lblOperationalLoc" CssClass="styleDisplayLabel"> </asp:Label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:CheckBox ID="cbxActive" runat="server" Checked="true" Enabled="false" AutoPostBack="true" OnCheckedChanged="cbxActive_CheckedChanged" />
                                            <span>Active </span>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEffectiveFromDate" runat="server" ValidationGroup="vgLocationGroup" ToolTip="Opening Date" OnTextChanged="txtEffectiveFromDate_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderEffectiveFromDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                TargetControlID="txtEffectiveFromDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="vgLocationGroup" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtEffectiveFromDate" SetFocusOnError="True" ErrorMessage="Enter a Opening Date"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEffectiveFrom" runat="server" CssClass="styleReqFieldLabel" Text="Opening Date" ToolTip="Opening Date" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEffectiveToDate" runat="server" ToolTip="Closing Date" ValidationGroup="vgLocationGroup" OnTextChanged="txtEffectiveToDate_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderEffectiveToDate" runat="server" Enabled="True"
                                                OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" TargetControlID="txtEffectiveToDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="rfvtxtEffectiveToDate" ValidationGroup="vgLocationGroup" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtEffectiveToDate" SetFocusOnError="True" ErrorMessage="Enter a Closing Date"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEffectiveTo" runat="server" CssClass="styleReqFieldLabel" Text="Closing Date" ToolTip="Closing Date" />
                                            </label>

                                        </div>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:Panel ID="pnlLOBDetails" GroupingText="Line Of Business Details" runat="server" CssClass="stylePanel">
                                                <asp:GridView runat="server" ID="grvLOB" Width="100%" HeaderStyle-CssClass="styleGridHeader"
                                                    OnRowDataBound="grvLOB_RowDataBound" AutoGenerateColumns="False" class="gird_details">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line of Business"
                                                            HeaderStyle-Width="70%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("LOB_Name")%>' Text='<%#Eval("LOB_Name")%>'></asp:Label>
                                                                <asp:Label ID="lblLOBID" runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                                <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-Width="30%">
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="chkSelectAllLOB" runat="server"></asp:CheckBox>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelectLOB" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <asp:Panel GroupingText="Communication Address" ID="pnlCommAddress" runat="server"
                                                CssClass="stylePanel">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <uc1:AddSetup ID="ucCommAddressSetup" runat="server" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div align="right">
                                        <%--      <asp:Button ID="btnCategoryGo" Text="Go" runat="server" ValidationGroup="vgLocationGroup" ToolTip="Go, Alt+G" AccessKey="G"
                                            CssClass="save_btn fa fa-floppy-o" OnClientClick="return fnCheckPageValidators('vgLocationGroup','f')"
                                            OnClick="btnCategoryGo_Click" />--%>

                                        <button class="css_btn_enabled" id="btnCategoryGo" onserverclick="btnCategoryGo_Click" runat="server"
                                            type="button" accesskey="G" causesvalidation="false" title="Go[Alt+G]" onclick="if(fnCheckPageValidators('vgLocationGroup','f'))">
                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                        </button>
                                    </div>
                                </div>

                                <div class="row" style="margin-top: 20px;">
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                        <cc1:TabContainer ID="tcLocCategory" runat="server" CssClass="styleTabPanel" ScrollBars="Auto"
                                            AutoPostBack="true" OnActiveTabChanged="tcLocCategory_ActiveTabChanged" Height="50px">
                                        </cc1:TabContainer>

                                    </div>
                                </div>

                                <%--<div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row" style="float: right; margin-top: 5px;">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnSaveLocCategory" Text="Save" runat="server" CssClass="save_btn fa fa-floppy-o" AccessKey="S" ToolTip="Save, Alt+S"
                                                OnClientClick="return fnCheckPageValidators('save');" OnClick="btnSaveLocationCategory_Click" ValidationGroup="save" />
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 20px;">
                                            <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnCancelLocCategory" Text="Exit" runat="server" CausesValidation="False" AccessKey="X" ToolTip="Exit, Alt+X"
                                                CssClass="save_btn fa fa-floppy-o" OnClick="btnCancelLocCategory_Click" OnClientClick="return fnConfirmExit();" />
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                                <div class="btn_height"></div>
                                <div align="right" class="fixed_btn">
                                    <%--<div align="right">--%>
                                    <button class="css_btn_enabled" id="btnSaveLocCategory" onserverclick="btnSaveLocationCategory_Click" runat="server"
                                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" onclick="if(fnConfirmSave())">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                    </button>

                                    <button class="css_btn_enabled" id="btnCancelLocCategory" onserverclick="btnCancelLocCategory_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                                        type="button" accesskey="X">
                                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                    </button>

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>

                </div>
            </div>
        </div>


        <div class="row" runat="server" id="divpnlLocationMapping" visible="false">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel runat="server" ID="pnlLocationMapping" GroupingText="Branch Mapping Details"
                    CssClass="stylePanel">
                    <asp:UpdatePanel ID="upLocationMapping" runat="server">
                        <ContentTemplate>
                            <div class="row">

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtLocationMappingCode" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:HiddenField ID="hdnMappingCode" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvLocationMappingCode" runat="server" ControlToValidate="txtLocationMappingCode"
                                            ErrorMessage="Select the Mapping" Display="None" ValidationGroup="btnMappingGo">
                                        </asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="rfvLocationMappingCodeSave" runat="server" ControlToValidate="txtLocationMappingCode"
                                            ErrorMessage="Select the Mapping" Display="None" ValidationGroup="btnSaveMappingGo">
                                        </asp:RequiredFieldValidator>
                                        <asp:Button ID="btnLocationMapping_Go" runat="server" Text="Go" OnClick="btnLocationMapping_Go_Click"
                                            ValidationGroup="btnMappingGo" CssClass="styleSubmitShortButton" Visible="false" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <span class="styleReqFieldLabel">Branch Mapping Code</span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMappingDescription" runat="server" TextMode="MultiLine"
                                            ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <span class="styleDisplayLabel">Branch Description</span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:CheckBox ID="cbxActiveMapping" runat="server" Checked="true" Enabled="false" />
                                        <span>Active </span>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:CheckBox ID="cbxOperationalLocM" runat="server" Enabled="false" />
                                        <span>Operational Location </span>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <cc1:TabContainer ID="tcLocationMapping" runat="server" CssClass="styleTabPanel"
                                        ScrollBars="Auto" Height="50px">
                                    </cc1:TabContainer>
                                </div>

                            </div>
                            <div class="row">
                                <asp:GridView ID="gvLocationMapping" runat="server" AutoGenerateColumns="false" EmptyDataText="No Record's Found...">
                                    <Columns>
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <%--  <div class="row" style="margin-top: 5px;">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row" style="float: right; margin-top: 5px;">
                                        <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnSaveLocationMapping" runat="server" Text="Save" CssClass="save_btn fa fa-floppy-o" ToolTip="Save, Alt+S" AccessKey="S"
                                                OnClick="btnSaveLocationMapping_Click" ValidationGroup="btnSaveMappingGo" />
                                        </div>
                                        <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                            <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnCancelMapping" OnClick="btnCancelLocCategory_Click" runat="server" ToolTip="Exit, Alt+X" AccessKey="X" OnClientClick="return fnConfirmExit();"
                                                Text="Exit" CssClass="save_btn fa fa-floppy-o" />
                                        </div>
                                    </div>
                                </div>
                            </div>--%>

                            <%--<div class="btn_height" align="right"></div>--%>
                            <%--<div align="right" class="fixed_btn">--%>
                            <div align="right">

                                <button class="css_btn_enabled" id="btnSaveLocationMapping" onserverclick="btnSaveLocationMapping_Click" runat="server" 
                                    type="button" accesskey="S" causesvalidation="true" title="Save[Alt+S]">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>

                                <button class="css_btn_enabled" id="btnCancelMapping" onserverclick="btnCancelLocCategory_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                                    type="button" accesskey="X">
                                    <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>

                            </div>

                            <%--   <div class="row" style="display: none;">
                                <asp:ValidationSummary ID="vsLocationMapping" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Please correct the following validation(s):" ValidationGroup="btnMappingGo" ShowMessageBox="false" ShowSummary="true" />
                                <asp:ValidationSummary ID="vsMappingSave" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Please correct the following validation(s):" ValidationGroup="btnSaveMappingGo" ShowMessageBox="false" ShowSummary="true" />
                            </div>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:HiddenField ID="hdnID" runat="server" />
                </asp:Panel>
            </div>
        </div>

        <%--  <div class="row" style="display: none;">
            <asp:ValidationSummary ID="vsLocationMaster" runat="server"
                ValidationGroup="save"
                HeaderText="Please correct the following validation(s):"
                ShowMessageBox="false" ShowSummary="true" />
            <asp:CustomValidator ID="cvLocationMaster" runat="server"></asp:CustomValidator>

            <asp:ValidationSummary ID="vsLocationGrouip" runat="server"
                ValidationGroup="vgLocationGroup"
                HeaderText="Please correct the following validation(s):"
                ShowMessageBox="false" ShowSummary="true" />

        </div>--%>
    </div>
</asp:Content>
