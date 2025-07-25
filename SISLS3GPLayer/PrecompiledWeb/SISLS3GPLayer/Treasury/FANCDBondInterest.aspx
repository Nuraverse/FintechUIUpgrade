<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_FANCDBondsInterest, App_Web_ezlcepmc" title="NCD Bonds Interest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading" colspan="4">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Bonds NCD Interest" ID="lblBondNCD" CssClass="styleDisplayLabel"> </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:TabContainer ID="tcBilling" runat="server" CssClass="styleTabPanel" ScrollBars="None"
                            Width="98%">
                            <cc1:TabPanel ID="TabMainPage" runat="server" BackColor="Red" CssClass="tabpan" HeaderText="Process"
                                Width="98%">
                                <HeaderTemplate>
                                    Process
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td width="100%" valign="top">
                                                <asp:Panel ID="Panel1" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                                                    Width="99%">
                                                    <table width="100%" border="0">
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblLastCalc" runat="server" CssClass="styleReqFieldLabel" Text="Last Calc Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtLastCalc" runat="server" Width="75px"></asp:TextBox>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblMonthYear" runat="server" CssClass="styleReqFieldLabel" Text="Month/Year"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtMonthYear" runat="server" Width="70px"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calMonthYear" Format="MMM-yyyy" TodaysDateFormat="MMM-yyyy"
                                                                    OnClientDateSelectionChanged="AssignStartEndDate" OnClientShown="onShown" OnClientHidden="onHidden"
                                                                    runat="server" DefaultView="Months" Enabled="True" TargetControlID="txtMonthYear"
                                                                    PopupButtonID="imgMonthYear">
                                                                </cc1:CalendarExtender>
                                                                <asp:Image ID="imgMonthYear" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblStartDate" runat="server" CssClass="styleReqFieldLabel" Text="Start Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtStartDate" runat="server" Width="75px"></asp:TextBox>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblEndDate" runat="server" CssClass="styleReqFieldLabel" Text="End Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtEndDate" runat="server" Width="75px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="8">
                                                                <br />
                                                                <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitShortButton" Text="Go"
                                                                    ValidationGroup="Go" OnClick="btnGo_Click1" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Panel runat="server" ID="pnlBranch" CssClass="stylePanel" GroupingText="NCD Bond Interest Details"
                                        Width="99%" Visible="False">
                                        <br />
                                        <div id="div1" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server"
                                            border="1">
                                            <asp:GridView ID="gvBranchWise" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                                                EmptyDataText="No Location Found for Billing!...." Width="100%" OnRowDataBound="gvBranchWise_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Holder Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHolder" runat="server" Text='<%#Bind("Holder") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Org_Holder" HeaderText="Original Holder">
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Bought_Amt" HeaderText="Fund Transaction Amount">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Bought_Date" HeaderText="Fund Transaction Date">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Int_Due_Dt" HeaderText="Interest Date">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Int_Amt" HeaderText="Interest Amount">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                        <br />
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" align="center">
                <tr>
                    <td align="center">
                        <asp:Button ID="btnSave" runat="server" Enabled="false" CausesValidation="true" CssClass="styleSubmitButton"
                            Text="Save" ValidationGroup="btnSave" OnClick="btnSave_OnClick" OnClientClick="return fnCheckPageValidators('btnSave');" />
                        &nbsp;
                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                            OnClientClick="return fnConfirmClear();" Text="Clear_FA" OnClick="btnClear_OnClick" />
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                            Text="Cancel" OnClick="btnCancel_Click" />
                        &nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="styleFieldAlign">
                        <asp:CustomValidator ID="cvBilling" runat="server" CssClass="styleMandatoryLabel"
                            Display="None" ValidationGroup="Submit"></asp:CustomValidator>
                        <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Go" HeaderText="Please correct the following validation(s):" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" src="../Scripts/jsBilling.js" type="text/javascript">
    </script>

    <script language="javascript" type="text/javascript">
        function fnAssignLOB(ddlLOB) {
            var varLob = ddlLOB.selectedIndex;
            var txtBillLOB = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabBillOutput_txtBillLOB');
            if (txtBillLOB != null) {
                txtBillLOB.value = ddlLOB.options[varLob].innerText;
            }
            AssignStartEndDate();
        }
        function fnAssignFrequency(ddlFrequency) {
            var varFrequency = ddlFrequency.selectedIndex;
            var txtBillFrequency = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabBillOutput_txtBillFrequency');
            var txtDataFrequency = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabControlDataSheet_txtDataFrequency');
            if (txtBillFrequency != null && txtDataFrequency != null) {
                txtBillFrequency.value = ddlFrequency.options[varFrequency].innerText;
                txtDataFrequency.value = ddlFrequency.options[varFrequency].innerText;
            }
            AssignStartEndDate();
        }
        function AssignStartEndDate() {
            var varFrequency = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_ddlFrequency');

            var varMonthYear = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_txtMonthYear').value;
            var varDateFormat = Date.parseInvariant(varMonthYear, "MMM-yyyy");

            var varGPSFormat = '<%=strDateFormat %>';
            var varStartDate = new Date(varDateFormat.getFullYear(), varDateFormat.getMonth(), 1);
            varStartDate = varStartDate.format(varGPSFormat);
            document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_txtStartDate').value = varStartDate;
            var intLastDate = 28;
            if (varDateFormat.getMonth() == 0 || varDateFormat.getMonth() == 2 || varDateFormat.getMonth() == 4 || varDateFormat.getMonth() == 6 || varDateFormat.getMonth() == 7 || varDateFormat.getMonth() == 9 || varDateFormat.getMonth() == 11) {
                intLastDate = 31;
            }
            else if (varDateFormat.getMonth() == 3 || varDateFormat.getMonth() == 5 || varDateFormat.getMonth() == 8 || varDateFormat.getMonth() == 10) {
                intLastDate = 30;
            }
            else {
                if (varDateFormat.getFullYear() % 4 == 0) {
                    intLastDate = 29;
                }
            }
            var varEndDate = new Date(varDateFormat.getFullYear(), varDateFormat.getMonth(), intLastDate);
            varEndDate = varEndDate.format(varGPSFormat);
            document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_txtEndDate').value = varEndDate;

        }
        function fnSelectAccAll(chkSelectAllBranch, chkSelectBranch) {
            var gvBranchWise = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_GrvAccStatus');
            var TargetChildControl = chkSelectBranch;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvBranchWise.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                Inputs[n].checked = chkSelectAllBranch.checked;
        }

        function fnAssignMonthYear(txtMonthYear) {
            var varMonthYear = txtMonthYear.value;
            if (varMonthYear != "") {
                document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabBillOutput_txtBillMonthYear').value = varMonthYear;
                document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabControlDataSheet_txtDataMonthYear').value = varMonthYear;
            }
        }
    </script>

</asp:Content>
