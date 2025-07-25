<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_FunderLoading, App_Web_insjbia3" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Funder Loading Details">
                    <table width="100%">
                        <tr>
                            <%--Col1--%>
                            <td width="50%">
                                <%--table for Location and Funder Code --%>
                                <table width="100%">
                                    <%--Row for Funder Code --%>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code/Name"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:DropDownList ID="ddlFunderCode" runat="server" ToolTip="Funder Code/Name" AutoPostBack="true"
                                                Width="169px" OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged" />
                                            <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                            <asp:RequiredFieldValidator ID="rfvFunderCode" runat="server" ControlToValidate="ddlFunderCode"
                                                InitialValue="0" ErrorMessage="Select Funder Code/Name" Display="None" SetFocusOnError="True"
                                                ValidationGroup="VgGo" />
                                        </td>
                                    </tr>
                                    <%--Row for Location --%>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                        </td>
                                        <td class="styleFieldAlign">
                                      <%--  <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" Width="141px"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>--%>
                                 <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" ItemToValidate ="Value" />
                                            <%--<asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" Width="170px" />--%>
                                            <%-- AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblGLCode" Text="Account" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtGLCode" onmouseover="txt_MouseoverTooltip(this)" Width="165px" ToolTip="Account" runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblSLCode" Text="Sub Account" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtSLCode" onmouseover="txt_MouseoverTooltip(this)" Width="165px" ToolTip="Sub Account" runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="ibiAddress"  Text="Address" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtAddress" Width="165px"   onmouseover="txt_MouseoverTooltip(this)" ToolTip="Address" TextMode="MultiLine"
                                                runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblPhone" Text="Phone" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtPhone" Width="100px"  onmouseover="txt_MouseoverTooltip(this)" ToolTip="Phone" runat="server" ReadOnly="true" />
                                            <%--   <asp:Label runat="server" ID="tbtMobile" Text="[M]" />
                                <asp:TextBox ID="txtMobile" Width ="165px" runat="server" ReadOnly="true" />--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblMail" Text="EMail Id" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtMail" Width="165px"  onmouseover="txt_MouseoverTooltip(this)" ToolTip="Email Id" runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblWeb" Text="Web Site" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtWeb" Width="165px"  onmouseover="txt_MouseoverTooltip(this)" ToolTip="Web Site" runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>
                                </table>
                                <%--Custom Control for Address--%>
                                <%--  <table width="100%">
                      <tr> 
                            
                            <td width="50%">
                            <uc1:FAAddressDetail ID="FAAddressDetail" ActiveViewIndex="1" ShowCode ="false" ShowName ="false"  runat="server" 
                             FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                            </td>
                            </tr>
                       </table>--%>
                            </td>
                            <%--Col2--%>
                            <td width="50%">
                                <%--table for Funder Code and Amount details --%>
                                <table width="100%">
                                    <tr>
                                        <td width="100%">
                                            <table width="100%">
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label ID="lblFLNo" Text="Funder Loading Number" runat="server" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="50%">
                                                        <asp:TextBox ID="txtFL_Docno" ToolTip="Funder Loading Number" Width="165px" ReadOnly="true"
                                                            onmouseover="txt_MouseoverTooltip(this)"  runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblDate" Text="Date"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtDate" Width="165px" ToolTip="Allocation Date" runat="server"
                                                            onmouseover="txt_MouseoverTooltip(this)"  ReadOnly="true" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblLastAllocDate" Text="Last Allocated Date"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLastAllocDate" Width="165px" ToolTip="Last Allocated Date" runat="server"
                                                             onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblFunderDueAmt" Text="Funder Due Amount" />
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtFunderDueAmt" Width="165px" Style="text-align: right;" ToolTip="Funder Due Amount"
                                                            onmouseover="txt_MouseoverTooltip(this)"  runat="server" ReadOnly="true" />
                                                        <asp:HiddenField ID="hdn_DueAmount" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblAllocatedAmt" Text="Allocated Amount" />
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtAllocatedAmt" Width="165px" Style="text-align: right;" ToolTip="Allocated Amount"
                                                            onmouseover="txt_MouseoverTooltip(this)"  runat="server" ReadOnly="true" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%">
                                            <asp:Panel ID="pnldateRange" Width="98%" runat="server" GroupingText="Date Range"
                                                CssClass="stylePanel">
                                                <%--table for Date Range details  --%>
                                                <table width="100%">
                                                    <tr>
                                                        <%-- <td class="styleFieldLabel" width="25%">
                               <asp:Label runat="server" ID="lblDateRange"  Text="Date Range" />  
                            </td>--%>
                                                        <td class="styleFieldLabel" width="52%">
                                                            <asp:Label runat="server" ID="lblFromDate" Text="From" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox runat="server" ID="txtFromDate" Width="165px"
                                                             onmouseover="txt_MouseoverTooltip(this)"  OnTextChanged ="txtFromDate_TextChanged" ToolTip="From Date" />
                                                            <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate1"
                                                                PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="50%">
                                                                <asp:Label runat="server" ID="lblToDate" Text="To" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtToDate" ToolTip="To Date" 
                                                                 onmouseover="txt_MouseoverTooltip(this)" OnTextChanged ="txtToDate_TextChanged" Width="165px" />
                                                                <%-- <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate2"
                                                                    PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="50%">
                                                                <asp:Label runat="server" ID="lblShowAll" Text="Show All" />
                                                            </td>
                                                            <td class="styleFieldAlign" align="left">
                                                                <asp:CheckBox ID="chkShowAll" runat="server" ToolTip="Show All" AutoPostBack="true"
                                                                    OnCheckedChanged="chkShowAll_OnCheckedChanged" />
                                                                &nbsp; &nbsp;
                                                                <asp:Button ID="btnGo" runat="server" Enabled="true" Text="Go" ToolTip="To list the Accounts for Allocation"
                                                                  ValidationGroup="VgGo"  CssClass="styleSubmitButton" OnClick="btnGo_Click" />
                                                            </td>
                                                        </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <%--For Showing Grid--%>
        <tr>
            <td>
                <asp:Panel ID="pnlLaoding" runat="server" Visible="false" GroupingText="Accounts To Allocate"
                    Width="100%" CssClass="stylePanel">
                    <div style="height: 250px; overflow: auto">
                        <asp:Panel ID="pnlScroll" runat="server" GroupingText="" CssClass="stylePanel">
                            <asp:GridView ID="gvLoading" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                OnRowDataBound="gvLoading_RowDataBound" Width="99%">
                                <Columns>
                                    <%--Serial Number--%>
                                    <asp:TemplateField HeaderText="Sl No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                            <asp:HiddenField ID="hdn_DTL_ID" Value='<%#Eval("ACCRowNo") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--Funder Reference Number --%>
                                    <%-- <asp:TemplateField HeaderText="Funder Reference Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Funder Reference Number" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                    <%--LOB_ID --%>
                                    <asp:TemplateField HeaderText="Line of Business">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLOB" runat="server" Text='<%#Eval("LOBName") %>' ToolTip="Line of Business" />
                                            <asp:HiddenField ID="hdnLOB_ID" Value='<%#Eval("LOB_ID") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--Customer Name--%>
                                    <asp:TemplateField HeaderText="Customer Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCustName" runat="server" Text='<%#Eval("Customer_Name") %>' ToolTip="Customer Name" />
                                            <asp:HiddenField ID="hdnCustomer_ID" Value='<%#Eval("Customer_ID") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--Received Amount--%>
                                    <asp:TemplateField HeaderText="Prime Account Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPANum" runat="server" Text='<%#Eval("PANum") %>' ToolTip="Prime Account Number" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--JV Reference Number--%>
                                    <asp:TemplateField HeaderText="Sub Account Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSANum" runat="server" Text='<%#Eval("SANum") %>' ToolTip="Sub Account Number" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAccountDate" runat="server" Text='<%#Eval("Account_Date") %>' ToolTip="Account Date" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--Received Amount--%>
                                    <asp:TemplateField HeaderText="Maturity Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMaturityDate" runat="server" Text='<%#Eval("Maturity_Date") %>'
                                                ToolTip="Maturity Date" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--JV Reference Number--%>
                                    <asp:TemplateField HeaderText="Net Exposure">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNetExposureT" runat="server" Text='<%#Eval("Net_Exposure") %>'
                                                ToolTip="Net Exposure" />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblNetExposure" runat="server" Text='<%#Eval("TotAlloc_Amt") %>' ToolTip="Net Exposure" />
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Allocation">
                                        <HeaderTemplate>
                                            <asp:Label ID="HlblSelect" runat="server" Text="Select All" />
                                            <br />
                                            <asp:CheckBox ID="chkSelectAll" Checked="false" runat="server" ToolTip="Select All" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                        <%--Modified By Chandrasekar K On 31-08-2012--%>
                                            <%--<asp:CheckBox ID="chkAllocation" runat="server" Checked='<%#Eval("Allocation_Status") %>'
                                                ToolTip="Allocation" />--%>
                                            <asp:CheckBox ID="chkAllocation" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "Allocation_Status").ToString().ToUpper() == "TRUE"%>' ToolTip="Allocation" />
                                            <%-- OnCheckedChanged="Calculate_AllocationAmt" 
                                             <asp:Label ID="lblAllocation"  runat="server" Text='<%#Eval("Allocation_Status") %>' ToolTip="Allocation" />--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <%--Received Amount--%>
                                    <asp:TemplateField HeaderText="Remarks">
                                        <ItemTemplate>
                                            <%--  <asp:Label ID="lblRemarks" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Remarks" />--%>
                                            <asp:TextBox ID="txtRemarks" TextMode="MultiLine" Width="100px" runat="server" Text='<%#Eval("Remarks") %>'
                                             onblur="FunTrimwhitespace(this,'Remarks');"  onkeyup="maxlengthfortxt(100);"   ToolTip="Remarks"></asp:TextBox>
                                            <asp:HiddenField ID="hdn_NewOld" Value='<%#Eval("New_Old") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click"
                    ToolTip="Save" Text="Save" CausesValidation="true" OnClientClick="return fnCheckPageValidators('Main')"
                    ValidationGroup="Main" />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    ToolTip="Clear_FA" Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    ToolTip="Cancel" Text="Cancel" OnClick="btnCancel_Click" />
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsFunderLoading" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                   ValidationGroup="VgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvFunderLoading" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
                <input id="hidDate" type="hidden" runat="server" />

    <script type="text/javascript"> 

 function fnGetValue(lblNetExposureT,chkAllocation,grdid,chkAll,objid) 
 {
        
         var TotAlloc = document.getElementById('<%=txtAllocatedAmt.ClientID %>');
         var NetExpo = document.getElementById(lblNetExposureT).innerText;//.value;
         var chk = document.getElementById(chkAllocation);
         var amt=0;
         
         if(chk.checked)
         {
             if(isNaN(parseFloat(TotAlloc.value)))
                 TotAlloc.value=parseFloat (NetExpo);
             else
                 TotAlloc.value=parseFloat (TotAlloc.value)+parseFloat (NetExpo );
         }
         else
         {
            if(isNaN(parseFloat(TotAlloc.value)))
                 TotAlloc.value=parseFloat (NetExpo);
             else
                 TotAlloc.value=parseFloat (TotAlloc.value)-parseFloat (NetExpo );
         }
         
         var Hdn_Amt = document.getElementById('<%=hdn_DueAmount.ClientID %>');
         fnGridUnSelect(grdid,chkAll,objid);
 }

