<%@ page title="" language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" inherits="Treasury_FA_Member, App_Web_insjbia3" enableeventvalidation="false" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagPrefix="cc1" TagName="LOV" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script type="text/javascript" >
    function PageUnload() {
        alert('');
    }

    function fnLoadCustomer() {
        document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
    }


</script>


    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" Text="Member Bank Details" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Member Bank Details">
                            <table width="100%">    
                                <tr>
                                    <%--Col1--%>
                                    <td width="50%">
                                        <%--table for Location and Funder Code --%>
                                        <table width="100%" cellpadding="2 px">
                                            <%--Row for Funder Code --%>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lblBankName" runat="server" Text="Bank Name:" Visible="false" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlBankName"
                                                        runat="server" ToolTip="Bank Name" Visible="false" AutoPostBack="false">
                                                    </asp:DropDownList>
                                                </td>
                                               <%-- <td>
                                                    <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ControlToValidate="ddlBankName"
                                                        ErrorMessage="Please select the bank name" Display="None" ValidationGroup="INVSum"
                                                        InitialValue="0"></asp:RequiredFieldValidator>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                                                <td class="styleFieldAlign" style="width: 30%;">
                                                                                    <%--<span class="styleDisplayLabel">Entity Code</span>--%>
                                                                                    <asp:Label runat="server" ID="lblEntityCode" Text="Bank Name :" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:Button ID="btnLoadCustomer"  AutoPostBack="false" runat="server" OnClick="btnLoadCustomer_OnClick"
                                                                                        Style="display: none;" Text="Load Customer" CausesValidation="false" />
                                                                                    <cc1:LOV ButtonEnabled="true" TextWidth="80%"   LOV_Code="CONSORT" DispalyContent="Code"
                                                                                        runat="server" ID="ucEntityLOV"></cc1:LOV>
                                                                                </td>
                                                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lblBankRole" runat="server" Text="Bank Role :" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlBankType" runat="server" ToolTip="Bank Role" AutoPostBack="false">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="1">Lead Banker</asp:ListItem>
                                                        <asp:ListItem Value="2">Second Lead Banker</asp:ListItem>
                                                        <asp:ListItem Value="3">Member Banker</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="rfvBankRole" runat="server" InitialValue="0" ControlToValidate="ddlBankType"
                                                        ErrorMessage="Bank Role should be selected" ValidationGroup="INVSum" Display="None"
                                                        Visible="true"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lblStart" runat="server" Text="Start Date :" />
                                                </td>
                                                <td class="styleFieldAlign" align="right">
                                                    <asp:TextBox ID="txtStart" Width="165px" ToolTip="Start Date" AutoPostBack="false"
                                                        runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStart"
                                                        PopupButtonID="Image2" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                </td>
                                                
                                                <td>
                                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtStart"
                                                        ErrorMessage="Please select a start date" ValidationGroup="INVSum" Display="None"
                                                        Visible="true"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lblCCrate" runat="server" Text="CC Rate:"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" align="right">
                                                    <asp:TextBox ID="txtCCRate" runat="server" Width="165px" ToolTip="CC Rate" ></asp:TextBox>
                                                </td>
                                                
                                                <td>
                                                 <asp:RequiredFieldValidator ID="rfvCCrate" runat="server" ControlToValidate="txtCCRate"
                                                        ErrorMessage="CC rate should be selected" ValidationGroup="INVSum" Display="None"
                                                        Visible="true"></asp:RequiredFieldValidator>
                                                             <%-- <cc1:FilteredTextBoxExtender ID="filCCRate" runat="server" FilterType="Custom"
                                                TargetControlID="txtCCRate">
                                            </cc1:FilteredTextBoxExtender>--%>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="50%">
                                        </table>
                                    </td>
                                    <td width="50%">
                                        <table width="100%" cellspacing="4px">
                                            <tr>
                                                <td width="100%">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label ID="lblSanc" runat="server" Text="Sanctioned Limit:">
                                                                </asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" align="right">
                                                                <asp:TextBox ID="txtSanc" runat="server" Width="165px" ToolTip="Sanction Limit"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="rfvSancLimit" runat="server" ControlToValidate="txtSanc"
                                                        ErrorMessage="Sanction Limit should be selected" ValidationGroup="INVSum" Display="None"
                                                        Visible="true"></asp:RequiredFieldValidator>
                                                         <%--  <cc1:FilteredTextBoxExtender ID="filSanc" runat="server" FilterType="Numbers"
                                                TargetControlID="txtSanc">
                                            </cc1:FilteredTextBoxExtender>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label ID="lblEndDate" runat="server" Text="End Date:">
                                
                                                                </asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" align="right">
                                                                <asp:TextBox ID="txtEndDate" Width="165px" ToolTip="End Date" ReadOnly="true" AutoPostBack="false"
                                                                    runat="server"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate"
                                                                    PopupButtonID="Image1" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />
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
                                        <asp:ValidationSummary ID="valSum" ValidationGroup="INVSum" runat="server" CssClass="styleMandatoryLabel"
                                            ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />
                                    </td>
                                </tr>
                               <tr>
                                    <td colspan="2" align="center">
                                    <table >
                                        <tr align="left">
                                          
                                            <td class="styleFieldAlign"  align="left">
                                                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="styleSubmitButton"
                                                    Text="Add" CausesValidation="true" ValidationGroup="INVSum" />
                                                <asp:Button ID="btnEdit" Visible="false" OnClick="Edit_Click" CausesValidation="true" ValidationGroup="INVSum" runat="server" CssClass="styleSubmitButton"
                                                    Text="Edit" />
                                                <asp:Button ID="BtnCancel" Visible="false" OnClick="btnCancel_Click" runat="server" CssClass="styleSubmitButton"
                                                    Text="Cancel" />
                                                <%--<asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" Text="Cancel" />--%>
                                                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" OnClientClick="return confirm('Are you sure want to Clear_FA?');" CssClass="styleSubmitButton" Text="Clear_FA" />
                                            </td>
                                        </tr>
                                    </table>
                                    
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <table width="750">
                <tr align="center">
                    <td align="center">
                        <asp:GridView ID="grvMem" OnRowDataBound="grvMem_RowDataBound" DataKeyNames="SlNo,Cons_Mem_Dtl_Id" AlternatingRowStyle-Width="1000" Visible="true" RowStyle-HorizontalAlign="Center"
                            runat="server" AutoGenerateColumns="false" OnRowDeleting="grvMem_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="SlNo" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSllno" runat="server"></asp:Label>
                                        <asp:HiddenField ID ="hdnConsMemDtlId" runat="server" Value='<%# Eval("Cons_Mem_Dtl_Id") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" Visible="true">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbtnMem" AutoPostBack="true" OnCheckedChanged="rdSelect_CheckedChanged"
                                            Visible="true" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bank Name" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBankName" runat="server" Text='<%# Eval("txtName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bank Role" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBankRole" runat="server" Text='<%# Eval("Bank_Role") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sanction Limit" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSanc" runat="server" Text='<%# Eval("Sanct_Limit") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Date" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstdate" runat="server" Text='<%# Eval("Start_Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Date" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblenddate" runat="server" Text='<%# Eval("End_Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CC Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCCRate" runat="server" Text='<%# Eval("CC_Rate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Additional Limit">
                                <ItemTemplate>
                                <asp:Button ID="imgAdd" runat="server"  Text="Additional Limit" CssClass="styleSubmitButton" /> 
                                </ItemTemplate>
                                </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CommandName="Delete"
                                                                        CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                            </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <%--<table>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnSave" Visible="false" runat="server" CssClass="styleSubmitButton"
                                Text="Save" OnClick="btnSave_Click" />
                        </td>
                    </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblSlNo" runat="server" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <%-- </table>--%>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
