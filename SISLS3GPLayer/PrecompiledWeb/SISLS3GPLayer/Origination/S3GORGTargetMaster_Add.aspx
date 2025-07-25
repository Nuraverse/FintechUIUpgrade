<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GORGTargetMaster_Add, App_Web_54a2gfky" title="Target Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
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
            Dropdown = document.getElementById('<%=ddlfreqtyp.ClientID %>')
            if (confirm('Do you want to Reset values in Grid?')) {
                document.getElementById('<%=btnFreqChange.ClientID%>').click();
                return true;
            }
            else {
                Dropdown.value = Prevval;
                return false;
            }

        }



    </script>
<div class="tab-pane fade in active show" id="tab1">
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:UpdatePanel ID="upnlRegion" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true"
                    RenderMode="Block">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="TrgmstrInfo1" runat="server" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                    class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                        Display="Dynamic" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Submit"
                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" ErrorMessage="Select a Location"
                                                    ValidationGroup="Submit" IsMandatory="true" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlMxectyp" AutoPostBack="True" runat="server"
                                                    OnSelectedIndexChanged="ddlMxectyp_SelectedIndexChanged"
                                                    class="md-form-control form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">Sales Executive</asp:ListItem>
                                                    <asp:ListItem Value="2">Third Party</asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvMxectyp" runat="server" ControlToValidate="ddlMxectyp"
                                                        Display="Dynamic" ErrorMessage="Select a Marketing Executive Type" InitialValue="0"
                                                        ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblMxectyp" runat="server" CssClass="styleReqFieldLabel" Text="Marketing Exe,Type"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <uc2:Suggest ID="ddlMxecnm" runat="server" ServiceMethod="GetUserList"
                                                    ValidationGroup="Submit" IsMandatory="true" AutoPostBack="true" OnSelectedIndexChanged="ddlMxecnm_SelectedIndexChanged"
                                                    ErrorMessage="Select a Marketing Executive Name" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblMxecnm" runat="server" CssClass="styleReqFieldLabel" Text="Marketing Exe,Name"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlfreqtyp" runat="server" OnSelectedIndexChanged="ddlfreqtyp_SelectedIndexChanged"
                                                    AutoPostBack="True"
                                                    class="md-form-control form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">Monthly</asp:ListItem>
                                                    <asp:ListItem Value="2">Quaterly</asp:ListItem>
                                                    <asp:ListItem Value="3">Half Year</asp:ListItem>
                                                    <asp:ListItem Value="4">Annual</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:Button ID="btnFreqChange" Text="" runat="server" Style="display: none" OnClick="btnFreqChange_Click" />
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvfreqtyp" runat="server" ControlToValidate="ddlfreqtyp"
                                                        Display="Dynamic" ErrorMessage="Select a Frequency Type" InitialValue="0" ValidationGroup="Submit"
                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <asp:HiddenField ID="hdnFT" runat="server" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblfreqtyp" runat="server" CssClass="styleReqFieldLabel" Text="Frequency Type"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="chkActive" runat="server" Checked="True" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="TrgmstrInfo2" runat="server" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox runat="server" ID="txtMKTExecd" ReadOnly="True"
                                                    ToolTip="Marketing Executive Code"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Marketing Exe.Code" ID="lblmktexeccd" CssClass="styleDisplayLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox runat="server" ID="txtMKTExeNm" ReadOnly="True"
                                                    ToolTip="Marketing Executive Name"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Marketing Exe.Name" ID="Label2" CssClass="styleDisplayLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox runat="server" ID="txtdbtcllctr" ReadOnly="True"
                                                    ToolTip="Business Target No"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Business Target Number" ID="lbldebtcllctr" CssClass="styleDisplayLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" ToolTip="Address"
                                                    onkeyup="maxlengthfortxt(40);" ReadOnly="True"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                    ValidChars=" " TargetControlID="txtAddress" Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="Label3" runat="server" CssClass="styleDisplayLabel" Text="Address"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtPhone" runat="server" ReadOnly="True"
                                                    ToolTip="Phone" CssClass="styleFieldAlign"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <asp:TextBox ID="txtMobile" runat="server" TabIndex="-1" ReadOnly="True" Visible="false"
                                                    ToolTip="Mobile" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblMobile" runat="server" Text="[M]"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox runat="server" ID="txtemailaddr" ReadOnly="True" ToolTip="E-Mail Address"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="E-Mail Id" ID="Label4" CssClass="styleDisplayLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="chkcpytrg" runat="server" Checked="False" CssClass="styleDisplayLabel"
                                                    AutoPostBack="True" OnCheckedChanged="chkcpytrg_CheckedChanged" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <asp:Label runat="server" Text="Copy Target" ID="Label1"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="Panel1" runat="server" GroupingText="TARGET CLASSIFICATION" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlprod" runat="server" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvProduct" runat="server" ControlToValidate="ddlprod"
                                                        Display="Dynamic" ErrorMessage="Select a Product" InitialValue="0" ValidationGroup="Submit"
                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblprod" CssClass="styleReqFieldLabel" Text="Product"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtportfolirr" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                    runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblportfolirr" CssClass="styleDisplayLabel" Text="Portfolio IRR"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlassetcateg" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlassetcateg_SelectedIndexChanged" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblassetcateg" CssClass="styleDisplayLabel" Text="Asset Category"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="PNLBustrgDetails" runat="server" CssClass="stylePanel" GroupingText="Target Details"
                                    Width="98%" Visible="true">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="gvTargetMasterDetails" runat="server" AutoGenerateColumns="False"
                                                    Width="99%" ShowFooter="True" OnRowDataBound="gvTargetMasterDetails_RowDataBound"
                                                    OnRowCommand="gvTargetMasterDetails_RowCommand" OnRowDeleting="gvTargetMasterDetails_RowDeleting"
                                                    OnRowEditing="gvTargetMasterDetails_RowEditing" OnRowCancelingEdit="gvTargetMasterDetails_RowCancelingEdit"
                                                    OnRowUpdating="gvTargetMasterDetails_RowUpdating">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Asset Class">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAssetclass" runat="server" Text='<%#Bind("Asset_Class") %>' Style="text-align: left;"></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="ddlassetclass" runat="server" OnSelectedIndexChanged="ddlassetclass_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlassetclass" runat="server" OnSelectedIndexChanged="ddlassetclass_SelectedIndexChanged"
                                                                        AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Asset Make">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAssetmake" runat="server" Text='<%#Bind("Asset_Make") %>' Style="text-align: left;"></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="ddlassetmake" runat="server">
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlassetmake" runat="server"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Period" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
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
                                                                    Width="100px" Style="text-align: right;"></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtTargetAmount" Text='<%#Bind("Target_Amount") %>' MaxLength="15"
                                                                    ToolTip="Target Amount" Width="120px" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    Style="text-align: right;" runat="server"></asp:TextBox>
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
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox ID="txtTargetAmount" runat="server" MaxLength="15" Style="text-align: right;"
                                                                        ToolTip="Target Amount" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                    <cc1:FilteredTextBoxExtender ID="FtexTargetAmount" runat="server" TargetControlID="txtTargetAmount"
                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <FooterStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Units">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUnits" runat="server" Text='<%#Bind("Units") %>' Width="100px"
                                                                    Style="text-align: right;"></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtUnits" Text='<%#Bind("Units") %>' MaxLength="15" ToolTip="Units"
                                                                    Width="120px" onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right;"
                                                                    runat="server"></asp:TextBox>
                                                                <%--   <asp:RequiredFieldValidator ID="rfvtxtTargetAmount1" runat="server" Display="None"
                                                                            ValidationGroup="vgAdd" ErrorMessage="Enter Target Amount." ControlToValidate="txtTargetAmount"
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                <%--<asp:RangeValidator runat="server" ID="rvtxtTargetAmount" ControlToValidate="txtTargetAmount"
                                                                            SetFocusOnError="True" ErrorMessage="Target Amount should be less than 1000000"
                                                                            Type="Double" MinimumValue="0" MaximumValue="999999.9999" Display="None" ValidationGroup="vgAdd"
                                                                            CssClass="styleMandatoryLabel"></asp:RangeValidator>--%>
                                                                <cc1:FilteredTextBoxExtender ID="FtexUnits" runat="server" TargetControlID="txtUnits"
                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox ID="txtUnits" runat="server" MaxLength="15" Style="text-align: right;"
                                                                        ToolTip="Units" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Commission %">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCommissionPercentage" runat="server" Text='<%#Bind("Commission") %>'
                                                                    Width="100px" Style="text-align: right;"></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtCommissionPercentage" runat="server" Text='<%#Bind("Commission") %>'
                                                                    ToolTip="Commission %" onkeypress="fnAllowNumbersOnly(true,false,this)" Width="60px"
                                                                    onblur="funChkDecimial(this,2,2,'Commission %');" Style="text-align: right;"
                                                                    MaxLength="5"></asp:TextBox>
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
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox ID="txtCommissionPercentage" runat="server" onblur="funChkDecimial(this,2,2,'Commission %');"
                                                                        MaxLength="5" Style="text-align: right;" ToolTip="Commission %" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
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
                                                                </div>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Special Commision %">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSplCommissionPercentage" runat="server" Text='<%#Bind("Special_Commission") %>'
                                                                    Width="100px" Style="text-align: right;"></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtSplCommissionPercentage" runat="server" Text='<%#Bind("Special_Commission") %>'
                                                                    ToolTip="Special Commision %" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    Width="60px" onblur="funChkDecimial(this,2,2,'Special Commission %');" Style="text-align: right;"
                                                                    MaxLength="5"></asp:TextBox>
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
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox ID="txtSplCommissionPercentage" Style="text-align: right;" runat="server"
                                                                        ToolTip="Special Commision %" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                        onblur="funChkDecimial(this,2,2,'Special Commission %');" MaxLength="5"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                    <cc1:FilteredTextBoxExtender ID="FtexSplCommissionPercentage" runat="server" TargetControlID="txtSplCommissionPercentage"
                                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <FooterStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="Edit"
                                                                    Text="Edit"></asp:LinkButton>
                                                                <asp:LinkButton ID="lnkRemove" runat="server" CausesValidation="false" CommandName="Delete"
                                                                    OnClientClick="return confirm('Are you sure want to delete?');" Text="Delete"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="false" CommandName="Update"
                                                                    Text="Update" />
                                                                <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="false" CommandName="Cancel"
                                                                    Text="Cancel" />
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="true" CommandName="Add"
                                                                    Text="Add" CssClass="grid_btn" />
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
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="Pnlcpytrgt" runat="server" CssClass="stylePanel" GroupingText="Marketing Executives"
                                    Width="98%" Visible="false">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlcpytrgMxectyp" AutoPostBack="True" runat="server"
                                                    OnSelectedIndexChanged="ddlcpytrgMxectyp_SelectedIndexChanged" class="md-form-control form-control">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">Sales Executive</asp:ListItem>
                                                    <asp:ListItem Value="2">Third Party</asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlcpytrgMxectyp"
                                                        Display="Dynamic" ErrorMessage="Select a Marketing Executive Type" InitialValue="0"
                                                        ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblcpytrgMxectyp" runat="server" CssClass="styleReqFieldLabel" Text="Marketing Exe,Type"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvcpytrgt" runat="server" AutoGenerateColumns="False" Width="99%"
                                                    OnRowDataBound="grvcpytrgt_RowDataBound" CssClass="gird_details">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Code">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRoleCode" runat="server" Text='<%#Eval("User_ID")%>'></asp:Label><asp:Label
                                                                    ID="lblRoleCenterID" runat="server" Visible="false" Text='<%#Eval("User_ID")%>'></asp:Label>
                                                                <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("User_name")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="User_Name" HeaderText="Executive Name">
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="Select">
                                                            <HeaderTemplate>
                                                                <table align="center">
                                                                    <tr>
                                                                        <td>Select
                                                                        </td>
                                                                    </tr>
                                                                    <tr align="center">
                                                                        <td>
                                                                            <asp:CheckBox ID="chkAll" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <table>
                                                                    <tr>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <td>
                                                                            <asp:CheckBox ID="chkSelRoleCode" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
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
                            </div>
                        </div>
                        <div align="right">
                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Submit'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                type="button" accesskey="S" validationgroup="Submit">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="true" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="vsLRNote" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                    ShowMessageBox="false" ValidationGroup="Submit" HeaderText="Correct the following validation(s):" />
                                <asp:HiddenField ID="hidTRG" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:CustomValidator ID="cvTargetMaster" runat="server" CssClass="styleMandatoryLabel"
                                    Enabled="true" Width="98%" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>


        <script type="text/jscript" language="javascript">
            javascript: window.history.forward(1);
        </script>
    </div>
</asp:Content>
