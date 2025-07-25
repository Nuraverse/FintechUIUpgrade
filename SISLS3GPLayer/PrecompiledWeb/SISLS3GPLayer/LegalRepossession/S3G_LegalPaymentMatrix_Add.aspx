<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="FinancialAccounting_FAAuthorisationRuleCard, App_Web_prpaho0u" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">

        function funValidateMinAmount() {

            var vMinAmount = document.getElementById('<%=txtMinAmount.ClientID%>').value;
            var vMaxAmount = document.getElementById('<%=txtMaxAmount.ClientID%>').value;
            if (vMaxAmount > 0 && vMinAmount > 0) {
                if (parseFloat(vMinAmount) > parseFloat(vMaxAmount)) {
                    alert('Min amount should be less than the max amount');
                  //  document.getElementById('<%=txtMinAmount.ClientID%>').value = "";
                }
                if (parseFloat(vMinAmount) == parseFloat(vMaxAmount)) {
                    alert('Min and Max amount should not be the same');
                   // document.getElementById('<%=txtMinAmount.ClientID%>').value = "";
                   // document.getElementById('<%=txtMaxAmount.ClientID%>').value = "";
                }

            }
        }
        function funValidateMaxAmount() {

            var vMinAmount = document.getElementById('<%=txtMinAmount.ClientID%>').value;
            var vMaxAmount = document.getElementById('<%=txtMaxAmount.ClientID%>').value;
            if (vMaxAmount > 0 && vMinAmount > 0) {
                if (parseFloat(vMinAmount) > parseFloat(vMaxAmount)) {
                    alert('Max amount should be greater than the min amount');
                   // document.getElementById('<%=txtMaxAmount.ClientID%>').value = "";
                }

            }
            if (parseFloat(vMinAmount) == parseFloat(vMaxAmount)) {
                alert('Min and Max amount should not be the same');
               // document.getElementById('<%=txtMinAmount.ClientID%>').value = "";
               // document.getElementById('<%=txtMaxAmount.ClientID%>').value = "";
            }
        }
        function funValidateStartEndAmount() {

            var vMinAmount = document.getElementById('<%=txtMinAmount.ClientID%>').value;
            var vMaxAmount = document.getElementById('<%=txtMaxAmount.ClientID%>').value;
            if (vMaxAmount > 0 && vMinAmount > 0) {
                if (parseFloat(vMinAmount) > parseFloat(vMaxAmount)) {
                    alert('Start amount should not greater than the End Amount');
                   // document.getElementById('<%=txtMaxAmount.ClientID%>').value = "";
                }

            }
        }

        function funValidateMatrixGrid() {
            //Created by Sathish R
            var vContinueorExit;
            vContinueorExit = true;
            var grvLawerMatrixDetails = document.getElementById('<%= grvLawerMatrixDetails.ClientID %>');
            var vPerType = document.getElementById('<%= rbtnCaseChargeTypePer.ClientID %>');
            <%--var vFixedType = document.getElementById('<%= rbtnCaseChargeTypeFixed.ClientID %>');--%>

            for (var rowId = 1; rowId < grvLawerMatrixDetails.rows.length; rowId++) {

                var vStartAMount = grvLawerMatrixDetails.rows[rowId].cells[3].all[0].value;
                var vEndAmount = grvLawerMatrixDetails.rows[rowId].cells[4].all[0].value;
                var txtPerFIxed = grvLawerMatrixDetails.rows[rowId].cells[5].all[0].value;

                if (grvLawerMatrixDetails.rows[rowId].cells[1].childNodes[0].value == 0)//find DropDown
                {
                    alert('Select the Court Type');
                    grvLawerMatrixDetails.rows[rowId].cells[1].childNodes[0].focus();
                    vContinueorExit = false;
                    break;
                }
                if (grvLawerMatrixDetails.rows[rowId].cells[2].childNodes[0].value == 0)//find DropDown
                {
                    alert('Select the slab');
                    grvLawerMatrixDetails.rows[rowId].cells[2].childNodes[0].focus();
                    vContinueorExit = false;
                    break;
                }
                if (grvLawerMatrixDetails.rows[rowId].cells[3].all[0].value == '') {
                    alert('Enter the Start amount');
                    grvLawerMatrixDetails.rows[rowId].cells[3].all[0].focus();
                    vContinueorExit = false;
                    break;
                }
                if (grvLawerMatrixDetails.rows[rowId].cells[4].all[0].value == '') {
                    alert('Enter the End amount');
                    grvLawerMatrixDetails.rows[rowId].cells[4].all[0].focus();
                    vContinueorExit = false;
                    break;
                }
                //if (grvLawerMatrixDetails.rows[rowId].cells[5].childNodes[0].value == 0)//find DropDown
                //{
                //    alert('Select the Breakup Type');
                //    grvLawerMatrixDetails.rows[rowId].cells[5].childNodes[0].focus();
                //    vContinueorExit = false;
                //    break;
                //}


                if (grvLawerMatrixDetails.rows[rowId].cells[5].all[0].value == '') {
                    if (vPerType.status == true) {
                        alert('Enter the  Percentage');
                        vContinueorExit = false;
                        break;
                    }
                    if (vPerType.status == true) {
                        alert('Enter the  Fixed amount');
                        vContinueorExit = false;
                        break;
                    }
                    grvLawerMatrixDetails.rows[rowId].cells[5].all[0].focus();
                    vContinueorExit = false;

                }
                //if (grvLawerMatrixDetails.rows[rowId].cells[7].childNodes[0].value == 0)//find DropDown
                //{
                //    alert('Select the OTH Breakup Type');
                //    grvLawerMatrixDetails.rows[rowId].cells[7].childNodes[0].focus();
                //    vContinueorExit = false;
                //    break;
                //}

                if (vEndAmount > 0) {
                    if (parseInt(vStartAMount) > parseInt(vEndAmount)) {
                        grvLawerMatrixDetails.rows[rowId].cells[4].all[0].value = '';
                        alert('End amount should be greater than the start amount');
                        vContinueorExit = false;
                        break;
                    }
                }
                if (vPerType.status == true) {

                    if (parseInt(txtPerFIxed) > 100) {
                        alert('Percentage should not exceed 100');
                        grvLawerMatrixDetails.rows[rowId].cells[5].all[0].value = '';
                        vContinueorExit = false;
                        break;
                    }
                }
            }
            return vContinueorExit;
        }
        function funValidateBreakupGrid() {
            //Created by Sathish R

            var vContinueorExit;
            vContinueorExit = true;
            var grvLawerMatrixDetails = document.getElementById('<%= grvMatrixBreakup.ClientID %>');
            var vPerType = document.getElementById('<%= rbtnCaseChargeTypePer.ClientID %>');
            <%--var vFixedType = document.getElementById('<%= rbtnCaseChargeTypeFixed.ClientID %>');--%>

            for (var rowId = 1; rowId < grvLawerMatrixDetails.rows.length; rowId++) {
                if (grvLawerMatrixDetails.rows[rowId].cells[1].childNodes[0].value == 0)//find DropDown
                {
                    alert('Select the Type');
                    grvLawerMatrixDetails.rows[rowId].cells[1].childNodes[0].focus();
                    vContinueorExit = false;
                    break;
                }
                if (grvLawerMatrixDetails.rows[rowId].cells[2].all[0].value == '') {
                    alert('Enter the  amount');
                    grvLawerMatrixDetails.rows[rowId].cells[2].all[0].focus();
                    vContinueorExit = false;
                    break;
                }

            }
            return vContinueorExit;
        }
        function funValidateOTHBreakupGrid() {
            //Created by Sathish R

            var vContinueorExit;
            vContinueorExit = true;
            var grvLawerMatrixDetails = document.getElementById('<%= grvOthBreakup.ClientID %>');
            var vPerType = document.getElementById('<%= rbtnCaseChargeTypePer.ClientID %>');
         <%--   var vFixedType = document.getElementById('<%= rbtnCaseChargeTypeFixed.ClientID %>');--%>

            for (var rowId = 1; rowId < grvLawerMatrixDetails.rows.length; rowId++) {
                if (grvLawerMatrixDetails.rows[rowId].cells[1].childNodes[0].value == 0)//find DropDown
                {
                    alert('Select the Type');
                    grvLawerMatrixDetails.rows[rowId].cells[1].childNodes[0].focus();
                    vContinueorExit = false;
                    break;
                }
                if (grvLawerMatrixDetails.rows[rowId].cells[2].all[0].value == '') {
                    alert('Enter the  amount');
                    grvLawerMatrixDetails.rows[rowId].cells[2].all[0].focus();
                    vContinueorExit = false;
                    break;
                }

            }
            return vContinueorExit;
        }
        function fnConfirmSave() {
            if (confirm('Do you want to Save?')) {
                return true;
            }
            else
                return false;

        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                    <%-- <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="styleFieldLabel">

                        <asp:Label runat="server" Text="Lawyer Code" CssClass="styleReqFieldLabel" ID="lblActivity"></asp:Label>
                    </td>
                    <td class="styleFieldAlign">

                        <uc2:Suggest ID="ddlLawyerCode" Width="450px" OnLenseSearch_Click="ddlLawyerCode_LenseSearch_Click" OnItem_Selected="ddlLawyerCode_OnSelectedIndexChanged" ValidationGroup="main" ErrorMessage="Select the Lawyer" ToolTip="Lawyer Code" runat="server" AutoPostBack="false" IsMandatory="true" ServiceMethod="GetFromLawyerCode"
                            WatermarkText="--Select--" />
                    </td>
                    <td class="styleFieldLabel"></td>
                    <td class="styleFieldAlign"></td>
                </tr>
            </table>--%>



                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <uc2:Suggest ID="ddlLawyerCode" OnItem_Selected="ddlLawyerCode_OnSelectedIndexChanged" ValidationGroup="main"  
                                    ErrorMessage="Select the Lawyer" ToolTip="Lawyer Code/Name" runat="server" AutoPostBack="false" IsMandatory="true" ServiceMethod="GetFromLawyerCode"
                                    WatermarkText="--Select--" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Lawyer Code/Name" CssClass="styleReqFieldLabel" ID="lblActivity"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:RadioButtonList ID="rbtnCaseChargeTypePer" GroupName="CaseChargeType" AutoPostBack="true" OnSelectedIndexChanged="rbtnCaseChargeTypePer_SelectedIndexChanged" runat="server" RepeatDirection="Horizontal"
                                    CssClass="md-form-control form-control radio">
                                    <asp:ListItem Text="Percentage" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Fixed" Value="2" Selected="True"></asp:ListItem>

                                </asp:RadioButtonList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Case Charge Type" ID="lblChargeCaseType" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">  
                            <div class="md-input"> 
                                <asp:TextBox ID="txtShemeType" runat="server" MaxLength="51" onkeyup="maxlengthfortxt(50);"
                                        class="md-form-control form-control login_form_content_input requires_true"  autocomplete = "off"></asp:TextBox>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvSchemeType" ValidationGroup="main" Display="Dynamic"
                                        ErrorMessage="Enter Scheme Type" ControlToValidate="txtShemeType" runat="server"
                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblSchemeType" runat="server" Text="Scheme Type" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtMinAmount"  runat="server"  autocomplete = "off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvMinAmount" ValidationGroup="main" Display="Dynamic"
                                        ErrorMessage="Enter Min Amount" ControlToValidate="txtMinAmount"
                                        runat="server"  CssClass="validation_msg_box_sapn" ></asp:RequiredFieldValidator>
                                </div>
                                <cc1:FilteredTextBoxExtender ID="fltMinAmount" runat="server" TargetControlID="txtMinAmount"
                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                </cc1:FilteredTextBoxExtender>
                                <span class="highlight"></span>
                                <span class="bar"></span>

                                <label>
                                    <asp:Label runat="server" Text="Min Amount" ID="lblMinAmount" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtMaxAmount" Style="text-align: right" runat="server"  autocomplete = "off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvMaxAmount" ValidationGroup="main"
                                        ControlToValidate="txtMaxAmount" runat="server" ErrorMessage="Enter Max Amount"
                                        Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <cc1:FilteredTextBoxExtender ID="fltMaxAmount" runat="server" TargetControlID="txtMaxAmount"
                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                </cc1:FilteredTextBoxExtender>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Max Amount" ID="lblMaxAmount" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtEffetiveDate"  runat="server" autocomplete = "off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                  <cc1:CalendarExtender ID="cexEffectiveDate" runat="server" Enabled="True"  
                                     TargetControlID="txtEffetiveDate">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvEffectiveDate" ValidationGroup="main" ControlToValidate="txtEffetiveDate" runat="server"
                                        Display="Dynamic" ErrorMessage="Enter Effective start date" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Effective Start Date" ID="lblEffetiveDate" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtEffectiveEndate" AutoPostBack="false"  runat="server" autocomplete = "off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                 <cc1:CalendarExtender ID="CEEffetiveEndDate" runat="server" Enabled="True"   TargetControlID="txtEffectiveEndate">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvEffectiveEnddate" ValidationGroup="main" ControlToValidate="txtEffectiveEndate" runat="server"
                                        Display="Dynamic"  ErrorMessage="Enter Effective end date"  CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Effective End Date" ID="lblEffetiveEnddate" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <asp:Label ID="Label1" runat="server" Text="Active"></asp:Label>
                                <asp:CheckBox ID="ChkActive" runat="server" Checked="True" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="panDateFormat" GroupingText="Lawyer Slab Details" runat="server"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="grid">
                                            <asp:GridView ID="grvLawerMatrixDetails" ShowFooter="true" AutoGenerateColumns="false"
                                                runat="server" OnRowCommand="grvLawerMatrixDetails_RowCommand" OnRowDataBound="grvLawerMatrixDetails_RowDataBound"
                                                OnRowDeleting="grvLawerMatrixDetails_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNoMatrix") %>'></asp:Label>
                                                            <asp:Label runat="server" ID="Label1" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label runat="server" Visible="false" ID="lblFootersno" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Court Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblCourtType" Text='<%# Bind("Court_Type") %>' ToolTip='<%# Bind("Court_Type") %>' runat="server"> </asp:Label>
                                                            <asp:Label ID="LblCourtType_Id" Visible="false" Text='<%# Bind("Court_Type_Id") %>' runat="server"> </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <FooterTemplate>
                                                            <asp:DropDownList ID="ddlCourtTypeF" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourtTypeF_SelectedIndexChanged"
                                                                CssClass="md-form-control form-control login_form_content_input" ToolTip="Court Type">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Slab">
                                                        <ItemTemplate>
                                                            <%-- <asp:DropDownList ID="ddlSlabI" Width="100%" runat="server"></asp:DropDownList>--%>
                                                            <asp:Label ID="Label4" Text='<%# Bind("Slab") %>'  ToolTip='<%# Bind("Slab") %>' runat="server"> </asp:Label>
                                                            <asp:Label ID="lblSlabI" Visible="false" Text='<%# Bind("Slab_Type_Id") %>' runat="server"> </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <FooterTemplate>
                                                            <asp:DropDownList ID="ddlSlabF" AutoPostBack="true" OnSelectedIndexChanged="ddlSlabF_SelectedIndexChanged" runat="server"
                                                                CssClass="md-form-control form-control login_form_content_input" ToolTip="Slab">
                                                            </asp:DropDownList>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Start Amount">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtStartAmount" MaxLength="12" EnableViewState="true" ToolTip="Start Amount" Text='<%# Bind("Start_Amount")%>'
                                                                Style="text-align: right" runat="server"  autocomplete = "off"></asp:TextBox>

                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtStartAmount"
                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterTemplate>

                                                            <asp:TextBox ID="txtAddStartAmount" ToolTip="Start Amount" AutoPostBack="false" OnTextChanged="txtStartAmount_TextChanged" MaxLength="12" runat="server" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true"  autocomplete = "off"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtAddStartAmount"
                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="End Amount">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtEndAmount" MaxLength="12" AutoPostBack="false" OnTextChanged="txtEndAmount_TextChanged" ToolTip="End Amount" Style="text-align: right"
                                                                Text='<%# Bind("End_Amount")%>' runat="server"  autocomplete = "off"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtEndAmount"
                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtAddEndAmount" MaxLength="12" AutoPostBack="false" OnTextChanged="txtEndAmount_TextChanged" ToolTip="End Amount" runat="server" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true"  autocomplete = "off">
                                                            </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtAddEndAmount"
                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="[% or Fixed]">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtPerFixedI" Text='<%# Bind("PerFixed")%>' runat="server" ToolTip='<%# Bind("PerFixed")%>' Style="text-align: right"  autocomplete = "off"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtPerFixedF" runat="server" Style="text-align: right" ToolTip="[% or Fixed]"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fltPerfixed" runat="server" TargetControlID="txtPerFixedF"
                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField Visible="false" HeaderText="Breakup Type">
                                                        <ItemTemplate>

                                                            <asp:Label ID="lblBreakupType" Text='<%# Bind("Case_Breakup_Type")%>' runat="server"></asp:Label>
                                                            <asp:Label ID="Label3" Visible="false" Text='<%# Bind("Case_Breakup_Type_Id")%>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <FooterTemplate>
                                                            <asp:DropDownList ID="ddlBreakupType" runat="server"></asp:DropDownList>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Breakup">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnIApproverI" OnClick="btnBreakUp_Click" Height="30px" src="../Images/Dimm2.JPG" runat="server"
                                                                ToolTip="Show Breakup" />

                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:ImageButton ID="btnIApproverF" OnClick="btnBreakUp_ClickFooPop" Height="30px" src="../Images/Dimm2.JPG" runat="server"
                                                                ToolTip="Show Breakup" />
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="OTH Breakup Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOTHBreakupType" Visible="false" Text='<%# Bind("OTHCase_Breakup_Type_Id")%>' runat="server"></asp:Label>
                                                            <asp:Label ID="Label5" Text='<%# Bind("OTHCase_Breakup_Type")%>' runat="server"></asp:Label>

                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <FooterTemplate>
                                                            <asp:DropDownList ID="ddlOTHBreakupType" runat="server"
                                                                CssClass="md-form-control form-control login_form_content_input">
                                                            </asp:DropDownList>
                                                            
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="OTH Breakup">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnOTHIApproverI" OnClick="btnOTHBreakupPop_Click" Height="30px" src="../Images/Dimm2.JPG" runat="server"
                                                                ToolTip="Show OTH Breakup" />

                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:ImageButton ID="btnOTHIApproverF" OnClick="btnOTHBreakupPop_ClickFooPop" Height="30px" src="../Images/Dimm2.JPG" runat="server"
                                                                ToolTip="Show OTH Breakup" />
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <%-- <asp:ImageButton ID="btnRemove" CommandName="Delete" CausesValidation="false" Height="30px" src="../Images/DeleteImage.png" runat="server" />--%>

                                                            <asp:Button ID="btnRemove" Text="Delete" ToolTip="Delete,Alt+Y"
                                                                AccessKey="Y" CommandName="Delete" runat="server" CssClass="grid_btn" CausesValidation="false" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <%-- <asp:ImageButton ID="btnDetails" AccessKey="S" CommandName="AddNew" OnClientClick=" return funValidateMatrixGrid();" CausesValidation="false" Height="30px" src="../Images/ICOAddImage.png" runat="server" />--%>

                                                            <asp:Button ID="btnDetails" Text="Add" ToolTip="Add,Alt+A" AccessKey="A"
                                                                CommandName="Add" runat="server" OnClientClick=" return funValidateMatrixGrid();"
                                                                CssClass="grid_btn"  />

                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
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
                            <asp:Button ID="btnReset" Visible="false" CssClass="styleSubmitButton" Text="Reset"
                                runat="server" CausesValidation="false" OnClick="btnReset_Click" ToolTip="Reset,Alt+R" AccessKey="R" />&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <div align="right">

                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="main"
                             onclick="if(fnCheckPageValidators('main'))" >

                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                            onserverclick="btnClear_Click" type="button" accesskey="L" title="Clear[Alt+L]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                            type="button" accesskey="X" title="Exit[Alt+X]" >
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>
                    <tr class="styleButtonArea">
                        <td colspan="4">
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        </td>
                    </tr>
                   <%-- <tr>
                        <td>
                            <asp:ValidationSummary ID="AuthorizationRulecardAdd" runat="server" ValidationGroup="main" ShowSummary="true"
                                HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            <input id="hdnGrvCnt" runat="server" value="0" type="hidden" />
                        </td>
                    </tr>--%>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
                PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
                BorderStyle="Solid" BackColor="White" Width="50%">
                <asp:UpdatePanel ID="upPass" runat="server">
                    <ContentTemplate>

                        <div id="divTransaction" class="container" runat="server" style="height: 350px; overflow:auto;">
                            <asp:GridView ID="grvMatrixBreakup" runat="server" AutoGenerateColumns="false"
                                OnRowDataBound="grvMatrixBreakup_DataBound" Height="50px" OnRowDeleting="grvMatrixBreakup_RowDeleting"
                                ShowFooter="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSno" ToolTip="Serial Number" Visible="false" Text='<% #Bind("Sno")%>'
                                                runat="server"></asp:Label>
                                            <asp:Label runat="server" ID="Label1" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                            <asp:Label ID="lblSNoMatrix" Text='<% #Bind("SnoMatrix_Id")%>' Visible="false" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" HorizontalAlign="Center" />
                                        <FooterStyle Width="2%" HorizontalAlign="left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Breakup Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBreakupType" runat="server" Text='<% #Bind("Break_Type")%>' ToolTip='<% #Bind("Break_Type")%>'>
                                            </asp:Label>
                                            <asp:Label ID="lblCharge" Visible="false" runat="server" Text='<% #Bind("Break_Type_Id")%>'>
                                            </asp:Label>
                                            <asp:Label ID="lblCase_Break_Type_Id" Visible="false" runat="server" Text='<% #Bind("Case_Break_Type_Id")%>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlChargeType" Width="190px"  
                                                ToolTip="Breakup Type" runat="server">
                                            </asp:DropDownList>
                                         
                                        </FooterTemplate>
                                        <FooterStyle Width="10%" HorizontalAlign="left" />
                                        <ItemStyle Width="10%" HorizontalAlign="left" />

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Breakup [%]">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmountI" Width="190px" Text='<% #Bind("Amount")%>' ToolTip='<% #Bind("Amount")%>'  runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtAmount" AutoPostBack="false" Width="190px" runat="server" ToolTip="Breakup [%]"
                                                class="md-form-control form-control login_form_content_input requires_true"  autocomplete = "off"></asp:TextBox>
                                            </div>
                                            <cc1:FilteredTextBoxExtender ID="FilteredtxtAmount" runat="server" TargetControlID="txtAmount"
                                                FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                        </FooterTemplate>
                                        <FooterStyle Width="10%" HorizontalAlign="Right" />
                                        <ItemStyle Width="10%" HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%-- <asp:ImageButton ID="btnDelete" CommandName="Delete" CausesValidation="false" Height="30px" src="../Images/DeleteImage.png" runat="server" />--%>
                                            <asp:Button ID="btnDelete" Text="Delete" ToolTip="Delete,Alt+M" AccessKey="M"
                                                CommandName="Delete" runat="server" CssClass="grid_btn" CausesValidation="false" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <asp:Button ID="btnDetails" Text="Add" ToolTip="Add,Alt+K" AccessKey="K"
                                                CommandName="AddNew" runat="server" OnClick="btnBreakupAdd_Click" OnClientClick="return funValidateBreakupGrid();" 
                                                CssClass="grid_btn" CausesValidation="false"  />
                                        </FooterTemplate>
                                        <FooterStyle Width="2%" HorizontalAlign="left" />
                                        <ItemStyle Width="2%" HorizontalAlign="left" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div align="right">
                            <button class="css_btn_enabled" id="btnDEVModalAdd" onserverclick="btnSaveModelBreakupPop_Click" runat="server" title="Save[Alt+Q]" 
                                                                AccessKey="Q"
                                type="button" causesvalidation="false"  >
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Save
                            </button>
                            <button class="css_btn_enabled" id="btnDEVModalCancel" onserverclick="btnCloseBreakUpModelPop_Click" runat="server" causesvalidation="false" title="Exit[Alt+G]"
                                type="button" accesskey="G">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                            </button>
                        </div>
                        <tr>
                            <td>
                                <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            </td>
                        </tr>


                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button ID="btnModal" Style="display: none" runat="server" />
            </asp:Panel>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="ModalPopOTHBreakUp" runat="server" TargetControlID="btnModalOTH"
                PopupControlID="pnlOthBreakup" BackgroundCssClass="styleModalBackground" Enabled="true">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlOthBreakup" Style="display: none; vertical-align: middle" runat="server"
                BorderStyle="Solid" BackColor="White" Width="50%">
                <asp:UpdatePanel ID="updPnlOTHBreakup" runat="server">
                    <ContentTemplate>


                        <tr align="center">
                            <td>
                                <div id="div1" class="container" runat="server" style="height: 250px; overflow:auto;">
                                    <asp:GridView ID="grvOthBreakup" runat="server" AutoGenerateColumns="false" Height="50px"
                                        OnRowDataBound="grvOTHMatrixBreakup_DataBound" OnRowDeleting="grvOTHMatrixBreakup_RowDeleting"
                                        ShowFooter="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSno" ToolTip="Serial Number" Visible="false" Text='<% #Bind("Sno")%>'
                                                        runat="server"></asp:Label>
                                                    <asp:Label runat="server" ID="Label1" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:Label ID="lblSNoMatrix" Text='<% #Bind("SnoMatrix_Id")%>' Visible="false" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="2%" HorizontalAlign="Center" />   
                                                <FooterStyle Width="2%" HorizontalAlign="left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OTH Breakup Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBreakupType" runat="server" Text='<% #Bind("Break_Type")%>' ToolTip='<% #Bind("Break_Type")%>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblCharge" Visible="false" runat="server" Text='<% #Bind("Break_Type_Id")%>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblCase_Break_Type_Id" Visible="false" runat="server" Text='<% #Bind("Case_Break_Type_Id")%>'>
                                                           
                                                    </asp:Label>
                                                </ItemTemplate>

                                                <FooterTemplate>
                                                    <asp:DropDownList ID="ddlChargeType" Width="190px" AutoPostBack="true"
                                                        ToolTip="OTH Breakup Type" runat="server">
                                                    </asp:DropDownList>

                                                </FooterTemplate>
                                                <FooterStyle Width="10%" HorizontalAlign="left" />
                                                <ItemStyle Width="10%" HorizontalAlign="left" />

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OTH Breakup Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmountI" Width="190px" Text='<% #Bind("Amount")%>'  ToolTip='<% #Bind("Amount")%>' runat="server" ></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtAmount" class="md-form-control form-control login_form_content_input requires_true" 
                                                        ToolTip="OTH Breakup Amount" runat="server"  autocomplete = "off"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredtxtAmount" runat="server" TargetControlID="txtAmount"
                                                        FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                </FooterTemplate>
                                                <FooterStyle Width="10%" HorizontalAlign="Right" />
                                                <ItemStyle Width="10%" HorizontalAlign="Right" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <%--  <asp:ImageButton ID="btnDelete" CommandName="Delete" CausesValidation="false" Height="30px" src="../Images/DeleteImage.png" runat="server" />--%>
                                                    <asp:Button ID="btnDelete" Text="Delete" ToolTip="Delete,Alt+N"
                                                                AccessKey="N"
                                                        CommandName="Delete" runat="server" CssClass="grid_btn" CausesValidation="false" />
                                                </ItemTemplate>

                                                <FooterTemplate>
                                                    <%--  <asp:ImageButton ID="btnDetails" CommandName="AddNew" OnClientClick="return funValidateOTHBreakupGrid();" CausesValidation="false" OnClick="btnOTHBreakupAdd_Click" Height="30px" src="../Images/ICOAddImage.png" runat="server" />--%>
                                                    <asp:Button ID="btnDetails" Text="Add" ToolTip="Add,Alt+B" AccessKey="B"
                                                        CommandName="AddNew" runat="server" OnClick="btnOTHBreakupAdd_Click" OnClientClick="return funValidateOTHBreakupGrid();" 
                                                        CssClass="grid_btn" CausesValidation="false" />
                                                </FooterTemplate>
                                                <FooterStyle Width="2%" HorizontalAlign="Right" />
                                                <ItemStyle Width="2%" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        
                            <div align="right">
                                  <button class="css_btn_enabled" id="btnSaveOTHBreakup" onserverclick="btnOTHSaveModelBreakupPop_Click" runat="server"
                                    type="button" causesvalidation="false" title="Save[Alt+V]" 
                                                                AccessKey="V">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Sa<u>v</u>e
                                </button>
                                 <button class="css_btn_enabled" id="btnCloseOTHBreakup" onserverclick="btnCloseOTHBreakUpModelPop_Click" runat="server" causesvalidation="false" title="Exit[Alt+T]"
                                type="button" accesskey="T">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exi<u>t</u>
                            </button>
                            </div>

                        <tr>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            </td>
                        </tr>

                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button ID="btnModalOTH" Style="display: none" runat="server" />
            </asp:Panel>
        </div>
    </div>
</asp:Content>

