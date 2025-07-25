<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnDemandProcessingSpool, App_Web_x5tdsxrh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        
        function fnSelectBucketAll(chkSelectAllBranch, chkSelectBranch) {
            var gvbucketWise = document.getElementById('ctl00_ContentPlaceHolder1_GRVbucket');
            var TargetChildControl = chkSelectBranch;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvbucketWise.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                Inputs[n].checked = chkSelectAllBranch.checked;
        } 
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Demand Processing Spooling" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Demand Type">
                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                <tr>
                                   <td class="styleFieldLabel" width="20%">
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="30%">
                                        <asp:DropDownList ID="ddlLOB" runat="server" Visible="true" Width="60%" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td> 
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="20%">
                                        <asp:Label runat="server" Text="Demand Month" ID="lblDemandMonth" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" align="left">
                                        <asp:DropDownList ID="ddlDemandMonth" runat="server" Visible="true" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlDemandMonth_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDemandMonth" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlDemandMonth" InitialValue="0" ErrorMessage="Select a Demand Month" Display="None"
                                            ValidationGroup="Excel"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="styleMandatoryLabel"
                                            runat="server" ControlToValidate="ddlDemandMonth" ErrorMessage="Select a Demand Month"
                                            Display="None" ValidationGroup="Spool" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel" width="20%">
                                        <asp:Label runat="server" Text="Location" ID="lblBranch" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="30%">
                                        <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" AutoPostBack="True"
                                        OnItem_Selected="ddlBranch_SelectedIndexChanged" IsMandatory="true" ErrorMessage="Select a Location" ValidationGroup="Spool"  
                                            ServiceMethod="GetBranchList" WatermarkText="--Select--" />
                                       <%-- <asp:RequiredFieldValidator ID="rfvBranch" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlBranch" InitialValue="0" ErrorMessage="Select a Location"
                                            Display="None" ValidationGroup="Excel"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="styleMandatoryLabel"
                                            runat="server" ControlToValidate="ddlBranch" InitialValue="0" ErrorMessage="Select a Location"
                                            Display="None" ValidationGroup="Spool"></asp:RequiredFieldValidator>--%>
                                        <%--<asp:RequiredFieldValidator ID="rfvBranch" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlBranch" InitialValue="0" ErrorMessage="Select Branch" Display="None"
                                            ValidationGroup="Excel"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="20%">
                                        <asp:Label runat="server" Text="Debt Collector" ID="lblDebtCollector">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" align="left" width="30%">
                                        <asp:CheckBox ID="chkDebtCollector" runat="server" Checked="false" AutoPostBack="true"
                                            OnCheckedChanged="chkDebtCollector_CheckedChanged" />
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="styleMandatoryLabel" runat="server"
                                        ControlToValidate="ddlBranch" InitialValue="0" ErrorMessage="Select Branch"
                                        Display="None" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel" width="20%">
                                        <asp:Label runat="server" Text="Debt Collector Code" ID="lblDCCode" CssClass="">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" align="left" width="30%">
                                        <asp:DropDownList ID="ddlDCCode" runat="server" Enabled="false" Width="60%" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlDCCode_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDCCode" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlDCCode" ErrorMessage="Select Debt Collector Code" Display="None"
                                            ValidationGroup="Excel" Enabled="false" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8px">
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="PnlBuckets" runat="server" CssClass="stylePanel" GroupingText="Bucket Selection Criteria">
                <asp:GridView ID="GRVbucket" runat="server" AutoGenerateColumns="False" ToolTip="Days"
                    Width="65%">
                    <Columns>
                        <%--buckets--%>
                        <asp:TemplateField HeaderText="Buckets">
                            <ItemTemplate>
                                <asp:Label ID="lblbucket" runat="server" Text='<%# Bind("Bucket")  %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--From Days--%>
                        <asp:TemplateField HeaderText="From(Months)">
                            <ItemTemplate>
                                <asp:Label ID="lblFromDays" runat="server" MaxLength="3" Text='<%# Bind("Bucket_From")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--To days--%>
                        <asp:TemplateField HeaderText="To(Months)">
                            <ItemTemplate>
                                <asp:Label ID="lblToDays" runat="server" MaxLength="3" Text='<%# Bind("Bucket_To")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Select NO OF DAYS CHKBOX--%>
                        <asp:TemplateField HeaderText="Select">
                            <HeaderTemplate>
                                <asp:CheckBox ID="ChkSelectAllBuckets" runat="server" Checked="true" onclick="fnSelectBucketAll(this,'ChkSelect');" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ChkSelect" runat="server" Checked="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Spooling options">
                <table width="100%">
                    <tr>
                        <td width="50%">
                            <table>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Record spooled on basis of" ID="lblBasic">
                                        </asp:Label>
                                       </td>
                                    </tr>
                                <tr>
                                    <td height="2px"></td>

                                </tr>
                                <tr>
                                    <td class="styleFieldAlign">
                                        <asp:RadioButtonList ID="rbtlSpoolBasis" runat="server" AutoPostBack="true" class="styleFieldLabel" OnSelectedIndexChanged="rbtlSpoolBasis_SelectedIndexChanged" RepeatDirection="Vertical">
                                            <%--<asp:ListItem Text="Customer" Value="0"></asp:ListItem>--%>
                                            <asp:ListItem Selected="True" Text="Account Number Level" Value="1"></asp:ListItem>
                                            <%--<asp:ListItem Text="Expanded" Value="2"></asp:ListItem>--%>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldAlign">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td width="50%">
                            <asp:GridView ID="grvDemandProcessSpool" runat="server" AutoGenerateColumns="false"
                                FooterStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center"
                                ShowFooter="true" Width="100%">
                                <RowStyle HorizontalAlign="Center" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Category Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategory" runat="server" MaxLength="3" Text='<%# Bind("CategoryType") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="80%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category TypeID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategoryID" runat="server" MaxLength="3" Text='<%# Bind("CategoryTypeID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkCategory" runat="server" AutoPostBack="True" OnCheckedChanged="chkCategory_CheckedChanged" Checked="true" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="5%" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="styleGridHeader" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table width="100%">
                <tr>
                    <td style="display:none">
                        <asp:GridView ID="grvSpoolFile" runat="server" Width="100%" AutoGenerateColumns="true"
                            FooterStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader" ShowFooter="false"
                            Visible="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table width="100%">
        <tr class="styleButtonArea" style="padding-left: 4px">
            <td align="center">

                        <asp:Button ID="btnSFLFormat" runat="server" CausesValidation="true" CssClass="styleSubmitButton" AccessKey="E" ToolTip="Excel,Alt+E"
                            Text="Excel" ValidationGroup="Excel" OnClick="btnSFLFormat_Click" />
                        <asp:Button ID="btnExcel" runat="server" CausesValidation="true" CssClass="styleSubmitButton" AccessKey="E" ToolTip="Excel,Alt+E"
                            Text="Excel" ValidationGroup="Excel" OnClick="btnExcel_Click" 
                            OnClientClick="return fnCheckPageValidators('Excel',false)" Visible="false" />
                        &nbsp;<asp:Button ID="btnFlatFile" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                            Text="Flat File" OnClientClick="return fnCheckPageValidators('Excel',false)" AccessKey="F" ToolTip="Flat File,Alt+F"
                            OnClick="btnFlatFile_Click" Visible="false" />
                            <asp:Button ID="btnSFLFlatFile" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                            Text="Flat File"  AccessKey="F" ToolTip="Flat File,Alt+F"
                            OnClick="btnSFLFlatFile_Click" />
                        &nbsp;<asp:Button ID="btnEmail" runat="server" Visible="false" CausesValidation="true" CssClass="styleSubmitButton"
                            Text="Email to DC" OnClientClick="return fnCheckPageValidators('Excel',false)" AccessKey="M" ToolTip="Email to DC,Alt+M"
                            OnClick="btnEmail_Click" />
                        <asp:Button ID="btnSpool" runat="server" CausesValidation="true" CssClass="styleSubmitButton" AccessKey="D" ToolTip="Demand Report,Alt+D"
                            Text="Demand Report" ValidationGroup="Spool" OnClick="btnSpool_Click" Visible="false"/><br />
                    
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                    <ContentTemplate>
                        <asp:CustomValidator ID="CVDemandProcessingSpool" runat="server" Display="None" ValidationGroup="Save"></asp:CustomValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr class="styleButtonArea">
            <td>
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <asp:ValidationSummary ID="vsDemandProcessSpool" runat="server" CssClass="styleSummaryStyle"
                            HeaderText="Correct the following validation(s):" Height="250px" ShowMessageBox="false"
                            ShowSummary="true" Width="500px" ValidationGroup="Excel" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleSummaryStyle"
                            HeaderText="Correct the following validation(s):" Height="250px" ShowMessageBox="false"
                            ShowSummary="true" Width="500px" ValidationGroup="Spool" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