function fnSelectAllTotal(grdid, obj, objlist)
{
         var id="ctl00_ContentPlaceHolder1_gvLoading_ctl03_lblNetExposureT";
         var TotAlloc = document.getElementById('<%=txtAllocatedAmt.ClientID %>');
         var NetExpo;// = document.getElementById(id).innerText;//.value;
         var amt=0;
         var chk = document.getElementById(obj.id);
         if(chk.checked)
         {
             var j = 2;
             NetExpo = document.getElementById(grdid + '_ctl0' + j + '_lblNetExposureT');//.innerText;  
             while (NetExpo != null)
             {
                if(isNaN(parseFloat(NetExpo.innerText)))
                    amt=amt;
                else
                    amt=amt+parseFloat(NetExpo.innerText);
                j = j + 1;
        
                if(j<=9) 
                    NetExpo = document.getElementById(grdid + '_ctl0' +j + '_lblNetExposureT');//.innerText;
                else
                    NetExpo = document.getElementById(grdid + '_ctl' +j+ '_lblNetExposureT');//.innerText;
            }
         }
         TotAlloc.defaultValue=0;
         TotAlloc.value=amt ; 
         var Hdn_Amt = document.getElementById('<%=hdn_DueAmount.ClientID %>');
        
         fnDGSelectOrUnselectAll(grdid, obj, objlist) ;
}



function checkDate_NextSystemDate1(sender, args) {
    var today = new Date();
    if (sender._selectedDate > today) {
       
        //alert('You cannot select a date greater than system date');
        alert('From date cannot be greater than system date');
        sender._textbox.set_Value(today.format(sender._format));

    }   
    document.getElementById(sender._textbox._element.id).focus();
    
}


function checkDate_NextSystemDate2(sender, args) {
    var today = new Date();
    if (sender._selectedDate > today) {
       
        //alert('You cannot select a date greater than system date');
        alert('To date cannot be greater than system date');
        sender._textbox.set_Value(today.format(sender._format));

    }
    document.getElementById(sender._textbox._element.id).focus();
    
}


    </script>

</asp:Content>
