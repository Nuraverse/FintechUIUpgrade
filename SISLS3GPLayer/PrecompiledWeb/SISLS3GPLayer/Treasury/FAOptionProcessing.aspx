<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAOptionProcessing, App_Web_insjbia3" title="Option Processing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr width="100%">
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Option Processing" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <cc1:TabContainer ID="tcFunderTransaction" runat="server" CssClass="styleTabPanel"
                    Width="99%" TabStripPlacement="top" ActiveTabIndex="0">
                    <cc1:TabPanel runat="server" HeaderText="Funder Details" ID="tbGeneral" CssClass="tabpan"
                        BackColor="Red" TabIndex="0">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upGeneral" runat="server">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Funder Informations" ID="pnlFunderInfo" runat="server" CssClass="stylePanel">
                                        <table width="100%" border="0" cellspacing="0">
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblDealNumber" CssClass="styleReqFieldLabel" Text="Deal Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:DropDownList ID="ddlDealNumber" runat="server" ToolTip="Deal Number" Width="170px"
                                                                    OnSelectedIndexChanged="ddlDealNumber_SelectedIndexChanged" AutoPostBack="true">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDealNumber"
                                                                    InitialValue="0" ErrorMessage="Select Deal Number" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblTrancheRefNo" CssClass="styleReqFieldLabel" Text="Tranche/Serial Ref No"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:DropDownList ID="ddlTrancheRefNo" OnSelectedIndexChanged="ddlTrancheRefNo_SelectedIndexChanged"
                                                                    AutoPostBack="true" runat="server" ToolTip="Tranche Ref No" Width="170px">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTrancheRefNo"
                                                                    InitialValue="0" ErrorMessage="Select Tranche Ref No" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblFunderTranNo" Text="Funder Transaction Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <%--<asp:TextBox ID="txtFunderTranNo" Width="165px" runat="server" ToolTip="Funder Transaction Number"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />--%>
                                                                <asp:DropDownList ID="ddlFunderTranNo" OnSelectedIndexChanged="ddlFunderTranNo_SelectedIndexChanged"
                                                                    AutoPostBack="true" runat="server" ToolTip="Funder Transaction Number" Width="170px">
                                                                </asp:DropDownList>
                                                                 <asp:RequiredFieldValidator ID="RFddlFunderTranNo" runat="server" ControlToValidate="ddlFunderTranNo"
                                                                    InitialValue="0" ErrorMessage="Select Funder Transaction Number" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <%-- <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblTranDate" Text="Funder Transaction Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:TextBox ID="txtFundTransDate" runat="server" Width="165px" ToolTip="Funder Transaction Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>--%>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="Label1" Text="Call/Put Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:TextBox ID="txtcallputDate" runat="server" ToolTip="Call/Put Date" onmouseover="txt_MouseoverTooltip(this)"
                                                                    Width="75%" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblValidUpto" CssClass="styleReqFieldLabel" Text="Maturity Date" />
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:TextBox ID="txtValidUpto" ReadOnly="true" runat="server" Width="75%" ToolTip="Valid Upto" onmouseover="txt_MouseoverTooltip(this)" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td colspan="2" valign="top">
                                                    <table width="100%" align="center" cellspacing="0">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblCallPutNo" Text="Call/Put No"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtCallPutNo" runat="server" Width="165px" ToolTip="Call/Put No"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code/Name"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <asp:DropDownList ID="ddlFunderCode" runat="server" ToolTip="Funder Code/Name" Width="170px" />
                                                                <%--<asp:TextBox ID="txtFunderCode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    Width="165px" ToolTip="Funder Name" ReadOnly="true" />--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtLocation" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    Width="165px" ToolTip="Location" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblComcity" runat="server" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComCity" runat="server" MaxLength="30" Width="60%" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComState" runat="server" MaxLength="60" Width="60%" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComCountry" runat="server" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComCountry" runat="server" MaxLength="60" Width="37%" ReadOnly="true"></asp:TextBox>
                                                                <asp:Label ID="lblCompincode" runat="server" CssClass="styleReqFieldLabel" Text="Pin"></asp:Label>
                                                                <asp:TextBox ID="txtComPincode" runat="server" ReadOnly="true" Width="34%" ></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Panel ID="pnlCurrencyInfo" runat="server" GroupingText="facility Details">
                                                        <table width="100%">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCurrecncyCode" Text="Foreign Currency"></asp:Label>
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCurrencyValue" Text="Currency (INR)"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCurrecncyCode" runat="server" Width="75%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCurrencyValue" runat="server" Width="40%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCommitmentAmt" CssClass="styleReqFieldLabel" Text="Commitment Amount (FC)" />
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCommitmentAmtINR" CssClass="styleReqFieldLabel"
                                                                                    Text="Commitment Amount (INR)" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCommitAmt" runat="server" Width="100%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right"/>
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCommitAmtINR" runat="server" Width="90%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                        </tr>
                                                                         <tr>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblReceivedAmt" CssClass="styleReqFieldLabel" Text="Received Amount (FC)" />
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblReceivedAmtINR" CssClass="styleReqFieldLabel"
                                                                                    Text="Received Amount (INR)" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtReceivedAmt" runat="server" Width="100%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtReceivedAmtINR" runat="server" Width="90%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td colspan="2">
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <tr>
                                                                                    <td class="styleFieldLabel" width="25%">
                                                                                        <asp:Label runat="server" ID="lblTenure" CssClass="styleReqFieldLabel" Text="Tenure" />
                                                                                    </td>
                                                                                    <td class="styleFieldAlign" width="20%">
                                                                                        <asp:DropDownList ID="ddlTenureType" runat="server" ToolTip="Interest Tenure Type"
                                                                                            Width="100px" />
                                                                                        <asp:TextBox ID="txtTenure" runat="server" ToolTip="Tenure" Width="50%" Style="text-align: right;" ReadOnly="true"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" onblur="ChkIsZero(this,'Tenure')" onkeypress="fnAllowNumbersOnly(false,false,this)" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="styleFieldLabel" width="25%">
                                                                                        <asp:Label runat="server" ID="lblInterestCalc" CssClass="styleReqFieldLabel" Text="Interest Calculation" />
                                                                                    </td>
                                                                                    <td class="styleFieldAlign" width="25%">
                                                                                        <asp:DropDownList ID="ddlInterestCalc" runat="server" ToolTip="Interest Calculation"
                                                                                            Width="100px" />
                                                                                        <%--<asp:TextBox ID="txtInterestCalc" runat="server" ToolTip="Tenure" Width="50%" Style="text-align: right;"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" onblur="ChkIsZero(this,'Tenure')" onkeypress="fnAllowNumbersOnly(false,false,this)" />--%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="styleFieldLabel" width="25%">
                                                                                        <asp:Label runat="server" ID="lblInterestLevy" CssClass="styleReqFieldLabel" Text="Interest Credit" />
                                                                                    </td>
                                                                                    <td class="styleFieldAlign" width="25%">
                                                                                        <asp:DropDownList ID="ddlInterestLevy" runat="server" ToolTip="Interest Credit" Width="100px" />
                                                                                        <%--<asp:TextBox ID="txtInterestLevy" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                                            ToolTip="Interest Credit start date" Width="75%" />--%>
                                                                                    </td>
                                                                                </tr>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Panel ID="PnlCallput" runat="server" GroupingText="Call Put Details">
                                                        <table>
                                                            <tr>
                                                                <td class="styleFieldLabel" width="20%">
                                                                    <asp:Label runat="server" ID="lblOption" Text="Option"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" width="25%">
                                                                    <asp:DropDownList ID="ddlOption" runat="server" ToolTip="Option" Width="170px" />
                                                                    <asp:RequiredFieldValidator ID="RFVddlOption" runat="server" ControlToValidate="ddlOption"
                                                                        InitialValue="0" ErrorMessage="Select Option" Display="None" SetFocusOnError="True"
                                                                        ValidationGroup="Main" />
                                                                </td>
                                                                <td class="styleFieldLabel" width="20%">
                                                                    <asp:Label runat="server" ID="lblType" Text="Type"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" width="25%">
                                                                    <asp:DropDownList ID="ddlType" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" runat="server" ToolTip="Type" Width="170px" />
                                                                    <asp:RequiredFieldValidator ID="RFVddlType" runat="server" ControlToValidate="ddlType"
                                                                        InitialValue="0" ErrorMessage="Select Type" Display="None" SetFocusOnError="True"
                                                                        ValidationGroup="Main" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel" width="20%">
                                                                    <asp:Label runat="server" ID="lblRepayAmt" CssClass="styleReqFieldLabel" Text="Repay Amount" />
                                                                </td>
                                                                <td class="styleFieldAlign" width="25%">
                                                                    <asp:TextBox ID="txtRepayAmt" runat="server" Width="100%" ToolTip="Repay Amount"
                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" AutoPostBack="true"
                                                                        OnTextChanged="txtRepayAmt_TextChanged" />
                                                                    <asp:RequiredFieldValidator ID="RFtxtRepayAmt" runat="server" ControlToValidate="txtRepayAmt"
                                                                       CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                        ErrorMessage="Enter Repay Amount" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td class="styleFieldLabel" width="20%">
                                                                    <asp:Label runat="server" ID="lblCFDraw" Text="Contiue Funding Draw"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" width="25%">
                                                                    <asp:DropDownList ID="ddlCFDraw" runat="server" ToolTip="Contiue Funding Draw" Width="170px" />
                                                                    <asp:RequiredFieldValidator ID="RFVddlCFDraw" runat="server" ControlToValidate="ddlCFDraw"
                                                                        InitialValue="0" ErrorMessage="Select Contiue Funding Draw" Display="None" SetFocusOnError="True"
                                                                        ValidationGroup="Main" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Borrower Repayment Schedule" ID="TpBorower"
                        CssClass="tabpan" BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Panel GroupingText="Borrower Repay Details" ID="pnlBorrowerRepay" runat="server"
                                                    CssClass="stylePanel">
                                                    <asp:GridView ID="gvBorrowerRepay" runat="server" AutoGenerateColumns="false" Width="90%"
                                                        OnRowDataBound="gvBorrowerRepay_RowDataBound">
                                                        <Columns>
                                                            <%--Serial Number--%>
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                    <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                    <asp:HiddenField ID="hdn_TranID" runat="server" Value='<%#Eval("Funder_Tran_DTL1_ID") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <%--Funder Reference Number --%>
                                                            <asp:TemplateField HeaderText="Tranche Reference Number" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Fund Reference Number" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtFund_Ref_No" runat="server" ToolTip="Fund Reference Number" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                <FooterStyle Width="20%" HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <%--Repay Date--%>
                                                            <asp:TemplateField HeaderText="Repay Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRepayDate" runat="server" Text='<%#Eval("Repay_Date") %>' ToolTip="Repay Date" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtRepayDate" Width="100px" Text='<%#Eval("Repay_Date") %>' runat="server"
                                                                        onmouseover="txt_MouseoverTooltip(this)" ToolTip="Due Date" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                        PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvRepayDate" runat="server" ControlToValidate="txtRepayDate"
                                                                        ErrorMessage="Enter Repay Date" Display="None" SetFocusOnError="True" ValidationGroup="vgBRUpdate" />
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblTot" runat="server" Text="Total" />
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtRepayDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Repay Date" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                            PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <asp:RequiredFieldValidator ID="rfvRePayDate" runat="server" ControlToValidate="txtRepayDate"
                                                                            ErrorMessage="Enter Repay Date" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--Repay Amount--%>
                                                            <asp:TemplateField HeaderText="Repay Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRepayAmount" runat="server" Text='<%#Eval("Repay_Amount") %>' ToolTip="Repay Amount" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtRepayAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                        Text='<%#Eval("Repay_Amount") %>' runat="server" ToolTip="Repay Amount" />
                                                                    <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                        runat="server" Enabled="True" />
                                                                    <asp:HiddenField ID="hdnRepayAmt" runat="server" Value='<%#Eval("Repay_Amount") %>' />
                                                                    <asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                        ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRUpdate" />
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblTotRepay" runat="server" Text='<%#Eval("TotRepay") %>' />
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtRepayAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                            runat="server" ToolTip="Repay Amount" />
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                            runat="server" Enabled="True" />
                                                                        <asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                            ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--Hedge Reference Number--%>
                                                            <asp:TemplateField HeaderText="Hedge Reference Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHedgeNo" runat="server" Text='<%#Eval("Hedge_No") %>' ToolTip="JV Reference Number" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                <EditItemTemplate>
                                                                    <asp:DropDownList ID="ddlHedgeNo" runat="server" AutoPostBack="true" Width="110px">
                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                    </asp:DropDownList>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:DropDownList ID="ddlHedgeNo" runat="server" AutoPostBack="true" Width="110px">
                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                        </asp:DropDownList>
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--Hedge Amount--%>
                                                            <asp:TemplateField HeaderText="Hedge Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHedgeAmount" runat="server" Text='<%#Eval("Hedge_Amount") %>' ToolTip="Repay Amount" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                        Text='<%#Eval("Hedge_Amount") %>' runat="server" ToolTip="Hedge Amount" />
                                                                    <%--<cc1:FilteredTextBoxExtender ID="fHedgeAmount" TargetControlID="HedgeAmount" FilterType="Numbers"
                                                                        runat="server" Enabled="True" />
                                                                    <asp:HiddenField ID="hdnHedgeAmount" runat="server" Value='<%#Eval("Hedge_Amount") %>' />--%>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                            runat="server" ToolTip="Hedge Amount" />
                                                                        <%--  <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                            runat="server" Enabled="True" />--%>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                            ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />--%>
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--JV Reference Number--%>
                                                            <asp:TemplateField HeaderText="JV Reference Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                <EditItemTemplate>
                                                                    <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                </EditItemTemplate>
                                                                <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                            </asp:TemplateField>
                                                            <%--Add Edit Update Cancel Delete--%>
                                                            <%--  <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                        ToolTip="Edit" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        ToolTip="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                        ToolTip="Update" ValidationGroup="vgBRUpdate" CausesValidation="true"></asp:LinkButton>
                                                                    &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgBRAdd"
                                                                        ToolTip="Add" CausesValidation="true"></asp:LinkButton>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>--%>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
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
        <tr>
            <td align="center">
                <br />
                <table>
                    <tr>
                        <td>
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
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="vsFunderTransaction" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="Main" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="CVOptionProcessing" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
                <asp:HiddenField ID="hdn_DueAmtTot" Value="0" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
