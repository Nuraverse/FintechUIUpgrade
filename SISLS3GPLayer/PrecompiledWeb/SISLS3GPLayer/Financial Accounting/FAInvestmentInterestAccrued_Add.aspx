<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAInvestmentInterestAccrued_Add, App_Web_sravfnz4" title="FA - Investment Interest Accrued" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        
    function fnAssignMonthYear(txtMonthYear)
    {
        var varMonthYear = txtMonthYear.value;
        if(varMonthYear != "")
        {
            document.getElementById('ctl00_ContentPlaceHolder1_txtPeriodEnding').value = varMonthYear;        
        }
    }

    function onShown() 
    {
        var cal = $find("ctl00_ContentPlaceHolder1_cePriodEnding");
        cal._switchMode("months",true);
        cal._today.innerText = "Current Month :" + cal._today.date.format("MMM/yyyy");
        if(cal._monthsBody)
        {
            for(var i=0;i<cal._monthsBody.rows.length;i++)
            {
                var row = cal._monthsBody.rows[i];
                for(var j=0;j<row.cells.length;j++)
                {
                    Sys.UI.DomEvent.addHandler(row.cells[j].firstChild,"click",callMethod);
                }
            }
        }
    }

    function onHidden()
    {
        var cal = $find("ctl00_ContentPlaceHolder1_cePriodEnding");
        if(cal._monthsBody)
        {
            for(var i=0;i<cal._monthsBody.rows.length;i++)
            {
                var row = cal._monthsBody.rows[i];
                for(var j=0;j<row.cells.length;j++)
                {
                    Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild,"click",callMethod);
                }
            }
        }
    }
            
    function callMethod(eventElement)
    {
        var target = eventElement.target;
        var cal = $find("ctl00_ContentPlaceHolder1_cePriodEnding");
        cal._visibleDate = target.date;
        cal.set_selectedDate( target.date);
        cal._switchMonth(target.date);
        cal._today.innerText = "Current Month :" + cal._today.date.format("MMM/yyyy");
        cal._blur.post(true);
        cal.raiseDateSelectionChanged();
    }
            
    function AssignStartEndDate(sender, args)
    {
        var varMonthYear = document.getElementById('ctl00_ContentPlaceHolder1_txtPeriodEnding').value;
        var varDateFormat = Date.parseInvariant(varMonthYear,"MMM/yyyy");
        var varGPSFormat =  '<%=strDateFormat %>';   
        
        var varDate = fnGetSelectedMonthEndDate(varDateFormat);
        var varSelectedDate=varDate;
        varDate = varDate.format(varGPSFormat);
        document.getElementById('ctl00_ContentPlaceHolder1_txtPeriodEnding').value = varDate;
        var today = new Date();
        if (varSelectedDate > today) 
        {
            alert('Selected date cannot be greater than system date');
            varSelectedDate.setMonth(today.getMonth(),0);
            document.getElementById('ctl00_ContentPlaceHolder1_txtPeriodEnding').value = varSelectedDate.format(varGPSFormat);           
        }
        document.getElementById(sender._textbox._element.id).focus();
    }
    function fnGetSelectedMonthEndDate(varDateFormat)
    {
        var intLastDate = 28;         
        if(varDateFormat.getMonth() == 0 || varDateFormat.getMonth() == 2 || varDateFormat.getMonth() == 4 || varDateFormat.getMonth() == 6 || varDateFormat.getMonth() == 7 || varDateFormat.getMonth() == 9 || varDateFormat.getMonth() == 11)
        {
            intLastDate = 31;
        }
        else if(varDateFormat.getMonth() == 3 || varDateFormat.getMonth() == 5 || varDateFormat.getMonth() == 8 || varDateFormat.getMonth() == 10)
        {
            intLastDate = 30;
        }
        else if(varDateFormat.getFullYear()%4 == 0)
        {
            intLastDate = 29;
        }
        return new Date(varDateFormat.getFullYear(),varDateFormat.getMonth(),intLastDate); 
    }
 
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading" colspan="4">
                        <asp:Label runat="server" Text="Investment Interest Accrued" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr style="margin-top: 10px;">
                    <td class="styleFieldLabel">
                        <span class="styleDisplayLabel">Location</span>
                    </td>
                    <td class="styleFieldAlign">
                        <asp:DropDownList ID="ddlLocation" runat="server" onmouseover="ddl_itemchanged(this)"
                            Width="165px" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" SetFocusOnError="true"
                            CssClass="styleMandatoryLabel" ControlToValidate="ddlLocation" InitialValue="0"
                            ErrorMessage="Select the Location" Display="None" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvproLocation" runat="server" SetFocusOnError="true"
                            CssClass="styleMandatoryLabel" ControlToValidate="ddlLocation" InitialValue="0"
                            ErrorMessage="Select the Location" Display="None" ValidationGroup="btnProcess"></asp:RequiredFieldValidator>
                    </td>
                    <td class="styleFieldLabel">
                        <span class="styleDisplayLabel">Interest Accrued Number</span>
                    </td>
                    <td class="styleFieldAlign" align="left">
                        <asp:TextBox ID="txtInterestAccruedNo" runat="server" Width="190" ContentEditable="false"
                            onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="styleFieldLabel">
                        <span class="styleDisplayLabel">Investment Type</span>
                    </td>
                    <td class="styleFieldAlign" align="left">
                        <asp:DropDownList ID="ddlInvestmentType" AutoPostBack="true" runat="server" Width="165px"
                            onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlInvestmentType_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInvestmentType" CssClass="styleMandatoryLabel"
                            runat="server" ValidationGroup="btnSave" ControlToValidate="ddlInvestmentType"
                            InitialValue="0" SetFocusOnError="true" ErrorMessage="Select the Investment type"
                            Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvProInvestmenttype" CssClass="styleMandatoryLabel"
                            runat="server" ValidationGroup="btnProcess" ControlToValidate="ddlInvestmentType"
                            InitialValue="0" SetFocusOnError="true" ErrorMessage="Select the Investment type"
                            Display="None"></asp:RequiredFieldValidator>
                    </td>
                         <td class="styleFieldLabel">
                        <span class="styleDisplayLabel">Posting Date</span>
                    </td>
                 <td class="styleFieldAlign" align="left">
                        <asp:TextBox ID="txtPostingDate" runat="server" Width="80" onmouseover="txt_MouseoverTooltip(this)"
                            AutoPostBack="true" ></asp:TextBox>
                       <%-- <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtPostingDate"
                            PopupButtonID="imgDate" ID="cePriodEnding" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                        </cc1:CalendarExtender>--%>
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtPostingDate"
                            CssClass="styleMandatoryLabel" SetFocusOnError="True" ErrorMessage="Select the Period Ending Date"
                            Display="None" InitialValue="" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                       <%--<asp:RequiredFieldValidator ID="rfvPostingDate" runat="server" SetFocusOnError="true"
                            CssClass="styleMandatoryLabel" ControlToValidate="txtPostingDate" InitialValue=""
                            ErrorMessage="Select the Posting Date" Display="None" ValidationGroup="btnProcess"></asp:RequiredFieldValidator>--%>
                    </td>
                    <%--<td class="styleFieldLabel">
                        <span class="styleDisplayLabel">Period Ending</span>
                    </td>
                    <td class="styleFieldAlign">
                        <asp:TextBox ID="txtPeriodEnding" Width="80" runat="server" onchange="fnAssignMonthYear(this)"
                            onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" OnTextChanged="txtPeriodEnding_TextChanged"></asp:TextBox>
                        <asp:Image ID="imgPeriodEnding" runat="server" ImageUrl="~/Images/calendaer.gif"
                            Visible="false" />
                        <cc1:CalendarExtender runat="server" Format="MMM/yyyy" TargetControlID="txtPeriodEnding"
                            DefaultView="Months" TodaysDateFormat="MMM/YYYY" PopupButtonID="imgPeriodEnding"
                            ID="cePriodEnding" Enabled="True" OnClientShown="onShown" OnClientHidden="onHidden"
                            OnClientDateSelectionChanged="AssignStartEndDate">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="rfvPeriodEnding" runat="server" ControlToValidate="txtPeriodEnding"
                            SetFocusOnError="True" ErrorMessage="Select the Period Ending" Display="None"
                            ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvProcessPeriodEnding" runat="server" ControlToValidate="txtPeriodEnding"
                            SetFocusOnError="True" ErrorMessage="Select the Period Ending" Display="None"
                            ValidationGroup="btnProcess"></asp:RequiredFieldValidator>
                    </td>--%>
                </tr>
                <tr>
                    <td class="styleFieldLabel">
                        <span class="styleDisplayLabel">Last Calculate Date</span>
                    </td>
                    <td class="styleFieldAlign">
                        <asp:TextBox ID="txtLastCalculateDate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                            ContentEditable="false" AutoPostBack="true" onblur="ChkIsZero(this,'Instrument Number');"
                            Width="80"></asp:TextBox>
                        <asp:Image ID="imgLastCalculateDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                            Visible="false" />
                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtLastCalculateDate"
                            PopupButtonID="imgLastCalculateDate" ID="ceLastCalculateDate" Enabled="false"
                            OnClientDateSelectionChanged="checkDate_NextSystemDate">
                        </cc1:CalendarExtender>
                       <%-- <asp:RequiredFieldValidator ID="rfvLastCalculateDate" BackColor="White" runat="server"
                            ValidationGroup="btnSave" CssClass="styleMandatoryLabel" ControlToValidate="txtLastCalculateDate"
                            InitialValue="" SetFocusOnError="true" ErrorMessage="Select the Last Calculated Date"
                            Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvProLastCalculateDate" BackColor="White" runat="server"
                            SetFocusOnError="true" InitialValue="" CssClass="styleMandatoryLabel" ControlToValidate="txtLastCalculateDate"
                            ValidationGroup="btnProcess" ErrorMessage="Select the Last Calculated Date" Display="None"></asp:RequiredFieldValidator>--%>
                    </td>
               
                </tr>
                <tr>
                    <td class="styleFieldLabel">
                        <span class="styleDisplayLabel">Account Due Date</span>
                    </td>
                    <td class="styleFieldAlign">
                        <asp:CheckBox ID="chkAccountDueDate" runat="server" Checked="false" />
                    </td>
                    <td colspan="2">
                        <asp:Button ID="btnProcess" Text="Process" runat="server" CssClass="styleSubmitButton"
                            ValidationGroup="btnProcess" OnClick="btnProcess_Click" />
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="4">
                        <div class="container" style="max-height: 300px; width: 100%; overflow-x: hidden;
                            overflow-y: scroll; text-align: center; margin-top: 10px; margin-bottom: 20px;">
                            <asp:GridView ID="gvInterestAccured" runat="server" Width="98%" AutoGenerateColumns="false"
                                OnRowDataBound="gvInterestAccured_RowDataBound" HeaderStyle-CssClass="styleGridHeader"
                                RowStyle-HorizontalAlign="Center">
                                <RowStyle HorizontalAlign="Center" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Investment Serial No" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-Width="12%" HeaderStyle-Width="12%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInvestmentSerialNo" runat="server" Text='<%#Bind("INV_REF_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="18%"
                                        HeaderStyle-Width="18%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("inv_desc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Value" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                        HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblvalue" runat="server" Text='<%#Bind("Value") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Interest Amount" ItemStyle-HorizontalAlign="Right"
                                        ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInterestAmount" runat="server" Text='<%#Bind("INTERESTAMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Calculate Date" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLastCalculateDate" runat="server" Text='<%#Bind("LASTCALCULATEDDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblNo" runat="server"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                   <%-- <asp:TemplateField HeaderText="JV No" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                        HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblJVNo" runat="server" Text='<%#Bind("JV_No") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="JV Date" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                        HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblJVDate" runat="server" Text='<%#Bind("JV_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="JV Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                        HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblJVAmount" runat="server" Text='<%#Bind("JV_Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Exculde" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%"
                                        HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkITSelect" runat="server" Checked="false" AutoPostBack="false" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table width="100%" style="text-align: center;">
                                                <tr>
                                                    <td>
                                                        <span>Exclude</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="chkAll_None" runat="server" Checked="false" AutoPostBack="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invest_Start_Date" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInvst_Start_Date" runat="server" Text='<%#Bind("Invst_Start_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Maturity_Date" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMaturity_Date" runat="server" Text='<%#Bind("Maturity_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No_of_Units" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNo_of_Units" runat="server" Text='<%#Bind("NoofUnits") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit_Value" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnit_Value" runat="server" Text='<%#Bind("Face_Value") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From_Date" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFrom_Date" runat="server" Text='<%#Bind("From_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To_Date" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTo_Date" runat="server" Text='<%#Bind("To_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
                <tr class="styleButtonArea" style="padding-left: 4px">
                    <td align="center" colspan="4">
                        <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" Text="Post"
                            OnClick="btnSave_Click" ValidationGroup="btnSave" OnClientClick="return fnCheckPageValidators('btnSave')" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <asp:CustomValidator ID="cvInvestmentInterestAccrued" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                        <asp:ValidationSummary ID="vsInvestmentInterestAccrued" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />
                        <asp:ValidationSummary ID="vsProcess" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnProcess" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <%-- <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
