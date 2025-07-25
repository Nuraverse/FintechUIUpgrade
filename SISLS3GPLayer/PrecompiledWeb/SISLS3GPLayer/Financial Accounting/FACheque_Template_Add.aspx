<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FACheque_Template_Add, App_Web_jj5zdzwe" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%">
        <tr width="100%">
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Cheque Template Format" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="upMaindetails" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlDepositFileFormat" GroupingText="Header Details" Height="100%" runat="server" CssClass="stylePanel">
                                        <table width="100%">
                                            <tr>
                                                 <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblCopyTemplate" Text="Copy Template"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtCopyTemplate" Width="165px" runat="server" ToolTip="Document Number"
                                                         />
                                                </td>
                                                 <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblTemplate" CssClass="styleMandatoryLabel" Text="Template Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                     <asp:TextBox ID="txtTemplateName" Width="165px" runat="server" ToolTip="Template Name"
                                                        ReadOnly="true" />
                                                </td>
                                                                                          
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblBankName" Text="Bank Name" />
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <uc:Suggest ID="ddlBankName" runat="server" ServiceMethod="GetBankList" WatermarkText="--Select--"
                                                        ValidationGroup="submit" ItemToValidate="Value"  ErrorMessage="Select Bank Name"
                                                         />
                                                </td> 
                                                 <td class="styleFieldLabel" width="25%" align="left">
                                                    <asp:Label runat="server" ID="lblActive" Text="Active"></asp:Label>
                                                    
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chkActive" runat="server" />
                                                </td>
                                                                                         
                                            </tr>

                                             <tr>
                                                 <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblChequeLength" Text="Cheque Length"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtChequeLength" Width="165px" runat="server" ToolTip="Cheque length"
                                                         />
                                                </td>
                                                 
                                                                                          
                                            </tr>
                                     <tr>
                                                <td align="center" colspan="4">
                                                    <asp:Panel runat="server" ID="pnlChequeTemplate" GroupingText="Cheque Template Details" CssClass="stylePanel"
                                                        Width="100%" >
                                                        <asp:GridView ID="gvchqTemplate" runat="server" CssClass="styleInfoLabel" ShowFooter="true" Width="99%" OnRowDataBound="gvchqTemplate_RowDataBound"    AutoGenerateColumns="False">

                                                            <Columns>
                                                                <asp:TemplateField HeaderText="From Position" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFrom" runat="server" Text='<%# Eval("From_Position")%>' Style="padding-right: 20px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtFrom" runat="server" MaxLength="3" Text='<%# Eval("From_Position")%>'
                                                                            Width="30px" Style="text-align: right"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvFrom1" runat="server" InitialValue="0" ControlToValidate="txtFrom"
                                                                            Display="None" ErrorMessage="From position can not be zero" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvFrom2" runat="server" ControlToValidate="txtFrom"
                                                                            Display="None" ErrorMessage="Enter the From position" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-right: 20px">
                                                                                    <asp:TextBox ID="txtFFrom" runat="server" MaxLength="3" Width="30px" Style="text-align: right"
                                                                                        ToolTip="From Position"></asp:TextBox>

                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender142" runat="server" TargetControlID="txtFFrom"
                                                                                        FilterType="Numbers" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="To Position" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTo" runat="server" Text='<%# Eval("To_position")%>' Style="padding-right: 20px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtTo" runat="server" MaxLength="3" Text='<%# Eval("To_position")%>'
                                                                            Width="30px" Style="text-align: right"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvTo1" runat="server" InitialValue="0" ControlToValidate="txtTo"
                                                                            Display="None" ErrorMessage="To position can not be zero" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                        
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-right: 20px">
                                                                                    <asp:TextBox ID="txtFTo" runat="server" MaxLength="3" ToolTip="To Position" Width="30px" 
                                                                                        Style="text-align: right"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtFTo"
                                                                                        FilterType="Numbers" />
                                                                                        
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>


                                                                <asp:TemplateField HeaderText="Column Name ID" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCode1" runat="server" Text='<%# Eval("Column_Name_ID") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblFCode1" runat="server" Text='<%# Eval("Column_Name_ID") %>' /></ItemTemplate>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Column Name" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("Column_Name") %>' Style="padding-left: 15px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="ddlType" runat="server" />
                                                                        <asp:RequiredFieldValidator ID="rfvddlType1" runat="server" InitialValue="0" ControlToValidate="ddlType"
                                                                            Display="None" ErrorMessage="Select a Field Description" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvddlType2" runat="server" ControlToValidate="ddlType"
                                                                            Display="None" ErrorMessage="Select a Field Description" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                    </EditItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-left: 15px">
                                                                                    <asp:DropDownList ID="ddlFType" runat="server" ToolTip="Field Type">
                                                                                    </asp:DropDownList>                                                                                 
                                                                                    <asp:RequiredFieldValidator ID="rfvddlField" runat="server" ControlToValidate="ddlFType" InitialValue="0"
                                                                                        Display="None" ErrorMessage="Select a Column Name" ValidationGroup="Add" Enabled ="false">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Length" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLength" runat="server" MaxLength="3" Text='<%# Eval("Length")%>'
                                                                            Style="padding-right: 10px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtLength" runat="server" MaxLength="3" Text='<%# Eval("Length")%>'
                                                                            Width="30px" Style="text-align: right"></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-right: 10px">
                                                                                    <asp:TextBox ID="txtFLength" runat="server" MaxLength="3" TabIndex="-1" ToolTip="Length" 
                                                                                        Width="30px" Style="text-align: right">
                                                                                    </asp:TextBox>
                                                                                          <asp:RequiredFieldValidator ID="RFVlength" runat="server" ControlToValidate="txtFLength"
                                                                                        Display="None" ErrorMessage="Enter Length" ValidationGroup="Add" Enabled ="false">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Alignment">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAlignment" runat="server" Text='<%# Eval("Alignment") %>' ></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlFTRAlignment" runat="server" ToolTip="Alignment" >
                                                                        </asp:DropDownList>
                                                                         <asp:RequiredFieldValidator ID="RFVFTRAlignment" runat="server" InitialValue="0" ControlToValidate="ddlFTRAlignment"
                                                                            Display="None" ErrorMessage="Select Alignment" ValidationGroup="Add" Enabled ="false">
                                                                        </asp:RequiredFieldValidator>
                                                                    </FooterTemplate>
                                                                    <ItemStyle Width="50px" HorizontalAlign="Left"  />
                                                                </asp:TemplateField>
                                                              <%--     <asp:TemplateField HeaderText="Trim By">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbltrimby" runat="server" Text='<%# Eval("Trim_by") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlFTRtrimby" runat="server" ToolTip="Trim by">
                                                                        </asp:DropDownList>
                                                                         <asp:RequiredFieldValidator ID="RFVFTRtrimby" runat="server" InitialValue="0" ControlToValidate="ddlFTRtrimby"
                                                                            Display="None" ErrorMessage="Select Trim by" ValidationGroup="Add" Enabled ="false">
                                                                        </asp:RequiredFieldValidator>
                                                                    </FooterTemplate>
                                                                    <ItemStyle Width="50px" HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField HeaderText="Delimiter">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbldelimitor" runat="server" Text='<%# Eval("Delimiter") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlFTRdelimitor" runat="server" ToolTip="Delimiter" >
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RFVFFTRdelimitor" runat="server" InitialValue="0" ControlToValidate="ddlFTRdelimitor"
                                                                            Display="None" ErrorMessage="Select Delimiter" ValidationGroup="Add" Enabled ="false">
                                                                        </asp:RequiredFieldValidator>
                                                                    </FooterTemplate>
                                                                    <ItemStyle Width="50px" HorizontalAlign="Left" />
                                                                </asp:TemplateField>--%>
                                                                <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnRemove" runat="server" CausesValidation="false" CommandName="Delete"
                                                                            CssClass="styleGridShortButton" Text="Delete" ToolTip="Delete"></asp:Button>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                            ValidationGroup="Add" ToolTip="Update" OnClientClick="return fnCheckPageValidators('Add','false');"></asp:LinkButton>
                                                                        &nbsp;|
                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Button ID="btnAddrow"  runat="server" CommandName="AddNew"
                                                                            ToolTip="Add" CssClass="styleGridShortButton" Text="Add" ValidationGroup="Add"></asp:Button>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>

                                                            </Columns>


                                                        </asp:GridView>


                                                    </asp:Panel>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br />

                                </td>

                            </tr>

                            <tr>
                                <td colspan="4" align="center">

                                    <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" Text="Save"
                                        ValidationGroup="submit" OnClientClick="return fnCheckPageValidators('submit');"
                                        ToolTip="Save,Alt+S" AccessKey="S" />
                                    <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" OnClick="btnClear_Click" Text="Clear_FA"
                                        CausesValidation="False" ToolTip="Clear_FA,Alt+L" AccessKey="L" />
                                   

                                    <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" CssClass="styleSubmitButton" CausesValidation="False"
                                        Text="Exit" ToolTip="Cancel,Alt+X" AccessKey="X" />
                                </td>


                            </tr>
                            <tr>

                                <td colspan="4" align="left">
                                    <asp:ValidationSummary ValidationGroup="submit" ID="vsSummary" runat="server"
                                        CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />

                                     <asp:ValidationSummary ValidationGroup="Add" ID="ValidationGridSummary" runat="server"
                                        CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />

                                </td>
                            </tr>


                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function FunCheckForOverlap(type, txtFrm, txtTo, txtLn, PrevTo, ddlType, ddlDEPType) {

            var From = document.getElementById(txtFrm).value;
            var To = document.getElementById(txtTo).value;
            var Length = document.getElementById(txtLn).value;
            var ddlCtrl = document.getElementById(ddlType);
            var ddlVal = ddlCtrl.options[ddlCtrl.selectedIndex].value
            var ddlDEPCtrl = document.getElementById(ddlDEPType);
            var ddlDEPVal = ddlDEPCtrl.options[ddlDEPCtrl.selectedIndex].value

            if (type == 1) {
                if (From == '' || From == 0) {
                    document.getElementById(txtLn).value = '';
                    alert('Enter From Position.');
                    document.getElementById(txtFrm).focus();
                    return false;
                }
                else if (parseFloat(ddlVal) == 0) {
                    alert('Select Field Description.');
                    ddlCtrl.focus();
                    return false;
                }
                if (parseInt(ddlDEPVal) == 6)//
                {
                    if (To == '' || To == 0) //
                    {
                        document.getElementById(txtLn).value = '';
                        alert('To Position should not be Zero/Empty.');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else if (parseFloat(From) > parseFloat(To)) //
                    {
                        alert('To postion getting overlap');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else //
                    {
                        //document.getElementById(txtTo).value = parseFloat(To);
                        document.getElementById(txtLn).value = (parseInt(To) - parseInt(From)) + 1;
                        //document.getElementById(txtLn).value = From + 1;
                    }
                }
            }
            else if (type == 2) {
                if (From == '' || From == 0) {
                    document.getElementById(txtLn).value = '';
                    alert('Enter From Position.');
                    document.getElementById(txtFrm).focus();
                    return false;
                }

                else if (parseFloat(ddlVal) == 0) {
                    alert('Select Field Type & Description.');
                    ddlCtrl.focus();
                    return false;
                }
                if (parseInt(ddlDEPVal) == 6)//
                {
                    if (To == '' || To == 0) {
                        document.getElementById(txtLn).value = '';
                        alert('To Position should not be Zero/Empty.');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else if (parseInt(PrevTo) >= parseInt(From)) {
                        alert('From postion getting overlap');
                        document.getElementById(txtFrm).focus();
                        return false;
                    }
                    else if (parseFloat(From) > parseFloat(To)) {
                        alert('To postion getting overlap');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else {
                        document.getElementById(txtTo).value = parseFloat(To);
                        document.getElementById(txtLn).value = (parseInt(To) - parseInt(From)) + 1;
                    }
                }
            }
        }


        function fnDoDate1(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation) {


            var s = el.value;
            var d, m, y;
            var erString = 'Enter the valid date format (' + eFormat + ')';
            var len = s.length;
            var DtConvDate;
            if (eFormat == 'MM/dd/yyyy' || eFormat == 'MM-dd-yyyy') {
                //alert('Front mm');
                if (10 == len) {
                    d = s.substring(3, 5);
                    m = s.substring(0, 2);
                    y = s.substring(6, 10);
                }
                else if (8 == len) {
                    d = s.substring(2, 4);
                    m = s.substring(0, 2);
                    y = s.substring(4, 8);
                }
                else if (6 == len) {
                    d = s.substring(2, 4);
                    m = s.substring(0, 2);
                    y = '20' + s.substring(4, 6);
                }
                else if (0 == len) {
                    erString = '';
                }
                else if (11 == len) {
                    d = s.substring(3, 6);
                    m = s.substring(0, 2);
                    y = s.substring(7, 11);

                    if (m.toUpperCase() == 'JAN')
                        m = '01';
                    if (m.toUpperCase() == 'FEB')
                        m = '02';
                    if (m.toUpperCase() == 'MAR')
                        m = '03';
                    if (m.toUpperCase() == 'APR')
                        m = '04';
                    if (m.toUpperCase() == 'MAY')
                        m = '05';
                    if (m.toUpperCase() == 'JUN')
                        m = '06';
                    if (m.toUpperCase() == 'JUL')
                        m = '07';
                    if (m.toUpperCase() == 'AUG')
                        m = '08';
                    if (m.toUpperCase() == 'SEP')
                        m = '09';
                    if (m.toUpperCase() == 'OCT')
                        m = '10';
                    if (m.toUpperCase() == 'NOV')
                        m = '11';
                    if (m.toUpperCase() == 'DEC')
                        m = '12';
                }
            }
            else {
                //alert('Front dd');
                if (10 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(3, 5);
                    y = s.substring(6, 10);
                }
                else if (8 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(2, 4);
                    y = s.substring(4, 8);
                }
                else if (6 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(2, 4);
                    y = '20' + s.substring(4, 6);
                }
                else if (0 == len) {
                    erString = '';
                }
                else if (11 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(3, 6);
                    y = s.substring(7, 11);

                    if (m.toUpperCase() == 'JAN')
                        m = '01';
                    if (m.toUpperCase() == 'FEB')
                        m = '02';
                    if (m.toUpperCase() == 'MAR')
                        m = '03';
                    if (m.toUpperCase() == 'APR')
                        m = '04';
                    if (m.toUpperCase() == 'MAY')
                        m = '05';
                    if (m.toUpperCase() == 'JUN')
                        m = '06';
                    if (m.toUpperCase() == 'JUL')
                        m = '07';
                    if (m.toUpperCase() == 'AUG')
                        m = '08';
                    if (m.toUpperCase() == 'SEP')
                        m = '09';
                    if (m.toUpperCase() == 'OCT')
                        m = '10';
                    if (m.toUpperCase() == 'NOV')
                        m = '11';
                    if (m.toUpperCase() == 'DEC')
                        m = '12';

                    //alert(m);
                }
            }

            // debugger;            
            if (checkDate(y, m, d)) {
                if (eFormat == 'dd/MM/yyyy')
                    el.value = d + '/' + monthNo[m - 1] + '/' + y;
                if (eFormat == 'dd-MM-yyyy')
                    el.value = d + '-' + monthNo[m - 1] + '-' + y;
                if (eFormat == 'MM/dd/yyyy')
                    el.value = monthNo[m - 1] + '/' + d + '/' + y;
                if (eFormat == 'MM-dd-yyyy')
                    el.value = monthNo[m - 1] + '-' + d + '-' + y;
                if (eFormat == 'dd-MMM-yyyy') {
                    el.value = d + '-' + monthNames[m - 1] + '-' + y;
                    DtConvDate = monthNo[m - 1] + '/' + d + '/' + y;
                }

                erString = '';
            }
            if (document.getElementById) {
                //document.getElementById(erID).innerHTML = erString;
                //document.getElementById(erID).value = erString;                
                if (erString != "") {
                    alert(erString);
                    document.getElementById(erID).value = "";
                }
            }
            if (erString) {
                if (el.focus) {
                    el.focus();
                }
            }
            var varEnteredDateValue;
            var varEnteredDate;
            //var varEnteredDateVal = varEnteredDate;                          
            var vartoday = new Date();
            var dd = vartoday.format('MM/dd/yyyy');

            var varCurrentDate = Date.parse(dd);

            if (eFormat == 'dd-MMM-yyyy') {
                varEnteredDateValue = Date.parse(DtConvDate);
            }
            else {
                //varEnteredDate= d + '/' + monthNo[m-1] + '/' + y;     
                varEnteredDate = monthNo[m - 1] + '/' + d + '/' + y;
                varEnteredDateValue = Date.parse(varEnteredDate);
            }
            if (IsFutureDateValidation == true) {
                if (varEnteredDateValue > varCurrentDate) {
                    alert('Entered date cannot be greater than system date');
                    document.getElementById(erID).value = '';
                }
            }
            if (IsBackDateValidation == true) {
                if (varEnteredDateValue < varCurrentDate) {
                    alert('Entered date cannot be less than system date');
                    document.getElementById(erID).value = '';
                }
            }

            if (IsBackDateValidation == 'P') {
                if (varEnteredDateValue >= varCurrentDate) {
                    alert('Entered date cannot be greater than or equal to system date');
                    document.getElementById(erID).value = '';
                }
            }
            //if (IsBackDateValidation == 'F') {
            //    if (varEnteredDateValue <= varCurrentDate) {
            //        alert('Entered date cannot be less than or equal to system date');
            //        document.getElementById(erID).value = '';
            //    }
            //}
        }

    </script>
</asp:Content>