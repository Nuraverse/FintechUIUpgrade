<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Financial_Accounting_FAAssetDepreciation, App_Web_skbf4x1n" title="Asset Depreciation" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updDeprication" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Asset Depreciation" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlAssetDepreciation" runat="server" GroupingText="Asset Depreciation" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"></asp:DropDownList>
                                          <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvLocation" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="0"
                                                                            ErrorMessage="Select Branch" ValidationGroup="Save"></asp:RequiredFieldValidator>


                                                                    </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblLocation" Text="Branch" ToolTip="Branch" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDocumentNo" runat="server" ToolTip="Document Number"
                                            ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblDocumentNo" Text="Document Number" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDepMonth" ToolTip="Depreciation Month" runat="server"
                                            onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlDepMonth" CssClass="validation_msg_box_sapn"
                                                InitialValue="0" runat="server" SetFocusOnError="True" ControlToValidate="ddlDepMonth"
                                                ErrorMessage="Select Depreciation Month" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Depreciation Month" ToolTip="Depreciation Month"
                                                ID="lblDepreciationMonth" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDocDate" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgDocDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CEDocDate" runat="server" PopupButtonID="imgDocDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            TargetControlID="txtDocDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtDocDate" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtDocDate"
                                                ErrorMessage="Enter Doc Date"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblDocumentDate" Text="Document Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Save" runat="server"
                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>
                                 <asp:ImageButton ID="ImgBtnExcel" CssClass="styleDisplayLabel" Visible="false" OnClick="ImgBtnExcel_Click" ImageUrl="~/Images/ExcelExport10.png"
                                Width="30px" Height="30px" runat="server" ToolTip="Export to Excel" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
           
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="divInterest" runat="server" style="overflow: auto; height: 300px; display: none">
                            <asp:Panel ID="pnlLaoding" runat="server" GroupingText="Depreciation Details" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                OnRowDataBound="gvDetail_RowDataBound" Width="99%">
                                                <Columns>
                                                    <%--Serial Number--%>
                                                    <asp:TemplateField HeaderText="Sl No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                     <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>' ToolTip="Serial Number" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--Funder Tran Id--%>
                                                    <asp:TemplateField HeaderText="Asset Group Code" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsset_Group_Code" runat="server" Text='<%#Eval("Asset_Group") %>'
                                                                ToolTip="Asset Group Code" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Group">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsset_Group" runat="server" Text='<%#Eval("Asset_Group_desc") %>'
                                                                ToolTip="Asset Group" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset code" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsset_code" runat="server" Text='<%#Eval("Asset_code") %>' ToolTip="Asset code" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsset_Code_desc" runat="server" Text='<%#Eval("Asset_Code_desc") %>'
                                                                ToolTip="Asset Code" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsset_Number" runat="server" Text='<%#Eval("Asset_Number") %>'
                                                                ToolTip="Asset Number" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Purchase Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPur_dt" runat="server" Text='<%#Eval("Pur_dt") %>' ToolTip="Purchase Date" />
                                                        </ItemTemplate>
                                                        <FooterTemplate >
                                                             <asp:Label ID="lblFTPur_dt" runat="server" Text="Grand Total"  ToolTip="Grand Total" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Purchase Amount" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPur_Amt" runat="server" Text='<%#Eval("Pur_Amt") %>' ToolTip="Purchase Amount" />
                                                        </ItemTemplate>
                                                        
                                                        <FooterTemplate >
                                                             <asp:Label ID="lblFTPur_Amt" runat="server"  ToolTip="Purchase Amount" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Last Calc Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLast_Calc_dt" runat="server" Text='<%#Eval("Last_Calc_dt") %>'
                                                                ToolTip="Last Calc Date" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="YTD" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblYTD" runat="server" Text='<%#Eval("YTD") %>' ToolTip="Purchase Amount" />
                                                        </ItemTemplate>
                                                         <FooterTemplate>
                                                             <asp:Label ID="lblFTYTD" runat="server"  ToolTip="YTD" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cumulative" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                             <asp:Label Width="100%" ID="lblDep_Exist_Amt" Style="text-align: right;" runat="server"
                                                                            Text='<%#Eval("Dep_Exist_Amt") %>' ToolTip="Dep_Exist_Amt" />
                                                        </ItemTemplate>
                                                        <FooterTemplate >
                                                             <asp:Label ID="lblFTDep_Exist_Amt" runat="server"  ToolTip="Cumulative" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="WDV Rate" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                           <asp:Label Width="100%" ID="lblDep_WDV_Rate" Style="text-align: right;" runat="server"
                                                                            Text='<%#Eval("WDV_Rate") %>' ToolTip="WDV Rate" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="WDV Amount" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                           <asp:Label Width="100%" ID="lblDep_Curr_Amt" Style="text-align: right;" runat="server"
                                                                            Text='<%#Eval("WDV_DEP_AMOUNT") %>' ToolTip="WDV Amount" />
                                                        </ItemTemplate>
                                                         <FooterTemplate>
                                                             <asp:Label ID="lblFTDep_Curr_Amt" runat="server"  ToolTip="WDV Amount" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="SLN Rate" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                           <asp:Label Width="100%" ID="lblDep_SLN_Rate" Style="text-align: right;" runat="server"
                                                                            Text='<%#Eval("SLN_Rate") %>' ToolTip="SLN Rate" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="SLN Amount" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                             <asp:Label Width="100%" ID="lblsln_amount" Style="text-align: right;" runat="server"
                                                                            Text='<%#Eval("SLN_DEP_AMOUNT") %>' ToolTip="SLN Amt" />
                                                        </ItemTemplate>
                                                          <FooterTemplate>
                                                             <asp:Label ID="lblFTsln_amount" runat="server"  ToolTip="SLN Amount" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                  <%--  <asp:TemplateField HeaderText="Depreciation">
                                                        <HeaderTemplate>
                                                            <table width="100%">
                                                                <tr style="width: 100%;">
                                                                    <td style="width: 100%;" align="center" colspan="3">Deperciation
                                                                    </td>
                                                                </tr>
                                                                <tr style="width: 100%;">
                                                                    <td style="width: 25%;">Cumulative
                                                                    </td>
                                                                    <td style="width: 40%;">WDV
                                                                    </td>
                                                                    <td style="width: 40%;">SLN
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                <tr style="width: 100%;">
                                                                    <td style="width: 25%;">
                                                                       
                                                                    </td>
                                                                    <td style="width: 40%;">
                                                                       
                                                                    </td>
                                                                    <td style="width: 40%;">
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--<asp:TemplateField HeaderText="YTD" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblYTD" runat="server" Text='<%#Eval("YTD") %>' ToolTip="Purchase Amount" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SLN Value" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblslnvalue" runat="server" Text='<%#Eval("SLN_VALUE") %>' ToolTip="Purchase Amount" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="WDV Amount" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblWDV_Amt" runat="server" Text='<%#Eval("Wdv_Value") %>' ToolTip="Purchase Amount" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Net Asset Amount" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNet_Asset_Amt" runat="server" Text='<%#Eval("Net_Asset_Amt") %>'
                                                                ToolTip="Net_Asset_Amt" />
                                                        </ItemTemplate>
                                                         <FooterTemplate>
                                                             <asp:Label ID="lblFTNet_Asset_Amt" runat="server"  ToolTip="Net Asset Amount" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Calc_Date" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCalc_Date" runat="server" Text='<%#Eval("Calc_Date") %>' ToolTip="Calc Date" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select All" Visible="false">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblselectAll" runat="server" Text="Select All" ToolTip="Select"></asp:Label>
                                                            <br />
                                                            <asp:CheckBox ID="chkAll" runat="server" onchange="fnSelectUser();" Visible="false" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkbox" runat="server" ToolTip="Select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnPost" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S" enabled="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ValidationGroup="Save" ID="VSAssetcodeAdd" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="CVAssetDeperciation" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImgBtnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>








