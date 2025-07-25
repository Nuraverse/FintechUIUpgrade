<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_DC_Incentive_Upload, App_Web_x5tdsxrh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }
        function SaveConfirm() {
            return confirm('Do you want to process this DC Incentive Upload Details?');
        }
    </script>
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" class="stylePageHeading">
                <asp:Label runat="server" Text="DC Incentive Upload" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
                <asp:HiddenField ID="hiddenheaderid" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel GroupingText="Upload Details" ID="pnlUploadDetails" runat="server"
                    CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td class="styleFieldLabel" width="15%">
                                <asp:Label ID="lblBank" runat="server" Text="Upload Type" CssClass="styleReqFieldLabel"></asp:Label>

                            </td>
                            <td class="styleFieldAlign" width="35%">
                                <asp:DropDownList ID="ddluploadSel" runat="server" Width="205px" OnSelectedIndexChanged="ddluploadSel_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="DC Allocation"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="DC Collection"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvBank" runat="server" Display="None" InitialValue="0"
                                    ValidationGroup="Go" ErrorMessage="Select the Upload Type" ControlToValidate="ddluploadSel"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td class="styleFieldLabel" width="15%">
                                <asp:Label ID="lblProcessMonth" runat="server" Text="Process Month" CssClass="styleDisplayLabel"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" width="35%">
                                <asp:TextBox runat="server" ID="txtProcessMonth" Text="" ReadOnly="true"></asp:TextBox>
                                <cc1:CalendarExtender ID="calProcessMonth" runat="server" Enabled="True" PopupButtonID="txtProcessMonth"
                                    TargetControlID="txtProcessMonth" Format="MMM-yyyy">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td class="styleFieldLabel" width="15%">
                                <asp:Label runat="server" Text="Upload file" ID="Label2">
                                </asp:Label>

                            </td>
                            <td class="styleFieldAlign" width="35%">
                                <asp:Button ID="btnBrowse" runat="server" CssClass="styleSubmitButton" Style="display: none" OnClick="btnBrowse_OnClick"></asp:Button>
                                <asp:CheckBox ID="chkSelect" runat="server" Text="" Enabled="false" Visible="false" />
                                <asp:FileUpload runat="server" ID="flUpload" ToolTip="Upload File" />
                                <asp:Button CssClass="styleSubmitButton" ID="btnDlg" runat="server" Text="Browse"
                                    Style="display: none" CausesValidation="false"></asp:Button>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="flUpload" ErrorMessage="Upload Cheque and ECS Return Excel"
                                    CssClass="styleMandatoryLabel" SetFocusOnError="True" Display="None" Enabled="false"
                                    ValidationGroup="Go"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" style="width: 15%;">
                                <asp:ImageButton ID="hyplnkView" ImageUrl="~/Images/Excel.png"
                                    Width="20px" Height="20px" runat="server" ToolTip="Uploaded File" Visible="false" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                            <td align="left">
                                <asp:Label ID="lblActualPath" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblCurrentPath" runat="server" Visible="false" Text="" />
                                <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                <asp:Label runat="server" ID="lblPath" Text="" Visible="false"></asp:Label>
                                <asp:Label ID="lblExcelCurrentPath" runat="server" Visible="true" Text="" ForeColor="Green" />
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel GroupingText="Status Details" ID="pnlUpload" Visible="false" runat="server" CssClass="stylePanel">
                    <table>
                        <tr>
                            <td class="styleFieldLabel">
                                <asp:Label ID="Label1" runat="server" Text="Status"></asp:Label>
                            </td>
                            <td colspan="2" class="styleFieldAlign">
                                <asp:ImageButton ID="imgbtnValid" ImageUrl="~/Images/Excel.png" ToolTip="Valid Details"
                                    Width="20px" Height="20px" runat="server" Visible="false" />
                                <asp:CheckBox ID="chkSuccess" Text="Valid" runat="server" />

                                &nbsp;&nbsp;&nbsp;
                                         <asp:ImageButton ID="imgbtnInvalid" ImageUrl="~/Images/Excel.png" ToolTip="Invalid Details"
                                             Width="20px" Height="20px" runat="server" Visible="false" />
                                <asp:CheckBox ID="chkFail" Text="Invalid" runat="server" />
                                   

                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGRDChqRtn" runat="server" GroupingText="Cheque Return Information"
                    Width="100%" Visible="false" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                    <asp:GridView ID="gvChequeReturn" runat="server" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="true" Width="100%">
                    </asp:GridView>

                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGRDECS" runat="server" GroupingText="ECS Return Information"
                    Width="100%" Visible="false" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                    <asp:GridView ID="gvECSReturn" runat="server" AutoGenerateColumns="true" RowStyle-HorizontalAlign="Center" Width="100%">
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <%--<asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Width="200px" Text="Move To Staging Table" ValidationGroup="btnSave" />
                <asp:Button ID="btnUpdate" runat="server" CssClass="styleSubmitButton" Text="Upload Process" Enabled="false" />--%>
                <asp:Button ID="btnGo" CssClass="styleSubmitShortButton" Enabled="false" ValidationGroup="Go" runat="server" Text="Process"
                 ToolTip="Process, Alt+G"  AccessKey="G"  OnClick="btnGo_Click" />
                <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                     ToolTip="Clear, Alt+L"  AccessKey="L" Text="Clear" OnClick="btnClear_Click" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton" 
                     ToolTip="Cancel, Alt+N"  AccessKey="N" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td align="left">
                <cc1:TabContainer ID="tcChequeReturnThroughExcel" runat="server" CssClass="styleTabPanel"
                    Width="99%" TabStripPlacement="top" ActiveTabIndex="0">
                    <cc1:TabPanel runat="server" HeaderText="Details" ID="tbProcessedDetails" CssClass="tabpan"
                        BackColor="Red" TabIndex="0">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="updProcessed" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>

                                                <asp:ImageButton ID="btnProcessedExcel" Enabled="false" ImageUrl="~/Images/Excel.png"
                                                    Width="30px" Height="30px" runat="server" ToolTip="Processed Excel,Alt+P" AccessKey="P" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlLaoding" runat="server" GroupingText="Details" CssClass="stylePanel" Width="1000px">
                                                    <div id="divGrid1" runat="server" style="overflow: auto; height: 300px; width: 100%;">
                                                        <asp:GridView ID="gvProcessedData" runat="server" AutoGenerateColumns="true" Width="100%" Hight="100%"></asp:GridView>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnProcessedExcel" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Exception Details" ID="tbExceptionDetails" CssClass="tabpan"
                        BackColor="Red" TabIndex="1">
                        <ContentTemplate>
                            <asp:UpdatePanel runat="server" ID="updException">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Exception Details" Width="1000px">
                                                    <table>
                                                        <tr>
                                                            <td>

                                                                <asp:ImageButton ID="btexnExcel" Enabled="false" ImageUrl="~/Images/Excel.png"
                                                                    Width="30px" Height="30px" runat="server" ToolTip="Exception Excel,Alt+E" AccessKey="E" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div id="divGrid2" runat="server" style="overflow: auto; height: 300px; width: 100%;">
                                                        <asp:GridView ID="grvException" runat="server" AutoGenerateColumns="true" Visible="false" Width="100%">
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>

                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btexnExcel" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" Visible="false" HeaderText="Cheque Return Details" ID="tbChequeReturnDetails" CssClass="tabpan"
                        BackColor="Red" TabIndex="2">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="updChequeReturnDetails" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblFrom" runat="server" Text="Advice Date" Visible="false" />
                                                <asp:TextBox ID="txtFrom" runat="server" ToolTip="Advice Date" Width="165px" Visible="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="txtFrom_CalendarExtender" runat="server" Enabled="True" PopupButtonID="txtFrom" TargetControlID="txtFrom">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="rfvFrom" runat="server" ControlToValidate="txtFrom" Display="None" ErrorMessage="Please select the Advice Date" SetFocusOnError="true" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                                <asp:Label ID="Label3" runat="server" Text="Advice No" Visible="false" />
                                                <asp:TextBox ID="txtadvoirno" runat="server" Visible="false" MaxLength="15"></asp:TextBox>
                                                <asp:Button ID="btnchprocess" runat="server" CssClass="styleSubmitButton" Width="150Px" Text="Cheque Return Process" Enabled="false" ValidationGroup="Update" Visible="false" />
                                                <cc1:FilteredTextBoxExtender ID="flRatingAmount" runat="server" TargetControlID="txtadvoirno"
                                                    FilterType="Numbers">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFrom" Display="None" ErrorMessage="Please Enter Advice No" SetFocusOnError="true" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                                <asp:ImageButton ID="btnchequedetails" Enabled="false" ImageUrl="~/Images/Excel.png"
                                                    Width="30px" Height="30px" runat="server" ToolTip="Excel" />

                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Cheque Return Details" Width="1000px">
                                                    <div id="divGrid3" runat="server" style="overflow: auto; height: 300px; width: 100%;">
                                                        <asp:GridView ID="grvChequeDetails" runat="server" AutoGenerateColumns="true" Visible="false" Width="100%">
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>

                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>


                                    <asp:PostBackTrigger ControlID="btnchequedetails" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>

            </td>
        </tr>



        <tr>
            <td align="center">
                <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" ShowSummary="true" ValidationGroup="Go" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" ShowSummary="true" ValidationGroup="Update" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CustomValidator ID="cvChequeReturn" runat="server" CssClass="styleMandatoryLabel" Enabled="true" Width="98%" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" CausesValidation="false" CssClass="styleSubmitButton" Style="display: none;" Text="Print" />
            </td>
        </tr>


    </table>
</asp:Content>

