<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAd_LeaseAssetSale, App_Web_razugfam" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/LOBMasterView.ascx" TagName="LOBMasterView" TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
        }
        function ClearTAXorVATvalue(Obj1, Obj2) {
            if (Obj1.value != "")
                Obj2.value = ""
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
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Input Criteria"
                            Width="99%">
                            <table cellpadding="0" cellspacing="0" width="99%">
                                <tr>
                                    <td colspan="4">
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                    TabIndex="1" ToolTip="Line of Business">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Line of Business"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign " width="25%">
                                                <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                    OnItem_Selected="ddlBranch_SelectedIndexChanged" ValidationGroup="VGLAS" IsMandatory="true"
                                                    ErrorMessage="Enter a Location" />
                                                <%--<asp:DropDownList ID="ddlBranch" runat="server" TabIndex="2" ToolTip="Location" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>--%>
                                                <%--<asp:RequiredFieldValidator ID="RFVFILBranch" runat="server" ControlToValidate="ddlBranch"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Location"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblLasType" runat="server" CssClass="styleReqFieldLabel" Text="LAS Type"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:DropDownList ID="ddllastype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddllastype_SelectedIndexChanged"
                                                    TabIndex="3" ToolTip="LAS Type">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVLASTYPE" runat="server" ControlToValidate="ddlLASType"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a LAS Type"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblLASDate" runat="server" CssClass="styleRequiredFieldLabel" Text="LAS Date"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtLASDate" runat="server" ReadOnly="True" Width="35%" ToolTip="LAS Date"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="18%">
                                        <asp:Label ID="lblLASNo" runat="server" CssClass="styleDisplayLabel" Text="LAS Number"
                                            Visible="False"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <asp:TextBox ID="txtLASNo" runat="server" ReadOnly="True" Visible="False" Width="75%"
                                            ToolTip="LAS Number"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblLASStatus" runat="server" CssClass="styleDisplayLabel" Text="Status"
                                            Visible="False"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="25%">
                                        <asp:TextBox ID="txtLASStatus" runat="server" ReadOnly="True" Visible="False" Width="50%"
                                            ToolTip="Status"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="18%">
                                        &nbsp;
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        &nbsp;
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblLASDate0" runat="server" CssClass="styleRequiredFieldLabel" Text="Invoice Print Status"
                                            Visible="False"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="25%">
                                        <asp:TextBox ID="txtInvoice" runat="server" ReadOnly="True" ToolTip="Invoice Print Status"
                                            Visible="False" Width="35%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlLASDispose" runat="server" CssClass="stylePanel" GroupingText="Lease Asset Dispose"
                            Width="99%" Visible="false">
                            <table cellpadding="0" cellspacing="0" width="99%">
                                <tr>
                                    <td colspan="4">
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="Label8" runat="server" CssClass="styleReqFieldLabel" Text="Lease Asset Number"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <uc2:Suggest ID="ddlDLANNo" runat="server" ServiceMethod="GetDocNo" AutoPostBack="true"
                                                    OnItem_Selected="DDLLANNo_SelectedIndexChanged" ValidationGroup="VGLAS" IsMandatory="true"
                                                    ErrorMessage="Enter a Lease Asset Number" />
                                                <%-- <asp:DropDownList ID="ddlDLANNo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLLANNo_SelectedIndexChanged"
                                                    ToolTip="Lease Asset Number">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                                <asp:RequiredFieldValidator ID="ReqDLAN" runat="server" ControlToValidate="ddlDLANNo"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Lease Asset Number"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>--%>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="Label14" runat="server" CssClass="styleDisplayLabel" Text="Asset Description"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtDAssetDesc" runat="server" ReadOnly="True" ToolTip="Asset Description"
                                                    Width="70%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblEntitytypeDs" runat="server" CssClass="styleReqFieldLabel" Text="Entity Type"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:DropDownList ID="ddlEntitytypedispose" runat="server" AutoPostBack="True" TabIndex="6"
                                                    ToolTip="Entity Type" AccessKey="N" OnSelectedIndexChanged="ddlEntitytypedispose_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVEntitytypeDispose" runat="server" ControlToValidate="ddlEntitytypedispose"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Entity Type"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <td class="styleFieldAlign" width="25%">
                                                    <%-- <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblEntitycodeDispose" runat="server" CssClass="styleReqFieldLabel" Text="Entity Code"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <uc1:LOBMasterView ID="LOBMasterViewDispose" runat="server" />
                                                <asp:Button ID="btnLoadCustomerDispose" runat="server" CausesValidation="false" OnClick="btnLoadCustomer_OnClick"
                                                    Style="display: none" Text="Load Customer" />
                                                <asp:CustomValidator ID="CustomValidator2" runat="server" CssClass="styleMandatoryLabel"
                                                    Display="None" ErrorMessage="Entity Code is Required" ValidationGroup="VGFIL"
                                                    OnServerValidate="CustomValidator1_ServerValidate">Entity Code is Required</asp:CustomValidator>
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="Label25" runat="server" CssClass="styleDisplayLabel" Text="Residual value"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtDResidual" runat="server" AutoPostBack="True" ReadOnly="True"
                                                    Style="text-align: right;" ToolTip="Residual Value" Width="40%"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="Label29" runat="server" CssClass="styleReqFieldLabel" Text="Actual value"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtDActualValue0" runat="server" MaxLength="10" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                    Style="text-align: right;" TabIndex="8" ToolTip="Actual Value" Width="40%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ReqDActual1" runat="server" ControlToValidate="txtDActualValue0"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Actual value "
                                                    ValidationGroup="VGLAS"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="Label15" runat="server" CssClass="styleReqFieldLabel" Text="Service Tax"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtDSTax" runat="server" MaxLength="7" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                    Style="text-align: right;" TabIndex="9" ToolTip="Service Tax" Width="20%"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="Label28" runat="server" CssClass="styleReqFieldLabel" Text="VAT"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtDVAT" runat="server" MaxLength="7" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                    Style="text-align: right;" TabIndex="10" ToolTip="VAT" Width="16%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlLASSale" runat="server" CssClass="stylePanel" GroupingText="Lease Asset Sale"
                            Width="99%" Visible="False">
                            <table cellpadding="0" cellspacing="0" width="99%">
                                <tr>
                                    <td colspan="4">
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblprimeaccno" runat="server" CssClass="styleReqFieldLabel" Text="Prime Account Number"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <uc2:Suggest ID="ddlPAN" runat="server" ServiceMethod="GetPANUM" AutoPostBack="true"
                                                    OnItem_Selected="ddlPAN_SelectedIndexChanged" ValidationGroup="VGLAS" IsMandatory="true"
                                                    ErrorMessage="Enter a Prime Account Number" />
                                                <%-- <asp:DropDownList ID="ddlPAN" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPAN_SelectedIndexChanged"
                                                    TabIndex="4" ToolTip="Prime Account Number">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVMLA" runat="server" ControlToValidate="ddlPAN"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Prime Account Number"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>--%>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblsubAccno" runat="server" CssClass="styleDisplayLabel" Text="Sub Account Number"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:DropDownList ID="ddlSAN" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSAN_SelectedIndexChanged"
                                                    TabIndex="5" ToolTip="Sub Account Number">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVSANLAS" runat="server" ControlToValidate="ddlSAN"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Sub Account Number"
                                                    InitialValue="0" ValidationGroup="VGLAS" Visible="false"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblaccclosuredate" runat="server" CssClass="styleDisplayLabel" Text="A/C Closure Date"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtaccclosuredate" runat="server" ReadOnly="True" ToolTip="A/C Closure Date"
                                                    Width="50%"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblLANNo" runat="server" CssClass="styleReqFieldLabel" Text="Asset Code"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <uc2:Suggest ID="ddlSLANNo" runat="server" ServiceMethod="GetDocNo" AutoPostBack="true"
                                                    OnItem_Selected="DDLLANNo_SelectedIndexChanged" ValidationGroup="VGLAS" IsMandatory="true"
                                                    ErrorMessage="Enter a a Asset Code" />
                                                <%-- <asp:DropDownList ID="ddlSLANNo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLLANNo_SelectedIndexChanged"
                                                    ToolTip="Asset Code">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVLAN" runat="server" ControlToValidate="ddlSLANNo"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Asset Code"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblentitytype" runat="server" CssClass="styleReqFieldLabel" Text="Entity Type"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:DropDownList ID="ddlEntitytype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEntitytype_SelectedIndexChanged"
                                                    TabIndex="6" ToolTip="Entity Type" AccessKey="N">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVEntitytype" runat="server" ControlToValidate="ddlEntitytype"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Entity Type"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblEntitycode" runat="server" CssClass="styleReqFieldLabel" Text="Entity Code"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <uc1:LOBMasterView ID="LOBMasterView1" runat="server" />
                                                <asp:Button ID="btnLoadCustomer" runat="server" CausesValidation="false" OnClick="btnLoadCustomer_OnClick"
                                                    Style="display: none" Text="Load Customer" />
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="styleMandatoryLabel"
                                                    Display="None" ErrorMessage="Entity Code is Required" ValidationGroup="VGFIL"
                                                    OnServerValidate="CustomValidator1_ServerValidate">Entity Code is Required</asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblResidualvalue" runat="server" CssClass="styleDisplayLabel" Text="Residual value"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtResidualvalue" runat="server" AutoPostBack="True" ReadOnly="True"
                                                    Style="text-align: right;" ToolTip="Residual Value" Width="40%"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblAssetDescription" runat="server" CssClass="styleDisplayLabel" Text="Asset Description"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtAssetDescription" runat="server" ReadOnly="True" ToolTip="Asset Description"
                                                    Width="70%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblServicetax" runat="server" CssClass="styleReqFieldLabel" Text="Service Tax"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtservicetax" runat="server" MaxLength="7" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                    Style="text-align: right;" TabIndex="9" ToolTip="Service Tax" Width="20%"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblVAT" runat="server" CssClass="styleReqFieldLabel" Text="VAT"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtVAT" runat="server" MaxLength="7" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                    Style="text-align: right;" TabIndex="10" ToolTip="VAT" Width="16%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="lblActualvalue" runat="server" CssClass="styleReqFieldLabel" Text="Actual value"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtActualvalue" runat="server" MaxLength="10" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                    Style="text-align: right;" TabIndex="8" ToolTip="Actual Value" Width="40%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVActualvalue" runat="server" ControlToValidate="txtActualvalue"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Actual value "
                                                    ValidationGroup="VGLAS">
                                                </asp:RequiredFieldValidator>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlLASTransfer" runat="server" CssClass="stylePanel" GroupingText="Lease Asset Transfer"
                            Width="99%" Visible="False">
                            <table cellpadding="0" cellspacing="0" width="99%">
                                <tr>
                                    <td colspan="4">
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="Label1" runat="server" CssClass="styleReqFieldLabel" Text="Prime Account Number"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <uc2:Suggest ID="ddlTPAN" runat="server" ServiceMethod="GetPANUM" AutoPostBack="true"
                                                    OnItem_Selected="ddlTPAN_SelectedIndexChanged" ValidationGroup="VGLAS" IsMandatory="true"
                                                    ErrorMessage="Enter a Prime Account Number" />
                                                <%-- <asp:DropDownList ID="ddlTPAN" runat="server" AutoPostBack="True" TabIndex="4" ToolTip="Prime Account Number"
                                                    OnSelectedIndexChanged="ddlTPAN_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlTPAN"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Prime Account Number"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>--%>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="lblsantransfer" runat="server" CssClass="styleDisplayLabel" Text="Sub Account Number"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:DropDownList ID="ddlTSAN" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTSAN_SelectedIndexChanged"
                                                    TabIndex="5" ToolTip="Sub Account Number">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFVSAnTransfer" runat="server" ControlToValidate="ddlTSAN"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Sub Account Number"
                                                    InitialValue="0" ValidationGroup="VGLAS" Visible="false"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="Label4" runat="server" CssClass="styleReqFieldLabel" Text="Lease Asset Number"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <uc2:Suggest ID="ddlTLANNo" runat="server" ServiceMethod="GetDocNo" AutoPostBack="true"
                                                    OnItem_Selected="DDLLANNo_SelectedIndexChanged" ValidationGroup="VGLAS" IsMandatory="true"
                                                    ErrorMessage="Enter a Prime Account Number" />
                                                <%--<asp:DropDownList ID="ddlTLANNo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLLANNo_SelectedIndexChanged"
                                                    ToolTip="Lease Asset Number">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>--%>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTLANNo"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a Lease Asset Number"
                                                    InitialValue="0" ValidationGroup="VGLAS"></asp:RequiredFieldValidator>--%>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <asp:Label ID="Label5" runat="server" CssClass="styleDisplayLabel" Text="A/C Closure Date"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtTAcClosure" runat="server" OnTextChanged="txtTAcClosure_TextChanged"
                                                    ReadOnly="True" ToolTip="A/C Closure Date" Width="50%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="Label27" runat="server" CssClass="styleDisplayLabel" Text="Asset Description"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtTAssetDesc1" runat="server" ReadOnly="True" ToolTip="Asset Description"
                                                    Width="70%"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:Button ID="Button1" runat="server" CausesValidation="false" OnClick="btnLoadCustomer_OnClick"
                                                    Style="display: none" Text="Load Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label ID="Label12" runat="server" CssClass="styleDisplayLabel" Text="Residual value"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                <asp:TextBox ID="txtTResidual" runat="server" AutoPostBack="True" ReadOnly="True"
                                                    Style="text-align: right;" ToolTip="Residual Value" Width="40%"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                <%-- &nbsp;<asp:Label ID="Label22" runat="server" CssClass="styleReqFieldLabel" Text="Actual value"></asp:Label>--%>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <%-- &nbsp;<asp:TextBox ID="txtTActual0" runat="server" MaxLength="10" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                    Style="text-align: right;" TabIndex="8" ToolTip="Actual Value" Width="40%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTActual0"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Actual value "
                                                    ValidationGroup="VGLAS"></asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign" width="20%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldLabel" width="15%">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlCommAddress" runat="server" CssClass="stylePanel" GroupingText="Customer Information"
                            Width="99%">
                            <table cellpadding="0" cellspacing="0" width="99%">
                                <tr>
                                    <td class="styleFieldLabel" width="18%">
                                        <asp:Label ID="lblcusname" runat="server" Text="Customer Name"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <asp:TextBox ID="txtCustName" runat="server" MaxLength="100" ToolTip="Customer Name"
                                            Width="85%" ReadOnly="True"></asp:TextBox>
                                        <asp:HiddenField ID="hidcuscode" runat="server" />
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                    </td>
                                    <td width="25%">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="18%">
                                        <asp:Label ID="lblAddress1" runat="server" Text="Address 1"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <asp:TextBox ID="txtAddress1" runat="server" TextMode="MultiLine" Rows="3" MaxLength="60"
                                            ToolTip="Address 1" Width="85%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lbladdress2" runat="server" Text="Address 2"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="25%">
                                        <asp:TextBox ID="txtAddress2" runat="server" TextMode="MultiLine" Rows="3" MaxLength="60"
                                            ToolTip="Address 2" Width="85%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="18%">
                                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <%--<asp:TextBox ID="txtCity" runat="server" MaxLength="30" ToolTip="City" Width="85%"
                                            ReadOnly="True"></asp:TextBox>--%>
                                        <cc1:ComboBox ID="txtCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                        </cc1:ComboBox>
                                        <%--<cc1:FilteredTextBoxExtender ID="ftxtCity" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtCity" ValidChars=" ">
                                        </cc1:FilteredTextBoxExtender>--%>
                                        <%--<asp:RequiredFieldValidator ID="rfvComCity" runat="server" ControlToValidate="txtCity"
                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"
                                            InitialValue="0"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="25%">
                                        <%--<asp:TextBox ID="txtState" runat="server" MaxLength="60" ToolTip="State" Width="85%"
                                            ReadOnly="True"></asp:TextBox>--%>
                                        <cc1:ComboBox ID="txtState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                        </cc1:ComboBox>
                                        <%--<cc1:FilteredTextBoxExtender ID="ftxtState" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtState" ValidChars=" ">
                                        </cc1:FilteredTextBoxExtender>--%>
                                        <%--<asp:RequiredFieldValidator ID="rfvComState" runat="server" ControlToValidate="txtState"
                                            InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                            ValidationGroup="Main"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="18%">
                                        <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <%--<asp:TextBox ID="txtCountry" runat="server" MaxLength="60" ToolTip="Country" Width="85%"
                                            ReadOnly="True"></asp:TextBox>--%>
                                        <cc1:ComboBox ID="txtCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                            Width="80px">
                                        </cc1:ComboBox>
                                        <%--<cc1:FilteredTextBoxExtender ID="ftxtCountry" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtCountry" ValidChars=" ">
                                        </cc1:FilteredTextBoxExtender>--%>
                                        <%--<asp:RequiredFieldValidator ID="rfvComCountry" runat="server" ControlToValidate="txtCountry"
                                            InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                            ValidationGroup="Main"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblPincode" runat="server" Text="Pincode/Zipcode"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="25%">
                                        <asp:TextBox ID="txtPincode" runat="server" MaxLength="10" ToolTip="Pin/Zop Code"
                                            Width="35%" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="18%">
                                        <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="12" ToolTip="Mobile Number"
                                            Width="50%" ReadOnly="True"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="ftxtMobile" TargetControlID="txtMobile" FilterType="Numbers"
                                            runat="server" Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblTelephone" runat="server" Text="Telephone"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="25%">
                                        <asp:TextBox ID="txtTelephone" runat="server" MaxLength="12" ToolTip="Telephone"
                                            Width="40%" ReadOnly="True"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="fTelephone" ValidChars=" -" TargetControlID="txtTelephone"
                                            FilterType="Numbers" runat="server" Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblEmail" runat="server" Text="EMail Id"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" colspan="3" width="55%">
                                        <asp:TextBox ID="txtEmailid" runat="server" MaxLength="60" ToolTip="Email ID" Width="28%"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="vsFactoringInvoiceLoadinf" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" Height="177px" ShowMessageBox="false"
                            ShowSummary="true" ValidationGroup="VGFIL" Width="500px" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators();"
                            CssClass="styleSubmitButton" Text="Save" OnClick="btnSave_Click" ValidationGroup="VGFIL"
                            TabIndex="11" ToolTip="Save" />
                        <asp:Button runat="server" ID="btnInvoicePrinting" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Invoice Printing" OnClick="btnInvoicePrinting_Click" ToolTip="Invoice Printing"
                            Visible="False" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                            Height="26px" TabIndex="12" ToolTip="Clear" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" ValidationGroup="PRDDC" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" TabIndex="13" ToolTip="Cancel" />
                        <asp:HiddenField ID="hdnFlag" runat="server" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
