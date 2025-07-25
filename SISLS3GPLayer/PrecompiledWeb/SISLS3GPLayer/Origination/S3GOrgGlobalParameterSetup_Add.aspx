<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgGlobalParameterSetup, App_Web_midi1nyg" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function fnGetRecoveryValue(strRecoveryPatternYear) {
            var exp = /_/gi;
            return parseFloat(document.getElementById(strRecoveryPatternYear).value.replace(exp, '0'));
        }

        function fnCalculateMarginPercentage(strMarginPercentage) {
            var RecoveryPatternYear1;
            RecoveryPatternYear1 = fnGetRecoveryValue(strMarginPercentage);
            if (RecoveryPatternYear1 > 100) {
                alert('CTR and PLR % should not be greater than 100%');
                document.getElementById(strMarginPercentage).focus();
                return;
            }
        }

        function fnAssignText(objCheck) {

            var chkbox;
            var i = 2;
            //var gridId = 'ctl00_ContentPlaceHolder1_' + grdid;            
            var gridId = "<%= gvProgram.ClientID %>"; //"ctl00_ContentPlaceHolder1_tcGlobal_TabPanel2_gvProgram";
            var objid = "CbxProgram";

            chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);

            var cnt = 0;
            while (chkbox != null) {

                if (chkbox.checked) cnt++; //else cnt--;
                i = i + 1;
                if (i <= 9) {
                    chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);
                }
                else
                    chkbox = document.getElementById(gridId + '_ctl' + i + '_' + objid);
            }
            if (cnt == 0) cnt = "";
            document.getElementById("<%= txtPro.ClientID %>").value = cnt;
        }

        function fnSpaceNotAllowed(isSpaceAllowed) {
            debugger;
            var sKeyCode = window.event.keyCode;
            if ((isSpaceAllowed) && (sKeyCode == 32)) {
                window.event.keyCode = 0;
                return false;
            }
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <cc1:TabContainer ID="tcGlobal" runat="server" CssClass="styleTabPanel" Width="100%"
                            ScrollBars="Auto" ActiveTabIndex="0">
                            <!--Process Details -->
                            <cc1:TabPanel runat="server" HeaderText="Process" ID="tbProcess" CssClass="tabpan"
                                BackColor="Red" Width="100%">
                                <HeaderTemplate>
                                    Process
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlProcess" Width="100%" GroupingText="Process" CssClass="stylePanel">
                                        <div>
                                            <div class="row" style="text-align: center;">
                                                <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="lblProductInflow" runat="server" Text="Scheme Inflow Adjust"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                     <asp:CheckBox ID="cbxProductInflow" ToolTip="Scheme Inflow Adjust" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col md-input">
                                                    <bold><asp:Label ID="Label1" runat="server" Text="Starting point of the process :" 
                                                    Font-Bold="True"></asp:Label>
                                                </bold>
                                                </div>
                                            </div>
                                            <div class="" style="display: none;">
                                                <div class="md-input">
                                                    <asp:Label ID="Label5" runat="server" Text="Enquiry Number change after offer is generated"
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                    <asp:DropDownList ID="ddlModify" runat="server" Width="50px" CssClass="md-form-control form-control" OnSelectedIndexChanged="ddlModify_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvModify" runat="server" Display="Dynamic" ErrorMessage="Define Enquiry change rule - Process Tab"
                                                            ControlToValidate="ddlModify" InitialValue="-1"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="col md-input">
                                                        <asp:Label ID="lblEnquiryNo" runat="server" Text="Check List Processing Number"></asp:Label>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:CheckBox runat="server" ID="CbxEnquiryNo" ToolTip="Check List Processing Number" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="col md-input">
                                                        <asp:Label ID="Label2" runat="server" Text="Application Processing Number"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:CheckBox runat="server" ID="CbxOfferNo" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="display: none;">
                                                <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="col md-input">
                                                        <asp:Label ID="Label3" runat="server" Text="Application Number"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:CheckBox runat="server" ID="CbxApplicationNo" ToolTip="Application Processing Number" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="display: none;">
                                                <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="col md-input">
                                                        <asp:Label ID="Label4" CssClass="styleDisplayLabel" runat="server" Text="Credit Score negative variance applicable"></asp:Label>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox runat="server" ID="chkNegative" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--IRR Details -->
                            <cc1:TabPanel runat="server" HeaderText="Internal Rate of Return (IRR)" ID="TabPanel1"
                                CssClass="tabpan" BackColor="Red" Width="100%">
                                <HeaderTemplate>
                                    Internal Rate of Return (IRR)
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="Panel1" Width="100%" GroupingText="Internal Rate of Return (IRR)" CssClass="stylePanel">
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlIRR" Width="300px" runat="server" CssClass="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvddlIRR" runat="server" ErrorMessage="Define IRR applicability - IRR Tab" SetFocusOnError="true" ValidationGroup="Save"
                                                                ControlToValidate="ddlIRR" InitialValue="-1" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblIRR" runat="server" Text="IRR Rule Details" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                      
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top: 25px;">
                                                <div class="col">
                                                    <div style="height: 300px; width: 75%">
                                                        <div class="grid">
                                                            <asp:GridView ID="gvIRR" runat="server" AutoGenerateColumns="False" BorderColor="Gray"
                                                                Width="100%" OnRowDataBound="gvIRR_RowDataBound" DataKeyNames="LOB_ID" CssClass="styleInfoLabel" class="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="False">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLobID" runat="server" Text='<%# Bind("LOB_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Line of Business">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLob" runat="server" Text='<%# Bind("LOB") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Invoice Required" Visible="false">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlvoice" runat="server" Width="90px" CssClass="md-form-control form-control">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Depreciation Method">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlDesc" runat="server" ToolTip="Depreciation Method" CssClass="md-form-control form-control">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CTR" Visible="false">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtCTR" runat="server" Width="90px" onkeypress="fnAllowNumbersOnly(true,false,this);"
                                                                                    MaxLength="6" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtCTR"
                                                                                    FilterType="Numbers" InvalidChars=" " FilterMode="InvalidChars" Enabled="true">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PLR">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtPLR" runat="server" ToolTip="PLR" Width="90px" CssClass="md-form-control form-control login_form_content_input" onkeypress="fnAllowNumbersOnly(true,false,this);"
                                                                                    MaxLength="6"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtPLR"
                                                                                    FilterType="Numbers" InvalidChars=" " FilterMode="InvalidChars" Enabled="true">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Select">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="CbxIRR" runat="server" ToolTip="Select" />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--ROI Details -->
                            <cc1:TabPanel runat="server" HeaderText="Return on Investment(ROI)" ID="TabPanel2" Visible="false"
                                CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Return on Investment Rule (ROI)
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="50%">
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="Label12" runat="server" Text="ROI Rule Modification" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:TextBox ID="txtPro" runat="server" Style="display: none">
                                                </asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                                                    ErrorMessage="Define ROI modification rule - ROI Rule Tab" ControlToValidate="txtPro"></asp:RequiredFieldValidator>
                                                <asp:GridView ID="gvProgram" runat="server" CssClass="styleInfoLabel" Width="100%"
                                                    AutoGenerateColumns="False" DataKeyNames="Program_ID" OnRowDataBound="gvProgram_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProgramid" runat="server" Text='<%# Eval("Program_ID") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Program Ref. No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProgramRefNo" runat="server" Text='<%# Eval("Program_Ref_No") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Program Description">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProgramName" runat="server" Text='<%# Eval("Program_Name") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Capture">
                                                            <ItemTemplate>
                                                                <asp:CheckBox runat="server" ID="CbxProgram" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--Currency Details -->
                            <cc1:TabPanel runat="server" HeaderText="Currency" ID="TabPanel3" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Currency Round Off
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="Panel2" Width="100%" GroupingText="Currency Round Off" CssClass="stylePanel">
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAmount" runat="server" MaxLength="4" Style="text-align: right" ToolTip="Amount"
                                                            onkeypress="fnAllowNumbersOnly(false,false,this)" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtAmount"
                                                            FilterType="Numbers" InvalidChars="" Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblAmount" runat="server" Text="Amount" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvAmount" runat="server" Display="Dynamic" ValidationGroup="Save" ErrorMessage="Enter the amount - Currency Round Off Tab"
                                                                ControlToValidate="txtAmount"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--Application Details -->
                            <cc1:TabPanel runat="server" HeaderText="Application" ID="TabPanel4" CssClass="tabpan" Visible="false"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Application Approval
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="50%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblAccount" runat="server" Text="Create Account on Application Approval"
                                                    CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:DropDownList ID="ddlAccount" runat="server" Width="105px">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvAccount" runat="server" Display="None" ErrorMessage="Define Account creation rule - Application Approval Tab"
                                                    ControlToValidate="ddlAccount" InitialValue="-1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr style="height: 10px">
                                            <td></td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Application" ID="TabPanel5" CssClass="tabpan"
                                BackColor="Red" Width="100%">
                                <HeaderTemplate>
                                    General
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="Panel3" Height="350px" GroupingText="General" CssClass="stylePanel">
                                        <div class="grid">
                                            <asp:GridView ID="gvGeneral" runat="server" Width="100%"
                                                AutoGenerateColumns="False" OnRowDataBound="gvGeneral_RowDataBound" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="LOB_ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLOBID" runat="server" Text='<%# Eval("LOB_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Line of Business">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLineOfBusiness" runat="server" Text='<%# Eval("LOB") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Receipt Mode">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLOOKUP_CODE" runat="server" Text='<%# Eval("LOOKUP_CODE") %>' Visible="false" />
                                                            <asp:Label ID="lblLOOKUP_DESCRIPTION" runat="server" Text='<%# Eval("LOOKUP_DESCRIPTION") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cashier Account">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddlCashierAc" runat="server" ToolTip="Cashier Account" CssClass="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--Depreciation Rate Details -->
                            <cc1:TabPanel runat="server" HeaderText="Depreciation Rate Details" ID="tabDepreciationRateDetails"
                                CssClass="tabpan" BackColor="Red" Width="100%">
                                <HeaderTemplate>
                                    Depreciation Rate Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="Panel4" Width="100%" GroupingText="Depreciation Rate Details" CssClass="stylePanel">
                                        <div>
                                            <div class="row">
                                                <div class="col">
                                                    <div style="height: 300px; width: 75%; overflow-x: auto; overflow-y: auto;">
                                                        <div class="grid">
                                                            <asp:GridView ID="grvDepreciationRate" runat="server" AutoGenerateColumns="False" BorderColor="Gray"
                                                                Width="100%" OnRowDataBound="grvDepreciationRate_RowDataBound" OnRowCommand="grvDepreciationRate_RowCommand" DataKeyNames="ASSETCATG_DEP_ID" CssClass="styleInfoLabel" class="gird_details" ShowFooter="true">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                            <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Asset Category" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("ASSET_CATEGORY_ID") %>' Visible="false" />
                                                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("ASSET_CATEGORY_DESC") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlAssetCategory" MaxLength="40" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                    ToolTip="Asset Category">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvAssetCategory" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select the Asset Category" Display="Dynamic" SetFocusOnError="true" InitialValue="0" ControlToValidate="ddlAssetCategory"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <FooterStyle VerticalAlign="Middle" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Rate" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="htxtRate" runat="server" Text='<%# Eval("BOOK_DEPRECIATION_RATE") %>' OnTextChanged="htxtRate_TextChanged" AutoPostBack="true" ToolTip="Rate"
                                                                                    MaxLength="6" Style="text-align: right" CssClass="md-form-control form-control login_form_content_input" onkeypress="fnAllowNumbersOnly(true,false,this);"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="htxtRate"
                                                                                    FilterType="Numbers" InvalidChars="-" FilterMode="InvalidChars" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvhtxtRate" runat="server" ValidationGroup="Save" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter the Rate" Display="Dynamic" SetFocusOnError="true" ControlToValidate="htxtRate"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtRate" runat="server" ToolTip="Rate"
                                                                                    MaxLength="6" Style="text-align: right" CssClass="md-form-control form-control login_form_content_input" OnTextChanged="txtRate_TextChanged" AutoPostBack="true" onkeypress="fnAllowNumbersOnly(true,false,this);"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtRate"
                                                                                    FilterType="Numbers" InvalidChars="-" FilterMode="InvalidChars" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtRate" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter the Rate" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtRate"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Start Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFromDate" Visible="true" runat="server" Text='<% #Bind("EFFECCTIVE_FROM")%>'>
                                                                            </asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFFromDate" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtFFromDate_TextChanged" runat="server"
                                                                                    ToolTip="Start Date"></asp:TextBox>
                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFFromDate"
                                                                                    ID="CEFFromDate" Enabled="True">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtFFromDate" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter the Start Date" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtFFromDate"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="End Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblToDate" Visible="true" runat="server" Text='<% #Bind("EFFECCTIVE_TO")%>'>
                                                                            </asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFToDate" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_true" runat="server" OnTextChanged="txtFToDate_TextChanged"
                                                                                    ToolTip="End Date"></asp:TextBox>
                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFToDate"
                                                                                    ID="CEFToDate" Enabled="True">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtFToDate" runat="server" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter the End Date" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtFToDate"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CausesValidation="false" OnClick="RemoveRow"
                                                                                ToolTip="Remove,Alt+R" AccessKey="R" CssClass="grid_btn_delete" OnClientClick="return confirm('Are you sure you want to remove this Depreciation Rate Details?');" />
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
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                        <input id="hdnGlobalParamId" type="hidden" runat="server" value="0" />
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%--<tr>
                    <td align="center">
                        <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" Text="Save" AccessKey="S" ToolTip="Save,Alt+S"
                            OnClientClick="return fnCheckPageValidators();" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" Text="Clear" AccessKey="L" ToolTip="Clear,Alt+L"
                            CausesValidation="False" OnClick="btnClear_Click" />
                        <cc1:ConfirmButtonExtender ID="btnAssetClear_ConfirmButtonExtender" runat="server"
                            ConfirmText="Do you want to Clear?" Enabled="True" TargetControlID="btnClear">
                        </cc1:ConfirmButtonExtender>
                        <asp:Button runat="server" ID="btnCancel" CssClass="styleSubmitButton" CausesValidation="False" OnClick="btnCancel_Click"
                            Text="Exit" AccessKey="X" ToolTip="Exit,Alt+X" OnClientClick="parent.RemoveTab();" />
                    </td>
                </tr>--%>
                <div class="row" style="display: none;">
                    <div class="col">
                        <asp:ValidationSummary ID="vsGlobal" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowMessageBox="false" ShowSummary="false" />
                        <asp:CustomValidator ID="cvGlobal" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: medium"></asp:Label>
                        <input id="hdnUserId" type="hidden" runat="server" value="0" />
                        <input id="hdnUserLevelId" type="hidden" runat="server" value="0" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
