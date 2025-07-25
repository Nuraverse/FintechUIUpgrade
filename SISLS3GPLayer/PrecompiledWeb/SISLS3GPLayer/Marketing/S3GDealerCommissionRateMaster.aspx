<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GDealerCommissionRateMaster, App_Web_ru52obyl" title="Day Open Close" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
       <%-- function fnLoadCustomer_Pro() {
            document.getElementById("<%= btnCreateCustomer.ClientID %>").click();--%>

        // }
        function fnLoadDealer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadDealer').click();
        }

        function fnTrashCommonSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucDealerLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucDealerLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=ucDealerLov.ClientID %>').value = "";


                }
            }
        }

        function fnTrashSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

        //Added on 22-Jun-2019 Starts Here

        function fnSelectAllCons(chkSelectAll, chkCons)        //
        {
            var gvCons = document.getElementById('<%=GrvConstitution.ClientID%>');
            var TargetChildControl = chkCons;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvCons.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = chkSelectAll.checked;
        }

        function fnSelectCons(chkCons) {
            fnChkIsAllConsSelected(chkCons);
        }

        function fnChkIsAllConsSelected(chkSelect) {
            var gv = document.getElementById('<%= GrvConstitution.ClientID%>');
            var chk = document.getElementById('ctl00_ContentPlaceHolder1_GrvConstitution_ctl01_cbxSelectAll');

            if (chkSelect.checked == false) {
                chk.checked = false;
            }
            else {
                var gvRwCnt = gv.rows.length - 1;
                var ChcCnt = 0;
                for (var i = 0; i < gv.rows.length; ++i) {
                    var Inputs = gv.rows[i].getElementsByTagName("input");
                    for (var n = 0; n < Inputs.length; ++n) {
                        if (Inputs[n].type == 'checkbox') {
                            if (Inputs[n].checked == true)
                                ++ChcCnt;
                        }
                    }
                }
                if (ChcCnt == gvRwCnt)
                    chk.checked = true;
                else
                    chk.checked = false;
            }
        }

        function fnSelectAllTCS(chkSelectAll, chkCons)        //
        {
            var gvCons = document.getElementById('<%=grvTCSMP.ClientID%>');
            var TargetChildControl = chkCons;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvCons.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = chkSelectAll.checked;
        }

        function fnSelectTCS(chkCons) {
            fnChkIsAllTCSSelected(chkCons);
        }

        function fnChkIsAllTCSSelected(chkSelect) {
            var gv = document.getElementById('<%= grvTCSMP.ClientID%>');
            var chk = document.getElementById('ctl00_ContentPlaceHolder1_grvTCSMP_ctl01_cbxSelectAll1');

            if (chkSelect.checked == false) {
                chk.checked = false;
            }
            else {
                var gvRwCnt = gv.rows.length - 1;
                var ChcCnt = 0;
                for (var i = 0; i < gv.rows.length; ++i) {
                    var Inputs = gv.rows[i].getElementsByTagName("input");
                    for (var n = 0; n < Inputs.length; ++n) {
                        if (Inputs[n].type == 'checkbox') {
                            if (Inputs[n].checked == true)
                                ++ChcCnt;
                        }
                    }
                }
                if (ChcCnt == gvRwCnt)
                    chk.checked = true;
                else
                    chk.checked = false;
            }
        }

        //Added on 22-Jun-2019 Ends Here


    </script>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
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
                        <asp:Panel ID="pnlDealerCommissionRate" runat="server" CssClass="stylePanel" GroupingText="Rate Details"
                            Width="98%">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucDealerLov" onblur="fnLoadDealer()" runat="server" IsMandatory="true" AutoPostBack="true" ToolTip="Dealer Code/Name" ShowHideAddressImageButton="false" ErrorMessage="Enter the Dealer Code/Name" OnItem_Selected="ucAccountLov_Item_Selected"
                                            strLOV_Code="ENT_DEAL_GEN" ServiceMethod="GetDealerList" />
                                        <asp:Button ID="btnLoadDealer" runat="server" Text="Dealer Code/Name" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadDealerr_Click"
                                            Style="display: none" />
                                        <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                        <asp:HiddenField ID="hdnentity" runat="server" />
                                        <asp:HiddenField ID="hdnPANum_Customer_ID" runat="server" />
                                        <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                        <asp:HiddenField ID="hdndefaultdate" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Dealer Code/Name" ID="lblDealerCode" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtRateType" ToolTip="Dealer Commission Description" MaxLength="100" class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvtxtRateType" runat="server" ControlToValidate="txtRateType"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="True"
                                                ErrorMessage="Enter the Dealer Commission Description"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Dealer Commission Description" ID="lblRateType" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkActive" runat="server" Enabled="false" Checked="true" ToolTip="Active" />
                                        <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Constitution/TCSMP/Contract Type Details"
                            Width="98%">
                            <div class="row">
                                <div class="col-md-4">
                                    <%--<asp:Panel ID="Panel3" ScrollBars="None" runat="server" CssClass="stylePanel" GroupingText="Constitution">--%>
                                    <asp:Panel ID="pnlGrvConstitution" ScrollBars="None" runat="server" CssClass="stylePanel" Height="150px" GroupingText="Constitution">
                                        <div class="gird">
                                            <asp:GridView ID="GrvConstitution" runat="server" AutoGenerateColumns="False" OnRowDataBound="GrvConstitution_RowDataBound" ShowFooter="false" Width="100%" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo0" runat="server" Text="<%#Container.DataItemIndex + 1%>" ToolTip="S.No"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Constitution" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblConstitution" runat="server" Text='<%#Eval("CONSTITUTIONNAME")%>' ToolTip="Constitution"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Constitution_ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblConstitution_Id" runat="server" Text='<%#Eval("CONSTITUTION_ID")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="cbxSelectAll" runat="server" Text="Select" TextAlign="Right" OnClick="javascript:fnSelectAllCons(this,'chkSelect0');"
                                                                ToolTip="Select All" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect0" runat="server" OnCheckedChanged="chkSelect0_CheckedChanged" ToolTip="Select" OnClick="javascript:fnSelectCons(this);" />
                                                            <asp:Label ID="lblChked0" runat="server" Text='<%#Eval("Checked")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                    <%--</asp:Panel>--%>
                                </div>

                                <div class="col-md-4">
                                    <%--<asp:Panel ID="Panel2" ScrollBars="None" runat="server" CssClass="stylePanel" GroupingText="TCSMP">--%>
                                    <asp:Panel ID="pnlTCSMP" ScrollBars="None" Height="150px" runat="server" CssClass="stylePanel" GroupingText="TCSMP">
                                        <div class="gird">
                                            <asp:GridView ID="grvTCSMP" runat="server" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grvTCSMP_RowDataBound" ShowFooter="false" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo1" runat="server" ToolTip="S.No" Text="<%#Container.DataItemIndex + 1%>"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="TCSMP Description" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTCSMPDESC" runat="server" ToolTip="TCSMP Description" Text='<%#Eval("TCSMP_DESC")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="TCSMP_ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTCSMPID" runat="server" Text='<%#Eval("TCSMP_ID")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="cbxSelectAll1" runat="server" Text="Select" TextAlign="Right" OnClick="javascript:fnSelectAllTCS(this,'chkSelect1');"
                                                                ToolTip="Select All" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect1" runat="server" OnCheckedChanged="chkSelect1_CheckedChanged" ToolTip="Select" OnClick="javascript:fnSelectTCS(this);" />
                                                            <asp:Label ID="lblChked1" runat="server" Text='<%#Eval("Checked")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                    <%--</asp:Panel>--%>
                                </div>

                                <div class="gird col-md-4">
                                    <%--<asp:Panel ID="Panel4" ScrollBars="None" runat="server" CssClass="stylePanel" GroupingText="Contract Type">--%>
                                    <asp:Panel ID="pnlContractType" ScrollBars="None" runat="server" CssClass="stylePanel" GroupingText="Contract Type">
                                        <div class="gird">
                                            <asp:GridView ID="grvContractType" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvContractType_RowDataBound" ShowFooter="false" Width="100%" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo" runat="server" Text="<%#Container.DataItemIndex + 1%>" ToolTip="S.No"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contract Type" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblContractType" runat="server" Text='<%#Eval("Contract_Type")%>' ToolTip="Contract Type"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ContractType" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblContract_Type_Id" runat="server" Text='<%#Eval("Contract_Type_Id")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect" runat="server" OnCheckedChanged="chkSelect_CheckedChanged" AutoPostBack="true" ToolTip="Select" />
                                                            <asp:Label ID="lblChked" runat="server" Text='<%#Eval("Checked")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                    <%--</asp:Panel>--%>
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>



                <%--Gridview for Days--%>
                <%--         <div class="row">
                     <div class="gird col-md-12">--%>
                <asp:Panel ID="PNLDays" runat="server" CssClass="stylePanel" GroupingText="Dealer Commission Rate">
                    <div class="gird">
                        <asp:GridView runat="server" ID="GRDealerCommisionRate" AutoGenerateColumns="False" ShowFooter="true"
                            OnRowDeleting="GRDealerCommisionRate_RowDeleting" OnRowCommand="GRDealerCommisionRate_RowCommand1"
                            EmptyDataText="No Records Found" OnRowCreated="GRDealerCommisionRate_RowCreated"
                            OnRowDataBound="GRDealerCommisionRate_RowDataBound"
                            class="gird_details">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsno" runat="server" Text='<%#Container.DataItemIndex+1  %>' ToolTip="Sl.No."></asp:Label>
                                        <asp:Label ID="lblSnumber" runat="server" Text='<%# Bind("Sno") %>' Width="10px" Visible="false"></asp:Label>
                                        <asp:Label ID="lblDEALER_COMM_RATE_ID" runat="server" Text='<%# Bind("Dealer_Comm_Rate_Id") %>' Width="10px" Visible="false"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rate Type">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("RateAmount")%>' ID="lblRateAmount" Width="150px" ToolTip="Rate Type"
                                            Visible="false"></asp:Label>
                                        <asp:Label runat="server" Text='<%#Eval("RateAmountDesc")%>' ID="lblRateAmountDesc" ToolTip="Rate Type"
                                            Visible="true"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlRateAmountF" runat="server" class="md-form-control form-control" Width="120px" ToolTip="Rate Type" OnSelectedIndexChanged="ddlRateAmountF_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Rate"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="Amount"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlRateAmountF" runat="server" ControlToValidate="ddlRateAmountF" InitialValue="0"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Select the Rate Type"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="hdnRateAmountF" runat="server" Value='<%#Eval("RateAmount") %>' />
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rate/Amount">
                                    <ItemTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtRateH" runat="server" Style="text-align: right;" Width="120px" Text='<%# Bind("Rate")%>' OnTextChanged="txtOnChange_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Rate/Amount"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTEtxtRateH" runat="server" TargetControlID="txtRateH"
                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtRateH" runat="server" ControlToValidate="txtRateH"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Rate/Amount"></asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="rvtxtRateH" runat="server" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="Add"
                                                    ControlToValidate="txtRateH" Visible="false" MaximumValue="100" SetFocusOnError="true"
                                                    MinimumValue="0" ErrorMessage="Should not exceed 100%"></asp:RangeValidator>
                                            </div>
                                        </div>
                                        <%--<asp:Label ID="lblRate" runat="server" Text='<%# Bind("Rate")%>'></asp:Label>--%>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtRateF" runat="server" Style="text-align: right;" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Rate/Amount"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTEtxtRateF" runat="server" TargetControlID="txtRateF"
                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtRateF" runat="server" ControlToValidate="txtRateF"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Rate/Amount"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="grid_validation_msg_box">
                                                <asp:RangeValidator ID="rvtxtRate" runat="server" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="Add"
                                                    ControlToValidate="txtRateF" Visible="false" MaximumValue="100"
                                                    MinimumValue="0" ErrorMessage="Should not exceed 100%"></asp:RangeValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount From">
                                    <ItemTemplate>
                                        <%-- <div class="md-input">
                                            <asp:TextBox ID="txtAmountFromH" runat="server" Style="text-align: right;" Text='<%# Bind("AmountFrom")%>' class="md-form-control form-control login_form_content_input requires_true" ToolTip="Amount From"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTEtxtAmountFromH" runat="server" TargetControlID="txtAmountFromH"
                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFTEtxtAmountFromH" runat="server" ControlToValidate="txtAmountFromH"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Amount From"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>--%>
                                        <asp:Label ID="lblAmountFrom" runat="server" Text='<%# Bind("AmountFrom")%>' Style="text-align: right;"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAmountFromF" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Amount From"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTEtxtAmountFromF" runat="server" TargetControlID="txtAmountFromF"
                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtAmountFromF" runat="server" ControlToValidate="txtAmountFromF"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Amount From"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount To">
                                    <ItemTemplate>
                                        <%--<div class="md-input">
                                            <asp:TextBox ID="txtAmountToH" runat="server" Text='<%# Bind("AmountTo")%>' Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Amount To"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTEtxtAmountToF" runat="server" TargetControlID="txtAmountToH"
                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtAmountToH" runat="server" ControlToValidate="txtAmountToH"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Amount To"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>--%>
                                        <asp:Label ID="lblAmountTo" runat="server" Text='<%# Bind("AmountTo")%>' Style="text-align: right;"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAmountToF" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Amount To"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTEtxtAmountToF" runat="server" TargetControlID="txtAmountToF"
                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtAmountToF" runat="server" ControlToValidate="txtAmountToF"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Amount To"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Date">
                                    <ItemTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDateH" Text='<%# Bind("StartDate")%>' runat="server" Style="text-align: left;" OnTextChanged="txtOnChange_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Start Date"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderHEffectiveFromDate" runat="server" Enabled="True"
                                                TargetControlID="txtStartDateH">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtStartDateH" runat="server" ControlToValidate="txtStartDateH"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Start Date"></asp:RequiredFieldValidator>
                                            </div>--%>
                                        </div>
                                        <%-- <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("StartDate")%>' Style="text-align: right;"></asp:Label>--%>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDateF" runat="server" Style="text-align: left;" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Start Date"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderEffectiveFromDate" runat="server" Enabled="True"
                                                TargetControlID="txtStartDateF">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtStartDateF" runat="server" ControlToValidate="txtStartDateF"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Start Date"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Date">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtEndDateH" Text='<%# Bind("EndDate")%>' runat="server" Style="text-align: left;" OnTextChanged="txtEndDateH_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" ToolTip="End Date"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtenderHffectiveToDate" runat="server" Enabled="True"
                                            TargetControlID="txtEndDateH">
                                        </cc1:CalendarExtender>
                                        <asp:HiddenField ID="isdeleterecords" runat="server" Value='<%# Bind("RECORDCOUNT")%>' />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <%-- <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvtxtEndDateH" runat="server" ControlToValidate="txtEndDateH"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="True"
                                                ErrorMessage="Enter the End Date"></asp:RequiredFieldValidator>
                                        </div>--%>

                                        <%--<asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("EndDate")%>' Style="text-align: right;"></asp:Label>--%>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDateF" runat="server" Style="text-align: left;" class="md-form-control form-control login_form_content_input requires_true" ToolTip="End Date"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderEffectiveToDate" runat="server" Enabled="True"
                                                TargetControlID="txtEndDateF">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="grid_validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtEndDateF" runat="server" ControlToValidate="txtEndDateF"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                    ErrorMessage="Enter the End Date"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:Button ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn_delete" AccessKey="T" ToolTip="Delete, Alt+T" OnClientClick="return confirm('Do you want to delete this record?');" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="btnAdd" Text="Add" CommandName="ADDNEW" ToolTip="Add, Alt+A" ValidationGroup="Add" AccessKey="A" runat="server" CssClass="grid_btn" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
                <%--             </div>
                </div>--%>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" runat="server" onserverclick="btnSave_Click"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                        onserverclick="btnClear_Click"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>


                <%--                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row" style="float: right; margin-top: 5px;">
                            <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                <asp:Button runat="server" ID="btnSave" AccessKey="S" OnClientClick="return fnCheckPageValidators('Save');"
                                    CssClass="save_btn fa fa-floppy-o" Text="Save" ValidationGroup="Save" CausesValidation="false" OnClick="btnSave_Click"
                                    ToolTip="Alt+S,Save" />
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                                <asp:Button runat="server" ID="btnClear" AccessKey="L" CausesValidation="false" CssClass="save_btn fa fa-floppy-o"
                                    Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                                    ToolTip="Alt+L,Clear" />
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                <asp:Button runat="server" ID="btnCancel" Text="Exit" AccessKey="X" ValidationGroup="PRDDC"
                                    CausesValidation="false" CssClass="save_btn fa fa-floppy-o" OnClick="btnCancel_Click" OnClientClick="return fnConfirmExit();"
                                    ToolTip="Alt+X,Exit" />
                            </div>
                        </div>
                    </div>
                </div>--%>

                <div class="row">
                    <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                        Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                        ShowSummary="false" ValidationGroup="VGBuck" />
                </div>
                <div class="row">
                    <asp:CustomValidator ID="CVBucketParameter" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" Width="98%" />
                </div>
                <div class="row">
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

