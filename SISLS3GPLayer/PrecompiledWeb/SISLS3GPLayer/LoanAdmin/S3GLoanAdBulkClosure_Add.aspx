<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdBulkClosure_Add, App_Web_ccy20lsg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <div class="row title_header">
                                <h6 class="title_name">
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Application Processing">
                                    </asp:Label>
                                    <asp:HiddenField runat="server" ID="hdnCustAge" />
                                </h6>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlGeneral" runat="server" CssClass="stylePanel" GroupingText="General"
                                Width="99%">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dcAccountNumber" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFlwUPAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <uc4:ICM ID="ucSrchDCFlwUPAccountLov" onblur="fnLoadAccount()" runat="server" ToolTip="Account Number" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucSrchDCFlwUPAccountLov_Item_Selected"
                                                strLOV_Code="ACC_CLO" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                ToolTip="Line of Business" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="Dynamic" InitialValue="0"
                                                    ErrorMessage="Select the Line of Business" ControlToValidate="ddlLOB" SetFocusOnError="True"
                                                    ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                ToolTip="Branch" class="md-form-control form-control">
                                            </asp:DropDownList>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtDate" ToolTip="Account Closure Date" OnTextChanged="txtDate_TextChanged"
                                                AutoPostBack="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgACDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender runat="server" Format="dd-MM-yyyy"
                                                TargetControlID="txtDate"
                                                PopupButtonID="imgACDate" ID="CECACDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVACDate" CssClass="validation_msg_box_sapn" runat="server"
                                                    ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Select the Account Closure Date"
                                                    ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                            </div>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblACDate" runat="server" Text="Account Closure Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlAccountStatus" runat="server" 
                                                ToolTip="Account Status" class="md-form-control form-control">
                                            </asp:DropDownList>                                           
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAccountStatus" runat="server" Text="Account Status" CssClass="styleFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                        <div class="md-input">
                                            <asp:CheckBox ID="CbxInclude" runat="server" AutoPostBack="True" OnCheckedChanged="CbxInclude_CheckedChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <asp:Label ID="lblInclude" runat="server" Text="Include Past" CssClass="styleDisplayLabel"></asp:Label>

                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlPDCNature" runat="server" OnSelectedIndexChanged="ddlPDCNature_SelectedIndexChanged" AutoPostBack="True"
                                                ToolTip="Location" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvNature" runat="server" Display="Dynamic" InitialValue="0"
                                                    ErrorMessage="Select the PDC Nature" ControlToValidate="ddlPDCNature" SetFocusOnError="True"
                                                    ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPdcNature" runat="server" Text="PDC Nature" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlAccountDet" runat="server" CssClass="stylePanel" GroupingText="Account Details"
                                Width="99%">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvAccClosure" runat="server" CssClass="styleInfoLabel" AutoGenerateColumns="False"
                                                Width="100%" OnRowDataBound="gvAccClosure_RowDataBound" ToolTip="Account Details" ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="13%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("location") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="7%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account No" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPAN" runat="server" Text='<%# Eval("PANum")%>' />
                                                            <asp:Label ID="lblPASAREF_ID" runat="server" Text='<%# Eval("PA_SA_REF_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblLocation_ID" runat="server" Text='<%# Eval("location_id") %>' Visible="false" />
                                                            <asp:Label ID="lblWriteOff_ID" runat="server" Text='<%# Eval("WRITTEN_OFF") %>' Visible="false" />
                                                            <asp:Label ID="lblAccountStatus" runat="server" Text='<%# Eval("Account_Status") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Account Status" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSA_STATUS_CODE" runat="server" Text='<%# Eval("SA_STATUS_CODE") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer" runat="server" Text='<%# Eval("Customer")%>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="22%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Maturity Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMaturityDate" runat="server" Text='<%# Eval("Maturity_Date")%>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Installment Due" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentAmount" runat="server" Text='<%# Eval("Installment_Due")%>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                    </asp:TemplateField>

                                                    <%--Columns newly added - Kuppu - June 13 - Starts---%>
                                                    <asp:TemplateField HeaderText="Insurance Due" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInsurance" runat="server" Text='<%# Eval("Insurance_Due")%>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ODI Due" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblODI" runat="server" Text='<%# Eval("ODI_Due")%>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CRC Due" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMemo" runat="server" Text='<%# Eval("MEMO_DUE")%>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Other Due" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOtherDueAmount" runat="server" Text='<%# Eval("Other_Due")%>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Write Off" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkWriteOff" runat="server" ToolTip="Write Off" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:UpdatePanel ID="updChq" runat="server">
                <ContentTemplate>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGetLines" onserverclick="btnGetLines_Click" runat="server" onclick="if(fnCheckPageValidators('Submit',false))"
                            type="button" accesskey="G" causesvalidation="false" title="Get Accounts[Alt+G]" validationgroup="Submit">
                            <i class="fa fa-recycle" aria-hidden="true"></i>&emsp;<u>G</u>et Accounts

                        </button>
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Submit'))"
                            type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="Submit"
                            enabled="false">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnXLPorting" onserverclick="btnXLPorting_Click" visible="false" runat="server"
                            type="button" accesskey="E" causesvalidation="false" title="Export[Alt+E]">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xport
                        </button>
                        <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                            onserverclick="btnClear_Click" type="button" accesskey="L" title="Clear[Alt+L]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" onclick="if(fnConfirmExit())" causesvalidation="false" runat="server"
                            type="button" accesskey="X" title="Exit[Alt+X]">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <input type="hidden" runat="server" id="hdnDate" />
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary runat="server" ID="vsPDC" HeaderText="Correct the following validation(s):"
                                Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                                ShowSummary="true" ValidationGroup="Submit" />
                            <asp:CustomValidator ID="cvPDC" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: medium"></asp:Label>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="ddlPDCNature" />
                    <asp:PostBackTrigger ControlID="btnXLPorting" />
                </Triggers>
            </asp:UpdatePanel>


        </div>
    </div>
</asp:Content>

