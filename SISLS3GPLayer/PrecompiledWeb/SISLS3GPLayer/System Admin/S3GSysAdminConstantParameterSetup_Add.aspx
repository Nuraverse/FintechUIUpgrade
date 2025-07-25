<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3GSysAdminConstantParameterSetup_Add, App_Web_xht0hlsp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function ProgramName_ItemSelected(sender, e) {
            var hdnRoleID = $get('<%= hdnProgramID.ClientID %>');
            hdnRoleID.value = e.get_value();
        }
        function ProgramName_ItemPopulated(sender, e) {
            var hdnRoleID = $get('<%= hdnProgramID.ClientID %>');
            hdnRoleID.value = '';
        }
        function isNumberValidate(evt) {
            var gridId = 'ctl00_ContentPlaceHolder1_grvConsDocuments';
            var len = parseFloat(document.getElementById(gridId).rows.length);
            if (len <= 2) {
                var ParameterType = document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_ddlParamterType').value;
                var ParameterValue = document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').value;
                if (((((ParameterValue.split(".").length) > 1) || (ParameterValue.split(",").length) > 1)) && (ParameterType.value == "1" || ParameterType.value == "2")) {
                    alert('Enter Valid Length/Lookup Type.');
                    return false;
                    ParameterValue.focus();
                }
                //alert(ParameterValue.split(",").length - 1);
                //alert(ParameterValue.indexOf(","));
                if ((ParameterType == "1") && ((ParameterValue.split(",").length - 1) > 1)) {
                    alert('Enter Valid Length/Lookup Type for Selected Paramter Type.');
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').value = "";
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').focus();
                    return false;
                }

                    //else if ((ParameterType == "2") && (ParameterValue.indexOf(",") == -1)) {
                    //    alert('Enter Valid Length/Lookup Type for Selected Paramter Type.');
                    //    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').value = "";
                    //    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').focus();
                    //    return false;
                    //}

                    //else if ((ParameterType == "2") && (ParameterValue.indexOf(",,") >= 0)) {
                    //    alert('Enter Valid Length/Lookup Type for Selected Paramter Type.');
                    //    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').value = "";
                    //    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').focus();
                    //    return false;
                    //}
                else if ((ParameterType == "3") && (((ParameterValue.split(",").length - 1) >= 1))) {
                    alert('Enter Valid Length/Lookup Type for Selected Paramter Type.');
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').value = "";
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').focus();
                    return false;
                }
                if ((ParameterType == "1") && ((ParameterValue.split(",").length - 1) == 1)) {
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl03_txtFParamterValue').value = ParameterValue + "0";
                }
            }
            else {
                var gridId = 'ctl00_ContentPlaceHolder1_grvConsDocuments';
                var len = parseFloat(document.getElementById(gridId).rows.length);
                var doctype = gridId + '_ctl' + len + '_ddlParamterType';
                var ParameterVal = gridId + '_ctl' + len + '_txtFParamterValue';
                var ParameterType = document.getElementById(doctype).value;
                var ParameterValue = document.getElementById(ParameterVal).value;
                if (((((ParameterValue.split(".").length) > 1) || (ParameterValue.split(",").length) > 1)) && (ParameterType.value == "1" || ParameterType.value == "2")) {
                    alert('Enter Valid Length/Lookup Type.');
                    return false;
                    ParameterValue.focus();
                }

                if ((ParameterType == "1") && ((ParameterValue.split(",").length - 1) > 1)) {
                    alert('Enter Valid Length/Lookup Type for Selected Paramter Type.');
                    document.getElementById(ParameterVal).value = "";
                    document.getElementById(ParameterVal).focus();
                    return false;
                }

                else if ((ParameterType == "3") && (((ParameterValue.split(",").length - 1) >= 1))) {
                    alert('Enter Valid Length/Lookup Type for Selected Paramter Type.');
                    document.getElementById(ParameterVal).value = "";
                    document.getElementById(ParameterVal).focus();
                    return false;
                }
                if ((ParameterType == "1") && ((ParameterValue.split(",").length - 1) == 1)) {
                    document.getElementById(ParameterVal).value = ParameterValue + "0";
                }
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Panel GroupingText="Parameter Header" ID="Panel1" runat="server" CssClass="stylePanel">
                            <div>
                                <%-- <tr width="100%">
                                    <td width="55%">--%>
                                <div>
                                    <div class="row" runat="server" id="trConstitutionCode">
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtConstantCode" ReadOnly="true" runat="server" ToolTip="Constant Code" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Constant Code" ID="lblConstitutionCode" CssClass="styleReqFieldLabel" ToolTip="Constant Code">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                            <div class="lmd-input md-input">
                                                <asp:TextBox ID="txtConstantName" MaxLength="40" runat="server" class="lmd-form-control md-form-control form-control" required=""
                                                    ToolTip="Enter Constant Name">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Constant Name" ID="lblConstitutionName" CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvConstitutionName" CssClass="styleMandatoryLabel"
                                                        runat="server" ControlToValidate="txtConstantName" ValidationGroup="Constant" SetFocusOnError="true"
                                                        ErrorMessage="Enter the Constant Name" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtProgramName" runat="server" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtProgramName_TextChanged" AutoPostBack="true" MaxLength="100"></asp:TextBox>
                                                <cc1:AutoCompleteExtender ID="aceRoleName" MinimumPrefixLength="3" OnClientPopulated="ProgramName_ItemPopulated"
                                                    OnClientItemSelected="ProgramName_ItemSelected" runat="server" TargetControlID="txtProgramName"
                                                    ServiceMethod="GetProgramName" CompletionSetCount="5" Enabled="True"
                                                    CompletionListCssClass="CompletionListWithFixedHeight" DelimiterCharacters=";,:"
                                                    CompletionListItemCssClass="CompletionListItemCssClass" CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                                </cc1:AutoCompleteExtender>
                                                <asp:HiddenField ID="hdnProgramID" runat="server" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Module Description" ID="lblProgramName" ToolTip="Module Description" CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvCustomerType" CssClass="styleMandatoryLabel"
                                                        runat="server" ControlToValidate="txtProgramName" InitialValue="" ValidationGroup="Constant" SetFocusOnError="true"
                                                        ErrorMessage="Enter the Module Description" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                       <%-- <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="dvEntityType" runat="server" visible="false">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlEntityType" runat="server" class="md-form-control form-control">
                                                </asp:DropDownList>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblEntityType" runat="server" Text="Entity Type" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvEntitytype" runat="server" ErrorMessage="Select an Entity Type" Enabled="false"
                                                        ValidationGroup="Constant" Display="Dynamic" SetFocusOnError="True" InitialValue="0"
                                                        ControlToValidate="ddlEntityType" meta:resourcekey="rfvEntitytypeResource1"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="dvCustomerType" runat="server" visible="false">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCustomerType" runat="server" ToolTip="Constitution Type"
                                                    InitialValue="----Select----" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblCustomerType" CssClass="styleReqFieldLabel" Text="Constitution Type"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ValidationGroup="Constant" ID="rfvcustomer" runat="server" Enabled="false"
                                                        ControlToValidate="ddlCustomerType" CssClass="styleMandatoryLabel" Display="Dynamic" ErrorMessage="Select Customer Type"
                                                        InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>--%>
                                        <div class="row">
                                            <div class="col">
                                                <br />
                                                <asp:Button OnClientClick="return fnCopyProfile();" AccessKey="B" CssClass="styleSubmitButton"
                                                    Text="Copy Profile" ID="lnkCopyProfile" runat="server" ToolTip="Copy Profile" Visible="false"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlConstitution" ScrollBars="None" runat="server" CssClass="stylePanel" GroupingText="Constitution/Entity Type" Visible="false" >
                                            <asp:Panel ID="pnlGrvConstitution" runat="server" Height="150px" CssClass="stylePanel">
                                                <asp:GridView ID="GrvConstitution" runat="server" AutoGenerateColumns="False" OnRowDataBound="GrvConstitution_RowDataBound" ShowFooter="false" Width="100%" class="gird_details">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblNo0" runat="server" Text="<%#Container.DataItemIndex + 1%>" ToolTip="S.No"></asp:Label>
                                                            </ItemTemplate>
                                                             <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Constitution/Entity Type" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblConstitution" runat="server" Text='<%#Eval("NAME")%>' ToolTip="Constitution"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Constitution_ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblConstitution_Id" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelect0" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" ToolTip="Select" />
                                                                <asp:Label ID="lblChked0" runat="server" Text='<%#Eval("Assigned")%>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <RowStyle HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </asp:Panel>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel GroupingText="Line of Business Details" ID="pnllob" runat="server" CssClass="stylePanel" Visible="false">
                                            <div style="overflow-x: hidden; overflow-y: auto; text-align: center">
                                                <asp:GridView runat="server" ID="grvLOB" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                                    OnRowDataBound="grvLOB_RowDataBound" AutoGenerateColumns="False" Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line of Business"
                                                            HeaderStyle-Width="70%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("LOB_Name")%>' Text='<%#Eval("LOB_Name")%>'></asp:Label>
                                                                <asp:Label ID="lblLOBID" runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                                <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                <asp:Label ID="lblPARAM_LOB_DET_ID" runat="server" Visible="false" Text='<%#Eval("PARAM_LOB_DET_ID")%>'></asp:Label>
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
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel GroupingText="Parameter Details" ID="pnlDocs" Height="350px" runat="server" CssClass="stylePanel">
                            <%--                            <div>
                                <div class="row">
                                    <div class="col">--%>
                            <div class="gird">
                                <asp:GridView ShowFooter="True" runat="server" ID="grvConsDocuments" Width="100%"
                                    OnRowDataBound="grvConsDocs_RowDataBound" DataKeyNames="Sno" AutoGenerateColumns="False"
                                    OnRowCommand="grvConsDocuments_RowCommand" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblConstSNo" runat="server" Text='<%# Bind("Sno") %>' Width="150px" Visible="false"></asp:Label>
                                                <asp:Label runat="server" ID="Label1" Width="70%" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                <asp:Label ID="lblPARAM_ID" runat="server" Text='<%# Bind("PARAM_ID") %>' Width="150px" Visible="false"></asp:Label>
                                                <asp:Label ID="lblparamdetlsid" runat="server" Text='<%# Bind("PARAM_DET_ID") %>' Width="150px" Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Parameter Name" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTypes" Visible="true" ToolTip='<% #Bind("PARAM_NAME")%>' runat="server" Text='<% #Bind("PARAM_NAME")%>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <%--<div>
                                                                <div class="row">--%>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFParamterName" ToolTip="Parameter Name" class="md-form-control form-control login_form_content_input requires_true"
                                                        MaxLength="100" runat="server"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFParamterName" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter the Parameter Name" Display="Dynamic" SetFocusOnError="true"
                                                            ControlToValidate="txtFParamterName"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <%--  </div>
                                                            </div>--%>
                                            </FooterTemplate>
                                            <FooterStyle VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Parameter Type" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblParamType" Visible="false" runat="server" Text='<% #Bind("PARAM_DATA_TYPE")%>'> </asp:Label>
                                                <asp:Label ID="lblParamType_Descs" runat="server" Text='<% #Bind("Param_Type_Desc")%>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlParamterType" MaxLength="40" runat="server" CssClass="md-form-control form-control"
                                                        ToolTip="Parameter Type" AutoPostBack="true" OnSelectedIndexChanged="ddlParamterType_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvddlParamterType" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Select the Parameter Type" Display="Dynamic" SetFocusOnError="true" InitialValue="0" ControlToValidate="ddlParamterType"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Length/Lookup Type" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lbllengthortypecomms" runat="server" Text='<% #Bind("LENGTH_OR_LOOKUP_COMM")%>'>
                                                </asp:Label>
                                                <asp:Label ID="lblLookupID" Visible="false" runat="server" Text='<% #Bind("PARAM_DATA_LENGTH")%>'>
                                                </asp:Label>
                                                <asp:Label ID="lblLook_up_Type" Visible="false" runat="server" Text='<% #Bind("PARAM_LOOK_TYPE_ID")%>'>
                                                </asp:Label>
                                                <asp:Label ID="lblLook_up_Type_desc" Visible="false" runat="server" Text='<% #Bind("PARAM_LOOK_TYPE_DESC")%>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 10px;">
                                                    <%--<div class="col">--%>
                                                    <asp:TextBox ID="txtFParamterValue" ToolTip="Length/Lookup Type" onchange="return isNumberValidate(event);" class="md-form-control form-control login_form_content_input requires_true" runat="server" MaxLength="10"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEAmount" runat="server" TargetControlID="txtFParamterValue"
                                                        FilterType="Numbers,Custom" Enabled="true" ValidChars=",">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:CompareValidator ID="cvtxtFParamterValue" ValidationExpression="[0-9]*" Display="Dynamic" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                            ControlToValidate="txtFParamterValue" ErrorMessage="Length/Lookup Type Must be Greater Than 0"
                                                            Operator="GreaterThan" Type="String"
                                                            ValueToCompare="0,0" />
                                                    </div>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RangeValidator ID="rgvFParamterValue" runat="server" Display="Dynamic" ValidationGroup="btnAdd" Enabled="false" ControlToValidate="txtFParamterValue" CssClass="validation_msg_box_sapn" ErrorMessage="Enter number between 1 and 100" Type="Integer" MinimumValue="1" MaximumValue="100"></asp:RangeValidator>
                                                    </div>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFParamterValue" runat="server" ValidationGroup="btnAdd" Enabled="false" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter the Length/Lookup Type" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtFParamterValue"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <asp:Label ID="lblLookupNames" Text="Lookup Name" Visible="false" runat="server"></asp:Label>
                                                    <asp:RadioButtonList ID="rbnType" runat="server" class="md-form-control form-control radio" RepeatDirection="Horizontal" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="rbnType_SelectedIndexChanged">
                                                        <asp:ListItem Value="1" Text="New"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Existing"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvrbnType" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Select the Length/Lookup Type" Display="Dynamic" SetFocusOnError="true" ControlToValidate="rbnType"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <asp:TextBox ID="txtFLookupName" ToolTip="Length/Lookup Type" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="25" Visible="false"></asp:TextBox>

                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:DropDownList ID="ddlLookupVales" ToolTip="Length/Lookup Type" runat="server" Visible="false" CssClass="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box" style="top: 28px !important;">
                                                            <asp:RequiredFieldValidator ID="RFVddlLookupVales" runat="server" ValidationGroup="btnAdd" InitialValue="0"
                                                                ErrorMessage="Enter the Length/Lookup Type" Enabled="false" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlLookupVales"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvtxtFLookupName" runat="server" ValidationGroup="btnAdd"
                                                                ErrorMessage="Enter the Length/Lookup Type" Enabled="false" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtFLookupName"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Start Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromDates" Visible="true" runat="server" Text='<% #Bind("EFFECTIVE_FROM_DATE")%>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFFromDate" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Width="110px" OnTextChanged="txtFFromDate_TextChanged" AutoPostBack="true" runat="server"
                                                        ToolTip="Start Date"></asp:TextBox>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtFFromDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                        ID="CEFFromDate" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFFromDate" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter the Start Date" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtFFromDate"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="End Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToDates" Visible="true" runat="server" Text='<% #Bind("EFFECTIVE_TO_DATE")%>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFToDate" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Width="110px" runat="server" OnTextChanged="txtFToDate_TextChanged" AutoPostBack="true"
                                                        ToolTip="End Date" Text='<%#Bind("EFFECTIVE_TO_DATE")%>'></asp:TextBox>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtFToDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                        ID="CEFToDate" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFToDate" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter the End Date" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtFToDate"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%--                                                             <asp:LinkButton ID="btnRemove" runat="server" Text="Delete"
                                                        CommandName="Delete"></asp:LinkButton>--%>
                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CausesValidation="false" OnClick="RemoveRow"
                                                    ToolTip="Remove,Alt+R" AccessKey="R" CssClass="grid_btn_delete" OnClientClick="return confirm('Are you sure you want to remove this Parameter Details?');" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnAdd" CssClass="grid_btn" runat="server" AccessKey="T" Text="Add"
                                                    ToolTip="Add,Alt+T" CausesValidation="true" CommandName="Add" ValidationGroup="btnAdd" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Center" Width="7%" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%--</div>
                                </div>
                            </div>--%>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Constant'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%--  <div align="right" class="fixed_btn">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row" style="float: right; margin-top: 10px;">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-left: 5px;">
                                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                    <asp:Button runat="server" ID="btnSave" AccessKey="S" CssClass="save_btn fa fa-floppy-o" Text="Save"
                                        OnClick="btnSave_Click" ValidationGroup="Constant" OnClientClick="if(fnCheckPageValidators('Constant'))" ToolTip="Save the Details, Alt+S" />
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-left: 5px;">
                                    <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                                    <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="save_btn fa fa-floppy-o"
                                        Text="Clear" AccessKey="L" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                                        ToolTip="Clear the Details, Alt+L" />
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-left: 5px;">
                                    <i class="fa fa-times btn_i" aria-hidden="true"></i>
                                    <asp:Button runat="server" ID="btnCancel" ToolTip="Exit the Details, Alt+X" AccessKey="X" Text="Exit" CausesValidation="false"
                                        CssClass="save_btn fa fa-floppy-o" OnClick="btnCancel_Click" OnClientClick="return fnConfirmExit();" />
                                </div>
                                <div id="divTooltip" runat="server" style="border: 1px solid #000000; background-color: #FFFFCE; position: absolute; display: none;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div class="row">
                    <div class="col">
                        <input type="hidden" value="0" runat="server" id="hdnConstitution" />
                        <input type="hidden" value="0" runat="server" id="hdnMode" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" ValidationGroup="Constant"
                            HeaderText="Correct the following validation(s):" CssClass="styleSummaryStyle"
                            ShowMessageBox="false" ShowSummary="false" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary2" ValidationGroup="btnAdd"
                            HeaderText="Correct the following validation(s):" CssClass="styleSummaryStyle"
                            ShowMessageBox="false" ShowSummary="false" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

