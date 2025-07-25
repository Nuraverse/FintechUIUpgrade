<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Sysadm_FASysLocationMaster_Add, App_Web_tfexpijv" title="Untitled Page" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Location Master" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Panel ID="pnlHierarchyType" runat="server" GroupingText="Hierarchy Type" CssClass="stylePanel"
                                Visible="false">
                                <table>
                                    <tr>
                                        <td class="styleFieldAlign">
                                            <span class="styleReqFieldLabel">Hierarchy Type</span>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:RadioButtonList ID="rblHierarchy" runat="server" RepeatDirection="Horizontal"
                                                ValidationGroup="vgLocationGroup">
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="rfvHierarchy" runat="server" ValidationGroup="vgLocationGroup"
                                                Display="None" InitialValue="" ControlToValidate="rblHierarchy" ErrorMessage="Select the Hierarchy Type"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 5px;" colspan="4">
                            <asp:Panel Visible="true" runat="server" ID="pnlLocationCatDetails" GroupingText="Location Category Details"
                                CssClass="stylePanel">
                                <asp:UpdatePanel ID="upLocationdetails" runat="server">
                                    <ContentTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label ID="lblParent" runat="server" Text="Previous Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:DropDownList ID="ddlParent" runat="server" DataTextField="CurrenctMapping_Code"
                                                        AutoPostBack="true" DataValueField="Mapping_Description" OnSelectedIndexChanged="ddlParent_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="lblMappingCodeDescription" runat="server"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="rfvLocationParent" ValidationGroup="vgLocationGroup"
                                                         runat="server" ErrorMessage="Select the Previous Location" SetFocusOnError="True"
                                                        ControlToValidate="ddlParent" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td class="styleFieldLabel" colspan="1">
                                                    <asp:Label ID="lblLastCode" runat="server" Text="Last Generated Code" CssClass="styleInfoLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldLabel" colspan="2">
                                                    <asp:Label ID="lblLastGenCode" runat="server" CssClass="styleInfoLabel"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label ID="lblLocationCode" runat="server" CssClass="styleReqFieldLabel" Text="Location Code"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtLocationCode" runat="server" ValidationGroup="vgLocationGroup"
                                                     onmouseover="txt_MouseoverTooltip(this)"  ToolTip ="Code"   MaxLength="3" Width="100px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvLocationCode" ValidationGroup="vgLocationGroup"
                                                        runat="server" ErrorMessage="Enter the Location Code" SetFocusOnError="True"
                                                        ControlToValidate="txtLocationCode" Display="None"></asp:RequiredFieldValidator>
                                                    <cc1:FilteredTextBoxExtender ID="ftexLocationCode" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                        TargetControlID="txtLocationCode" runat="server" Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label ID="lblLocationDescription" runat="server" Text="Location Description"
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" style="margin-bottom: 10px;">
                                                    <asp:TextBox ID="txtLocationName" runat="server" ValidationGroup="vgLocationGroup"
                                                     onmouseover="txt_MouseoverTooltip(this)"  ToolTip ="Description"     MaxLength="50" Width="400px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvLocationName" ValidationGroup="vgLocationGroup"
                                                        runat="server" ErrorMessage="Enter the Location Name" SetFocusOnError="True"
                                                        ControlToValidate="txtLocationName" Display="None"></asp:RequiredFieldValidator>
                                                   
                                                   <cc1:FilteredTextBoxExtender ID="ftxtDecs" ValidChars=" " TargetControlID="txtLocationName"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                   <%-- <asp:RegularExpressionValidator ID="revLocationName" runat="server" ValidationGroup="vgLocationGroup"
                                                        ErrorMessage="Enter a valid Location Name" ControlToValidate="txtLocationName"
                                                        ValidationExpression="^[a-zA-Z_0-9](\w|\W)*" Display="None"></asp:RegularExpressionValidator>
                                                        
                                                        --%>
                                                    <asp:Button ID="btnCategoryGo" Text="Go" runat="server" ValidationGroup="vgLocationGroup"
                                                       ToolTip ="Go" CssClass="styleSubmitShortButton" OnClientClick="return fnCheckPageValidators('vgLocationGroup','f')"
                                                        OnClick="btnCategoryGo_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <span>Active </span>
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:CheckBox ID="cbxActive" runat="server" Checked="true" Enabled="false"  ToolTip ="Active"/>
                                                </td>
                                                
                                                
                                            </tr>
                                            <tr>
                                            <td class="styleFieldLabel">
                                                   <asp:Label runat="server" Text="Operational Location" ID="lblOperationalLoc" CssClass="styleDisplayLabel"> </asp:Label>
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:CheckBox ID="cbxOperationalLoc" runat="server" ToolTip ="Operational Location"/>
                                                </td></tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div style="margin-bottom: 10px;">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div style="margin-bottom: 5px; margin-left: 2px; margin-right: 2px; margin-top: 5px;">
                                                        <cc1:TabContainer ID="tcLocCategory" runat="server" CssClass="styleTabPanel" ScrollBars="Auto"
                                                            AutoPostBack="true" OnActiveTabChanged="tcLocCategory_ActiveTabChanged" Height="200px">
                                                        </cc1:TabContainer>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <div style="margin-top: 5px; margin-bottom: 5px;">
                                                        <asp:Button ID="btnSaveLocCategory" Text="Save" runat="server" CssClass="styleSubmitButton"
                                                          ToolTip ="Save,Alt+S" OnClick="btnSaveLocationCategory_Click" AccessKey="S"  />&nbsp;
                                                        <asp:Button ID="btnCancelLocCategory" Text="Cancel" runat="server" CausesValidation="False"
                                                         ToolTip ="Exit,Alt+X"   CssClass="styleSubmitButton" OnClick="btnCancelLocCategory_Click" AccessKey="X" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                            <asp:Panel Visible="true" runat="server" ID="pnlLocationMapping" GroupingText="Location Mapping Details"
                                CssClass="stylePanel">
                                <asp:UpdatePanel ID="upLocationMapping" runat="server">
                                    <ContentTemplate>
                                        <table width="100%">
                                            <tr valign="top" style="width: 100%">
                                                <td class="styleFieldAlign" >
                                                    <span class="styleReqFieldLabel">Location Mapping Code</span>
                                                </td>
                                                <td align="left" class="styleFieldLabel" >
                                                    <asp:TextBox ID="txtLocationMappingCode" runat="server" ReadOnly="true"  onmouseover="txt_MouseoverTooltip(this)"  ToolTip ="Code"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnMappingCode" runat="server" />
                                                    <asp:RequiredFieldValidator ID="rfvLocationMappingCode" runat="server" ControlToValidate="txtLocationMappingCode"
                                                        ErrorMessage="Select the Mapping" Display="None" ValidationGroup="btnMappingGo">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="rfvLocationMappingCodeSave" runat="server" ControlToValidate="txtLocationMappingCode"
                                                        ErrorMessage="Select the Mapping" Display="None" ValidationGroup="btnSaveMappingGo">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:Button ID="btnLocationMapping_Go" runat="server" Text="Go" OnClick="btnLocationMapping_Go_Click"
                                                        ValidationGroup="btnMappingGo" CssClass="styleSubmitShortButton" Visible="false" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <span>Location Description</span>
                                                </td>
                                                <td align="left" class="styleFieldAlign" >
                                                    <asp:TextBox ID="txtMappingDescription" runat="server" Width="200px" ToolTip ="Description" TextMode="MultiLine"
                                                       onmouseover="txt_MouseoverTooltip(this)"   ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <span>Active </span>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:CheckBox ID="cbxActiveMapping" ToolTip ="Active" runat="server" Checked="true" Enabled="false" />
                                                </td>
                                                 <td class="styleFieldLabel">
                                                    <span>Operational Location </span>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:CheckBox ID="cbxOperationalLocM" ToolTip ="operational Location" runat="server" Enabled="false"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <cc1:TabContainer ID="tcLocationMapping" runat="server" CssClass="styleTabPanel"
                                                        ScrollBars="Auto" Height="100px">
                                                    </cc1:TabContainer>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:GridView ID="gvLocationMapping" runat="server" AutoGenerateColumns="false" EmptyDataText="No Record's Found...">
                                                        <Columns>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                    <asp:Button ID="btnSaveLocationMapping" runat="server" Text="Save" CssClass="styleSubmitButton"
                                                     ToolTip ="Save"  OnClick="btnSaveLocationMapping_Click" ValidationGroup="btnSaveMappingGo" />
                                                    <asp:Button ID="btnCancelMapping" OnClick="btnCancelLocCategory_Click" runat="server"
                                                       ToolTip ="Cancel"   Text="Exit" CssClass="styleSubmitButton" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:ValidationSummary ID="vsLocationMapping" runat="server" CssClass="styleMandatoryLabel"
                                                        HeaderText="Correct the following validation(s):" ValidationGroup="btnMappingGo" />
                                                    <asp:ValidationSummary ID="vsMappingSave" runat="server" CssClass="styleMandatoryLabel"
                                                        HeaderText="Correct the following validation(s):" ValidationGroup="btnSaveMappingGo" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:HiddenField ID="hdnID" runat="server" />
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          <asp:ValidationSummary ID="vsLocationMaster" runat="server" 
                                ValidationGroup="vgLocationGroup" 
                                HeaderText="Correct the following validation(s):" 
                                ShowMessageBox="false" ShowSummary="true" />
                            <asp:CustomValidator  ID="cvLocationMaster" runat="server"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
