<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="UnderWriting_S3GORGUnderWritingApproval, App_Web_sq2fmotj" enableeventvalidation="false" %>

<%@ MasterType VirtualPath="~/Common/S3GMasterPageCollapse.master" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="ucust" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function FunSaveMsg() {
            //debugger;
            if (confirm('Are you sure want to save?')) {
                return true;
            }
            else
                return false;
        }
    </script>
    <asp:UpdatePanel ID="updMainPage" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" Text="Underwriting Approval" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <%--Spacer--%>
                <tr>
                    <td height="5px"></td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlSearch" runat="server" GroupingText="Search" CssClass="stylePanel"
                                        EnableTheming="true">
                                        <table width="100%">
                                            <tr>
                                                <td class="styleFieldLabel" colspan="2">Status
                                                </td>

                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" colspan="2">
                                                    <asp:RadioButton ID="RBAll" runat="server" GroupName="CreditParameters" OnCheckedChanged="RBAll_CheckedChanged"
                                                        Text="All" />
                                                    <asp:RadioButton ID="RBUnapproved" runat="server" GroupName="CreditParameters" OnCheckedChanged="RBUnapproved_CheckedChanged"
                                                        Text="Unapproved" Checked="True" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" align="center">
                                                        <tr align="center">
                                                            <td class="styleFieldLabel">Location
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <uc2:Suggest ID="txtLocation" runat="server" ServiceMethod="GetLocationnameList" AutoPostBack="true"
                                                                    OnItem_Selected="txtLocation_SelectedIndexChanged" ErrorMessage="Select User Name"
                                                                    IsMandatory="false" Width="120px" />
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblDocumentType" runat="server" CssClass="styleDisplayLabel" Text="Reference Number"> </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlDocumentType" runat="server" ToolTip="Reference Number" OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvModify" runat="server" Display="None" ErrorMessage="Select Reference Number"
                                                                    ControlToValidate="ddlDocumentType" ValidationGroup="vsGlobal" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </td>
                                                <td width="20%" align="left" valign="middle">
                                                    <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitShortButton"
                                                        OnClick="btnGo_Click" TabIndex="0" Text="Go" ValidationGroup="vsGlobal" />

                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:ValidationSummary ID="vsGlobal" runat="server" CssClass="styleMandatoryLabel"
                                                        HeaderText="Correct the following validation(s):  " ValidationGroup="vsGlobal" />
                                                    <asp:CustomValidator ID="cvGlobal" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <%--go button column--%>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <cc1:TabContainer ID="tcCPA" Visible="false" runat="server" Width="100%" CssClass="styleTabPanel"
                                        ActiveTabIndex="0">
                                        <cc1:TabPanel TabIndex="1" runat="server" ID="TPABEN" CssClass="tabpan" BackColor="Red"
                                            Width="100%" HeaderText="Approval">
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <asp:Panel ID="Panel_Tap" runat="server" GroupingText="Sanction Details" CssClass="stylePanel">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td style="width: 20%">
                                                                                    <asp:Label runat="server" Text="Approval for" ID="lblApprovalFor" CssClass="styleDisplayLabel" />
                                                                                </td>
                                                                                <td style="width: 30%">
                                                                                    <asp:TextBox Text="Enquiry" ReadOnly="True" ID="txtApprovalFor" runat="server" Width="70px"></asp:TextBox>
                                                                                </td>
                                                                                <td style="width: 20%"></td>
                                                                                <td style="width: 22%">
                                                                                    <asp:TextBox ID="txtReqApprovals" runat="server" Width="5px" Visible="False"></asp:TextBox>
                                                                                    <asp:TextBox ID="txtReqApprovalDone" runat="server" Width="5px" Visible="False"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 20%">
                                                                                    <asp:Label runat="server" Text="Sanction Number" ID="lblSanctionNumber" CssClass="styleDisplayLabel" />
                                                                                </td>
                                                                                <td style="width: 30%">
                                                                                    <asp:TextBox ReadOnly="True" ID="txtSanctionNumber" runat="server" Width="160px"></asp:TextBox>
                                                                                </td>
                                                                                <td style="width: 20%">
                                                                                    <asp:Label runat="server" Text="Sanction Date" ID="lblSanctionDate" CssClass="styleDisplayLabel" />
                                                                                </td>
                                                                                <td width="30%">
                                                                                    <asp:TextBox ReadOnly="True" ID="txtSanctionDate" runat="server" Width="80px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 50%;" valign="top">
                                                                    <asp:Panel ID="pnlCustomerInformation" Visible="false" GroupingText="Customer Information" runat="server"
                                                                        CssClass="stylePanel">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <ucust:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" FirstColumnStyle="styleFieldLabel" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                                <td style="width: 50%;" valign="top">
                                                                    <asp:Panel ID="pnlDocumentDetails" Visible="false" GroupingText="Document Details" runat="server" CssClass="stylePanel">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label runat="server" Text="Line of Business" ID="Label2" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtlob" runat="server" ReadOnly="True" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label runat="server" Text="Product" ID="Lblproduct" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtproduct" runat="server" ReadOnly="True" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="Label3" runat="server" CssClass="styleDisplayLabel" Text="Constitution"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtConstitution" runat="server" ReadOnly="True" Style="margin-left: 2px" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label runat="server" Text="Transaction Ref No." ID="lblEnqNo" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtEnquiryNo" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label runat="server" Text="Under Writing Ref No." ID="lblUWTrans" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtUWTransRefNo" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label runat="server" Text="Under Writing Ref Date." ID="lblUWDate" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtUWTransRefDate" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblMsg" CssClass="styleDisplayLabel" Font-Bold="true" ForeColor="Blue" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" colspan="2">
                                                                   <%-- <asp:Panel ID="pnlApprvalDet" runat="server" GroupingText="Approval Details" CssClass="stylePanel">--%>
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td width="100%">
                                                                                    <asp:Panel ID="pnlFinalApprover" runat="server" CssClass="stylePanel" Enabled="false" GroupingText="Final Approver Details">
                                                                                        <asp:GridView ID="gvFinalApprover" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvFinalApprover_RowDataBound"
                                                                                            Width="100%">
                                                                                            <Columns>
                                                                                                <asp:TemplateField HeaderText="User Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblFinalAppName" runat="server" Text='<%#Eval("FinalAppName")%>'></asp:Label>
                                                                                                        <asp:Label ID="lblFinalAppId" runat="server" Visible="false" Text='<%#Eval("FinalAppID")%>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <HeaderStyle Width="16%" CssClass="styleGridHeader" />
                                                                                                    <ItemStyle Width="16%" HorizontalAlign="Left" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="15%">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:DropDownList ID="ddlFAction" runat="server">
                                                                                                        </asp:DropDownList>
                                                                                                        <asp:Label ID="lblFStatusId" runat="server" Text='<%#Eval("FApprovalStatusID")%>' Visible="false"></asp:Label>
                                                                                                        <asp:Label ID="lblFStatus" runat="server" Text='<%#Eval("FApprovalStatus")%>' Visible="false"></asp:Label>
                                                                                                      <%--  <asp:RequiredFieldValidator ID="rfvAction" CssClass="styleMandatoryLabel" runat="server"
                                                                                                            ControlToValidate="ddlAction" InitialValue="0" ErrorMessage="Select the Action"
                                                                                                            ValidationGroup="SaveGrp" Display="None">
                                                                                                        </asp:RequiredFieldValidator>--%>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Approval Date">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblFApprovalDate" runat="server" Text='<%# Bind("FApprovalDate")%>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <HeaderStyle Width="14%" CssClass="styleGridHeader" />
                                                                                                    <ItemStyle Width="14%" HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                                 <asp:TemplateField HeaderText="Remark">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:TextBox ID="txtFRemark" runat="server" Width="100%" Height="35px" Text='<%# Bind("FRemark") %>'
                                                                                                            ReadOnly="false" onkeyup="maxlengthfortxt(80);" onchange="maxlengthfortxt(80);"
                                                                                                            TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                                                                    </ItemTemplate>
                                                                                                    <HeaderStyle Width="38%" CssClass="styleGridHeader" />
                                                                                                    <ItemStyle HorizontalAlign="Left" Width="30%" VerticalAlign="Top" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Password">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:TextBox EnableViewState="true" ID="txtFPassword" runat="server" MaxLength="15"
                                                                                                            onfocus="this.select();" Text='<%# Bind("FPassword") %>'
                                                                                                            TextMode="Password" Width="100px"></asp:TextBox>
                                                                                                    </ItemTemplate>
                                                                                                    <HeaderStyle Width="10%" CssClass="styleGridHeader" />
                                                                                                </asp:TemplateField>
                                                                                            </Columns>
                                                                                            <RowStyle ForeColor="Blue" HorizontalAlign="Left" />
                                                                                        </asp:GridView>
                                                                                    </asp:Panel>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="100%">
                                                                                <asp:Panel ID="PnlGroupLevel" runat="server" CssClass="stylePanel" GroupingText="Group Level Approver Details">
                                                                                    <asp:Label runat="server" Text="Password" ID="lblPassword" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    &nbsp;&nbsp;&nbsp;
                                                                                    <asp:TextBox EnableViewState="true" ID="txtPassword" runat="server" MaxLength="15"
                                                                                        onfocus="this.select();" Text='<%# Bind("Password") %>'
                                                                                        TextMode="Password" Width="100px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator ID="rfvPassword" CssClass="styleMandatoryLabel"
                                                                                        runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password"
                                                                                        Display="None" InitialValue="" ValidationGroup="Submit">
                                                                                    </asp:RequiredFieldValidator>
                                                                                    <asp:GridView ID="grvGroupApr" runat="server" AutoGenerateColumns="False"
                                                                                         ShowFooter="True" DataKeyNames="GroupID" OnRowDataBound="grvGroupApr_RowDataBound"
                                                                                        Width="100%" GridLines="None" BorderWidth="0" BorderStyle="None">
                                                                                        <Columns>
                                                                                           <%-- <asp:TemplateField HeaderStyle-Width="5%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:ImageButton ID="imgShow" runat="server" OnClick="Show_Hide_AprovalGrid" ImageUrl="~/images/plus.png"
                                                                                                        CommandArgument="Show" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>--%>
                                                                                            <asp:TemplateField>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lbl_grpcode" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderStyle-Width="10%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lbl_grpname" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle Width="90%" HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                                <ItemTemplate>
                                                                                                    <tr>
                                                                                                        <td style="width: 5%"></td>
                                                                                                        <td colspan='100%'>
                                                                                                           <%-- <asp:Panel ID="pnlAprFe" runat="server" Visible="false" Style="position: relative">--%>
                                                                                                                <asp:GridView ID="gvApprovalDetails" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvApprovalDetails_RowDataBound"
                                                                                                                    Width="100%">
                                                                                                                    <Columns>
                                                                                                                        <asp:TemplateField HeaderText="Approval S.No." Visible="false">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="lblApprovalSno" runat="server" Text='<%#Eval("ApprovalSno")%>'></asp:Label>
                                                                                                                                <asp:Label ID="lblGroup_Code" Visible="false" runat="server" Text='<%#Eval("Group_Code")%>'></asp:Label>
                                                                                                                            </ItemTemplate>
                                                                                                                            <HeaderStyle Width="12%" CssClass="styleGridHeader" />
                                                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="Group Name">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="lblGroupName" runat="server" Text='<%#Eval("GroupName")%>'></asp:Label>
                                                                                                                            </ItemTemplate>
                                                                                                                            <HeaderStyle Width="16%" CssClass="styleGridHeader" />
                                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="User Name">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="lblEmpName" runat="server" Text='<%#Eval("EmployeeName")%>'></asp:Label>
                                                                                                                                <asp:Label ID="lblEmpId" runat="server" Visible="false" Text='<%#Eval("EmployeeID")%>'></asp:Label>
                                                                                                                            </ItemTemplate>
                                                                                                                            <HeaderStyle Width="16%" CssClass="styleGridHeader" />
                                                                                                                            <ItemStyle Width="16%" HorizontalAlign="Left" />
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="15%">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:DropDownList ID="ddlAction" runat="server">
                                                                                                                                </asp:DropDownList>
                                                                                                                                <asp:Label ID="lblStatusId" runat="server" Text='<%#Eval("ApprovalStatusID")%>' Visible="false"></asp:Label>
                                                                                                                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("ApprovalStatus")%>' Visible="false"></asp:Label>
                                                                                                                                <asp:RequiredFieldValidator ID="rfvAction" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                                    ControlToValidate="ddlAction" InitialValue="0" ErrorMessage="Select the Action"
                                                                                                                                     Display="None" ValidationGroup="Submit">
                                                                                                                                </asp:RequiredFieldValidator>
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="Approval Date">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="lblApprovalDate" runat="server" Text='<%# Bind("ApprovalDate")%>'></asp:Label>
                                                                                                                            </ItemTemplate>
                                                                                                                            <HeaderStyle Width="14%" CssClass="styleGridHeader" />
                                                                                                                            <ItemStyle Width="14%" HorizontalAlign="Center" />
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="Remark">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:TextBox ID="txtRemark" runat="server" Width="100%" Height="35px" Text='<%# Bind("Remark") %>'
                                                                                                                                    ReadOnly="false" onkeyup="maxlengthfortxt(80);" onchange="maxlengthfortxt(80);"
                                                                                                                                    TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                                                                                            </ItemTemplate>
                                                                                                                            <HeaderStyle Width="38%" CssClass="styleGridHeader" />
                                                                                                                            <ItemStyle HorizontalAlign="Left" Width="30%" VerticalAlign="Top" />
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="Password" Visible="false">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:TextBox EnableViewState="true" ID="txtPassword" runat="server" MaxLength="15"
                                                                                                                                    onfocus="this.select();" Text='<%# Bind("Password") %>'
                                                                                                                                    TextMode="Password" Width="100px"></asp:TextBox>
                                                                                                                                <asp:RequiredFieldValidator ID="rfvPassword" CssClass="styleMandatoryLabel"
                                                                                                                                    runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password"
                                                                                                                                    Display="None" InitialValue="">
                                                                                                                                </asp:RequiredFieldValidator>
                                                                                                                            </ItemTemplate>
                                                                                                                            <HeaderStyle Width="10%" CssClass="styleGridHeader" />
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="Is Approval" Visible="false">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="lblIsApprover" runat="server" Text='<%#Eval("IS_Approval")%>'></asp:Label>
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                    </Columns>
                                                                                                                    <RowStyle ForeColor="Blue" HorizontalAlign="Left" />
                                                                                                                </asp:GridView>
                                                                                                            <%--</asp:Panel>--%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                    </asp:Panel>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                 <%--   </asp:Panel>--%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel TabIndex="2" runat="server" ID="tpScoreBoard" CssClass="tabpan" BackColor="Red"
                                            Width="100%" HeaderText="Score">
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td height="10px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td width="100%">
                                                                                <asp:GridView ID="grdGrpName" runat="server" ShowHeader="true" AutoGenerateColumns="False"
                                                                                    OnRowDataBound="grdGrpName_RowDataBound" BorderStyle="None" GridLines="None" BorderWidth="0px" Width="100%"
                                                                                    DataKeyNames="GroupID">
                                                                                    <Columns>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpcode" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Description">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpname" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Items">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpItems" runat="server" Text='<%# Bind("Item_Count") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Sub Items">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpSubItems" runat="server" Text='<%# Bind("Sub_Item_Count") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Req Score">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpReqScore" runat="server" Text='<%# Bind("Required_Score") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Actual Score">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpActualScore" runat="server" Text='<%# Bind("Grp_Actual_Score") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Hygiene Allow">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpHygeneAllow" runat="server" Text='<%# Bind("Hygene_Allow") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Hygiene Actual">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbl_grpHygeneActual" runat="server" Text='<%# Bind("Hygene_Actual") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="9%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Remarks" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox ID="txtgrpRemarks" TextMode="MultiLine" Width="180px" runat="server"
                                                                                                    Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                            <ItemTemplate>
                                                                                                <tr>
                                                                                                    <td style="width: 3%"></td>
                                                                                                    <td colspan='100%'>
                                                                                                        <asp:Panel ID="pnlCrScore" runat="server" Style="position: relative;" Width="100%">
                                                                                                            <asp:GridView runat="server" ShowHeader="true" ShowFooter="false" ID="grvCreditScore"
                                                                                                                RowStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" Width="100%"
                                                                                                                AutoGenerateColumns="False" DataKeyNames="CrScoreParam_ID">
                                                                                                                <Columns>
                                                                                                                    <asp:TemplateField HeaderText="Line No" Visible="false">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblLineNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                                                            <asp:Label ID="lblScoreAssigned" runat="server" Text="0" Visible="false"></asp:Label>
                                                                                                                            <asp:Label ID="lblParam_Year" runat="server" Text='<%# Eval("Year")%>' Visible="false"></asp:Label>
                                                                                                                            <asp:Label ID="lblCGroupCode" runat="server" Text='<%# Eval("GroupCode")%>' Visible="false"></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="S.No">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lbl_Subgrpcode" runat="server" Text='<%# Bind("SubGroupCode") %>'></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Description">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("Desc")%>'></asp:Label>
                                                                                                                            <asp:Label ID="lblParamID" runat="server" Visible="false" Text='<%#Eval("CrScoreParam_ID")%>'></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Attrib">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblFieldAttName" Text='<%# Bind("FieldAttName")%>' runat="server"></asp:Label>
                                                                                                                            <asp:Label ID="lblFieldAtt" Text='<%# Bind("FieldAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Left" Width="8%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Operator" Visible="false">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblNumericName" Text='<%# Bind("NumericName")%>' runat="server"></asp:Label>
                                                                                                                            <asp:Label ID="lblNumericAtt" Text='<%# Bind("NumericAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Req Value">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblReqValue" runat="server" Text='<%# Bind("ReqValue")%>' ToolTip="Req Param"></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Value To" Visible="false">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblReqValueTo" runat="server" Text='<%# Bind("ReqValueTo")%>' ToolTip="Req Param To"></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Actual Value">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:TextBox ID="txtActualValue" ReadOnly="true" Width="100px" runat="server"
                                                                                                                                Text='<%# Bind("Actual_Value")%>' Style="text-align: right"></asp:TextBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Actual Score">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:TextBox ID="txtActualScore" Width="100px" runat="server"
                                                                                                                                Text='<%# Bind("Actual_Score")%>' Style="text-align: right" ReadOnly="true"></asp:TextBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField ItemStyle-Wrap="true" HeaderText="RequiredScore" Visible="false">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblScore" runat="server" Text='<%# Bind("Score")%>'></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Diff %" Visible="false">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblDiffPer" runat="server" Text='<%# Bind("DiffPer")%>'></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Diff Mark" Visible="false">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Label ID="lblDiffMark" runat="server" Text='<%# Bind("DiffMark")%>'></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                                                    </asp:TemplateField>
                                                                                                                </Columns>
                                                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                                                <RowStyle HorizontalAlign="Center" />
                                                                                                            </asp:GridView>
                                                                                                        </asp:Panel>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan='100%'>
                                                                                                        <table border="0" width="100%" class="stylePagingControl">
                                                                                                            <tr>
                                                                                                                <td style="width: 5%;"></td>
                                                                                                                <td class="styleFieldLabelBold" style="font-weight: bold; width: 37%;" align="right">
                                                                                                                    <asp:Label ID="lblGrpActual" runat="server" Text="Group Score Actual"></asp:Label>
                                                                                                                </td>
                                                                                                                <td class="styleFieldAlign" align="right" style="width: 8%;">
                                                                                                                    <asp:TextBox ID="txtGrpActual" runat="server" Style="text-align: right" Width="100px" Text="0" ReadOnly="true"></asp:TextBox>
                                                                                                                </td>
                                                                                                                <td class="styleFieldLabelBold">
                                                                                                                    <asp:Label ID="lblGrpScore" runat="server" Text="Group Score Req."></asp:Label>

                                                                                                                </td>
                                                                                                                <td class="styleFieldAlign">
                                                                                                                    <asp:TextBox ID="txtGrpScore" runat="server" Style="text-align: right" Width="100px" Text="0" ReadOnly="true"></asp:TextBox>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="100%">
                                                                                <table width="100%" class="stylePageHeading">
                                                                                    <tr>
                                                                                        <td style="width: 5%;"></td>
                                                                                        <td class="styleFieldLabel" style="font-weight: bold; width: 37%;" align="right">
                                                                                            <asp:Label runat="server" Text="Actual Total Score" BackColor="White" ID="lblActualtotalscore"
                                                                                                Font-Bold="true" CssClass="styleGridHeader">
                                                                                            </asp:Label>

                                                                                        </td>
                                                                                        <td class="styleFieldAlign" align="right" style="width: 8%;">
                                                                                            <asp:TextBox ID="txtActualTotal" Width="100px" ReadOnly="true" runat="server" ToolTip="Total Score Actual"
                                                                                                Style="text-align: right"></asp:TextBox>

                                                                                        </td>
                                                                                        <td class="styleFieldLabel">
                                                                                            <asp:Label runat="server" Text="Required Total Score" BackColor="White" ID="lblReqTotalScore"
                                                                                                Font-Bold="true" CssClass="styleGridHeader">
                                                                                            </asp:Label>
                                                                                        </td>
                                                                                        <td class="styleFieldAlign">
                                                                                            <asp:TextBox ID="txtReqTotalScore" Width="100px" ReadOnly="true" runat="server" ToolTip="Total Score Required"
                                                                                                Style="text-align: right"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%">
                                                                        <tr align="center">
                                                                            <asp:HiddenField ID="Hiddenlocationid" runat="server" />
                                                                            <asp:HiddenField ID="Hiddenlobid" runat="server" />
                                                                            <asp:HiddenField ID="HiddenCustomerid" runat="server" />
                                                                            <asp:HiddenField ID="HiddenProductid" runat="server" />
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel TabIndex="3" runat="server" ID="tpCustomerLimit" CssClass="tabpan" BackColor="Red"
                                            Width="100%" HeaderText="Limit">
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="pnlCrLimit" runat="server" Visible="false" GroupingText="Credit Limit Details" Width="99%" CssClass="stylePanel">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td class="styleFieldLabel" style="width: 20%">Customer Name
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txt_Customername" runat="server" Width="220px" ReadOnly="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel" style="width: 20%">Customer Group Name
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txt_CustGrpName" runat="server" Width="220px" ReadOnly="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">Industry Name
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txt_CustIndustName" runat="server" Width="220px" ReadOnly="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2">
                                                                                    <asp:Panel ID="pnlInnerLimit" runat="server" GroupingText="Limit" CssClass="stylePanel">
                                                                                        <table width="100%">
                                                                                            <tr>
                                                                                                <td class="styleFieldLabel" style="width: 20%">Limit Sought</td>
                                                                                                <td class="styleFieldAlign">
                                                                                                    <asp:TextBox ID="txt_LimitSought" runat="server" Style="text-align: right;" /></td>
                                                                                                <td class="styleFieldLabel" style="width: 20%">Eligible</td>
                                                                                                <td class="styleFieldAlign">
                                                                                                    <asp:TextBox ID="txt_Eligible" runat="server" Style="text-align: right;" /></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="styleFieldLabel" style="width: 20%">Santioned</td>
                                                                                                <td class="styleFieldAlign">
                                                                                                    <asp:TextBox ID="txt_Sanctioned" runat="server" /></td>
                                                                                                <td class="styleFieldLabel" colspan="2">
                                                                                                    <asp:CheckBox ID="chkBus" OnCheckedChanged="chkBus_Changed" runat="server" AutoPostBack="true" Text="Bussiness Line" />
                                                                                                    <asp:CheckBox ID="chkProduct" runat="server" OnCheckedChanged="chkProduct_Changed" AutoPostBack="true" Text="Product" /></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="4" class="styleFieldLabel">Remarks
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="4" class="styleFieldAlign">
                                                                                                    <asp:TextBox ID="txtLimitRemarks" Width="99%" TextMode="MultiLine" runat="server" MaxLength="200"
                                                                                                        onkeyup="maxlengthfortxt(200)" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </asp:Panel>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Panel ID="pnlLimitGrid" Visible="false" runat="server" Style="position: relative">
                                                                                    <asp:GridView runat="server" ShowFooter="true" ID="grvLimitSet" Width="99%"
                                                                                        RowStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
                                                                                        AutoGenerateColumns="False" OnRowCommand="grvLimitSet_RowCommand" DataKeyNames="ID">
                                                                                        <Columns>
                                                                                            <asp:TemplateField HeaderText="Line Seq">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:Label ID="lblLineSeqE" runat="server" Text='<%# Bind("LineSeq") %>'></asp:Label>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblLineNo" runat="server" Text='<%# Bind("LineSeq") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:Label ID="lblLineNoF" runat="server"></asp:Label>
                                                                                                </FooterTemplate>
                                                                                                <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                                                                <FooterStyle HorizontalAlign="Left" Width="5%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Bussiness Line">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:DropDownList ID="ddlBussinessLineE" Width="180px"
                                                                                                        runat="server" ToolTip="Description">
                                                                                                    </asp:DropDownList>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblBussinessLine" runat="server" Text='<%# Bind("BussinessLine")%>'></asp:Label>
                                                                                                    <asp:Label ID="lblBussinessLineID" Visible="false" runat="server" Text='<%# Bind("BussinessLineID")%>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:DropDownList ID="ddlBussinessLineF" Width="180px" Enabled="false" runat="server" ToolTip="Description"
                                                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlBussinessLineF_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                </FooterTemplate>
                                                                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                                                <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Product">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:DropDownList ID="ddlProductE" runat="server" ToolTip="Product name"></asp:DropDownList>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblProductName" Text='<%# Bind("ProductName")%>' runat="server"></asp:Label>
                                                                                                    <asp:Label ID="lblProductID" Text='<%# Bind("ProductID")%>' Visible="false" runat="server"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:DropDownList ID="ddlProductF" Width="180px" Enabled="false"
                                                                                                        runat="server" ToolTip="Product name" AutoPostBack="true" OnSelectedIndexChanged="ddlProductF_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                </FooterTemplate>
                                                                                                <HeaderStyle Width="15%" />
                                                                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                                                <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Combined Limit">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:TextBox ID="txtCombinedE" runat="server" Text='<%# Bind("IsCombined") %>' ToolTip="Combined Limit" Width="50px"></asp:TextBox>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblCombinedt" runat="server" Text='<%# Bind("IsCombined") %>' ToolTip="Combined Limit" Width="50px"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtCombinedF" runat="server" ToolTip="Combined Limit" Width="50px"></asp:TextBox>
                                                                                                </FooterTemplate>
                                                                                                <HeaderStyle Width="10%" />
                                                                                                <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                                                <FooterStyle HorizontalAlign="Left" Width="5%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Sanction Amount" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:TextBox ID="txtSanctionE" Text='<%# Bind("Sanction")%>' MaxLength="30"
                                                                                                        runat="server" ToolTip="Sanction Amount" Style="text-align: right" Width="80px"></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="fteSanctionE" runat="server" TargetControlID="txtSanctionE"
                                                                                                        FilterType="Numbers,Custom" ValidChars=".:-" Enabled="True">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblReqValue" runat="server" Text='<%# Bind("Sanction")%>' ToolTip="Req Param"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtSanctionF" MaxLength="30" runat="server" ToolTip="Req Param"
                                                                                                        Style="text-align: right" Width="80px"></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="fteSanctionF" runat="server" TargetControlID="txtSanctionF"
                                                                                                        FilterType="Numbers,Custom" Enabled="True" ValidChars=".-">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                </FooterTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" Width="5%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Utilize">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:TextBox ID="txtUtilizeE" Text='<%# Bind("Utilize")%>' MaxLength="30"
                                                                                                        runat="server" ToolTip="Utilize" Style="text-align: right" Width="80px"></asp:TextBox>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblUtilize" runat="server" Text='<%# Bind("Utilize")%>' ToolTip="Utilize"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtUtilizeF" MaxLength="30" AutoPostBack="true" runat="server" ToolTip="Utilize"
                                                                                                        Style="text-align: right" Width="80px" OnTextChanged="txtUtilizeF_TextChanged"></asp:TextBox>
                                                                                                </FooterTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" Width="5%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Balance">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:TextBox ID="txtBalanceE" Text='<%# Bind("Balance")%>' ReadOnly="true"
                                                                                                        MaxLength="15" runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                                        Style="text-align: right" ToolTip="Balance" Width="100px"></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="ftetxtBalanceE" runat="server" TargetControlID="txtBalanceE"
                                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance")%>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtBalanceF" ReadOnly="true" MaxLength="15"
                                                                                                        runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                                        ToolTip="Balance" Style="text-align: right" Width="100px"></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="fteBalanceF" runat="server" TargetControlID="txtBalanceF"
                                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                </FooterTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" Width="5%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Action" HeaderStyle-Width="10%">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:ImageButton ID="lnkUpdGrp" runat="server" Text="Update" Width="20px" Height="20px" CommandName="Update"
                                                                                                        ImageUrl="~/Images/Update_New.png" CssClass="styleGridImgShortButton" ToolTip="Update Limit"></asp:ImageButton>
                                                                                                    <asp:LinkButton ID="lnkCancelGrp" runat="server" Text="Cancel" Width="20px" Height="20px" CommandName="Cancel"
                                                                                                        CausesValidation="false" ImageUrl="~/Images/Cancel_New.png" CssClass="styleGridImgShortButton" ToolTip="Cancel Limit"></asp:LinkButton>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:ImageButton ID="lnkEditGroup" runat="server" Text="Edit" Width="20px" Height="20px" CommandName="Edit"
                                                                                                        CausesValidation="false" ImageUrl="~/Images/Edit.jpg" CssClass="styleGridImgShortButton" ToolTip="Edit Limit"></asp:ImageButton>
                                                                                                    &nbsp;
                                                                                    <asp:ImageButton ID="btnGrpRemove" Text="Remove" CommandName="Delete" Width="20px" Height="20px" runat="server"
                                                                                        CausesValidation="false" ImageUrl="~/Images/delete1.png" Visible="false"
                                                                                        CssClass="styleGridImgShortButton" ToolTip="Delete Limit" />
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:ImageButton ID="btnGrpDetails" ImageUrl="~/Images/2Blue_Plus.png"
                                                                                                        CommandName="AddNew" Width="20px" Height="20px" runat="server" CssClass="styleGridImgShortButton"
                                                                                                        ToolTip="Add Limit" />
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                                        <RowStyle HorizontalAlign="Center" />
                                                                                    </asp:GridView>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Panel ID="pnlGrpHis" runat="server" GroupingText="Group History" Style="position: relative" Visible="false" Width="99%">
                                                                                    <asp:GridView runat="server" ShowFooter="false" ID="grvGrpHis" Width="99%"
                                                                                        RowStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
                                                                                        AutoGenerateColumns="False" DataKeyNames="SNo">
                                                                                        <Columns>
                                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle Width="30px" HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Customer Name">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%# Bind("CustomerName")%>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Date Of Sanctioned" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Center">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblSanctionedDate" Text='<%# Bind("SanctionedDate")%>' runat="server"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Santioned Limit" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Center">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblSanctionedLimit" Text='<%# Bind("SanctionedLimit")%>' runat="server"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Utilized">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblUtilized" runat="server" Text='<%# Bind("Utilized")%>' ToolTip="Utilized"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Average Pay Time/Pay distance" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Center">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblAverage" runat="server" Text='<%# Bind("Average")%>' ToolTip="Average Pay Time/Pay distance"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Current Dues">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblDues" runat="server" Text='<%# Bind("Dues")%>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Remarks">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks")%>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                                        <RowStyle HorizontalAlign="Center" />
                                                                                    </asp:GridView>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="width: 100%;">
                    <td></td>

                </tr>

                <tr>
                    <td height="5px"></td>
                </tr>
                <tr>
                    <td width="100%">
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:GridView runat="server" ID="gvCreditParameter" OnRowDataBound="gvCreditParameter_RowDataBound"
                                        AutoGenerateColumns="False" Visible="false"
                                        Width="100%">
                                        <Columns>
                                            <%--Column 2 - serail Number Column  --%>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Serial Number">
                                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblActive" runat="server" Text='<%#Eval("SerialNumber")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                            <%--Column 3 - LOB Column  --%>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkbtnSortLOB" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Line of Business"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnSortLOB" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Line of Business" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" CssClass="styleSearchBox"
                                                                    Width="130px" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOBCodeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--Column 4 - Branch Column  --%>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkbtnSortBranch" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Location"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnSortBranch" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Location" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" CssClass="styleSearchBox"
                                                                    Width="130px" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("LocationCodeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--Column 5 - Product Column  --%>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkbtnSortProduct" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Product"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnSortProduct" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Product" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" CssClass="styleSearchBox"
                                                                    Width="130px" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("ProductCodeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--Column 5 - Sanction Number Column  --%>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkSanctionNo" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Product"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnSortSanction" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Product" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="lnkSanctionNoSearch" runat="server" CssClass="styleSearchBox"
                                                                    Width="130px" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSanctionNo" runat="server" Text='<%# Bind("ProductCodeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--Column 6 - Enquiry No Column  --%>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkbtnSortEnquiryNo" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Document No"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnSortEnquiryNo" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Enquiry No" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" runat="server" CssClass="styleSearchBox"
                                                                    AutoPostBack="true" Width="70px" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEnquiryNo" runat="server" Text='<%# Bind("DOC_NUMBER") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--Column 7 - Enquiry Date Column  --%>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkbtnSortEnquiryDate" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Document Date"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnSortEnquiryDate" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Enquiry Date" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch5" runat="server" CssClass="styleSearchBox"
                                                                    Width="80px" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEnquiryDate" runat="server" Text='<%# Bind("DOC_Date")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--Column 9 - Customenr Name Column  --%>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkbtnCustomerName" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Customer"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnCustomerName" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Customer Name" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch7" runat="server" CssClass="styleSearchBox"
                                                                    Width="100px" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%#Eval("CustomerCodeName")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--Column 9 - Constitution Name Column  --%>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:LinkButton ID="lnkbtnConstitutionName" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                    OnClick="FunProSortingColumn" Text="Constitution"></asp:LinkButton>
                                                                <asp:ImageButton ID="imgbtnConstitutionName" CssClass="styleImageSortingAsc" runat="server"
                                                                    AlternateText="Sort By Constitution Name" ImageAlign="Middle" />
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch8" runat="server" CssClass="styleSearchBox"
                                                                    Width="100px" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblConstitutionName" runat="server" Text='<%#Eval("ConstitutionName")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Click to approve">
                                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkApprove" OnCheckedChanged="chkApprove_Changed" AutoPostBack="true"
                                                        runat="server" Enabled="true" Checked='<%# Bind("Approve") %>'></asp:CheckBox>
                                                    <asp:Label Visible="false" ID="lblCompanyId" runat="server" Text='<%#Eval("CompanyId")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblLOBId" runat="server" Text='<%#Eval("LOBId")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblProductId" runat="server" Text='<%#Eval("ProductId")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblConstitutionID" runat="server" Text='<%#Eval("ConstitutionID")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblCustomerId" runat="server" Text='<%#Eval("CustomerId")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblCustomerCode" runat="server" Text='<%#Eval("CustomerCode")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblEnquiryNoHdn" runat="server" Text='<%#Eval("DOC_NUMBER")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblLocationId" runat="server" Text='<%#Eval("LocationID")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblNumOfApproved" runat="server" Text='<%#Eval("NumOfApproved")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblApprovedStatus" runat="server" Text='<%#Eval("ApprovalStatus")%>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblCreditParamTransID" runat="server" Text='<%#Eval("CreditParamTransID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <uc1:PageNavigator ID="ucCustomPaging" Visible="false" runat="server"></uc1:PageNavigator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td style="padding-top: 5px; padding-left: 5px;">
                        <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                    </td>
                </tr>
            </table>
            <input type="hidden" value="0" runat="server" id="hdnAprTransID" />
            <input type="hidden" value="0" runat="server" id="hdnUnderWriting_Guide_ID" />
            <input type="hidden" value="0" runat="server" id="hdnUW_Tran_SLNO" />
            <input type="hidden" value="0" runat="server" id="hdnLocationID" />
            <input type="hidden" value="0" runat="server" id="hdnAprSeq" />
            <input type="hidden" value="0" runat="server" id="hdnAprType" />
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
            <div id="btndiv" style="overflow: auto; text-align: center">
                <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Save"
                    OnClick="btnSave_OnClick" OnClientClick="return fnCheckPageValidators('Submit');" />
                <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                     Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_OnClick" />
                <asp:Button ID="btnCalcel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                    UseSubmitBehavior="False" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>


    <br />
    <asp:ValidationSummary ID="vsApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
        Enabled="true" Width="98%" ShowMessageBox="false" ValidationGroup="Submit"
        HeaderText="Correct the following validation(s):  " ShowSummary="true" />
</asp:Content>


