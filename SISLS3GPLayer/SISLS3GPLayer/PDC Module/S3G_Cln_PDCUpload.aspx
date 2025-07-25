<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true" CodeFile="S3G_Cln_PDCUpload.aspx.cs" Inherits="Collection_S3G_Cln_PDCUpload" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">

        function fnLoadCust() {
            document.getElementById("<%= btnLoadCust.ClientID %>").click();
        }

        function funPriCheckDeleteValidation() {

            if (confirm('Do you want to Delete this Upload?')) {
                return true;
            }
            else {
                return false;
            }
        }

    </script>

    <asp:UpdatePanel ID="updtPanel" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">

                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading"></asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Upload Details" ID="pnlUploadDetails" runat="server" CssClass="stylePanel">
                                <div class="row">

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlPDCNature" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPDCNature" runat="server" Text="PDC Nature" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPDCNature" runat="server" ErrorMessage="Select PDC Nature" ControlToValidate="ddlPDCNature"
                                                    Display="Dynamic" ValidationGroup="vgSave" InitialValue="0" CssClass="validation_msg_box_sapn" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtUploadStatus" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblUploadStatus" runat="server" Text="Upload Status" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" ToolTip="Customer/Entity" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="true" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <asp:LinkButton ID="lnkbtnUploadFileName" runat="server" CssClass="styleDisplayLabel" ToolTip="click on download" OnClick="lnkbtnUploadFileName_Click"></asp:LinkButton>
                                            <asp:ImageButton ID="imgDownloadFile" ImageUrl="~/Images/downloadFile.PNG" Width="30px" Height="30px" runat="server" ToolTip="View Document" Style="cursor: pointer;" OnClick="lnkbtnUploadFileName_Click" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:FileUpload runat="server" ID="flUpload" CssClass="upload" ToolTip="Upload File" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <button class="css_btn_enabled" id="btnUpload" title="Upload,[Alt+U]" causesvalidation="false" runat="server" type="button" onserverclick="btnUpload_ServerClick"
                                                accesskey="U">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>U</u>pload
                                            </button>
                                            <button class="css_btn_enabled" id="btnDownloadFormat" title="Download Format[Alt+W]" onclick="if(fnCheckPageValidators('vgSave',false))" causesvalidation="false"
                                                runat="server" type="button" accesskey="W" onserverclick="btnDownloadFormat_ServerClick">
                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Do<u>w</u>nload Format
                                            </button>
                                            <button class="css_btn_enabled" id="btnException" title="View Exception,[Alt+G]" causesvalidation="false" runat="server" type="button">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;View Exception
                                            </button>
                                        </div>
                                    </div>

                                    <asp:Label ID="lblNoteMessage" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Summary Details" ID="pnlSummaryDetails" runat="server" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPDCCount" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblTotalPDC" runat="server" Text="Total PDC" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountCount" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAccountCount" runat="server" Text="Total Account" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTotalAmount" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvSummary" runat="server" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Drawee Bank" DataField="Drawee_Bank" />
                                                    <asp:BoundField HeaderText="Drawee Bank" DataField="Drawee_Branch" />
                                                    <asp:BoundField HeaderText="PDC Count" DataField="PDC_Count" ItemStyle-HorizontalAlign="Right" />
                                                    <asp:BoundField HeaderText="Amount" DataField="Amount" ItemStyle-HorizontalAlign="Right" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Account Details" ID="pnlAccountDetails" runat="server" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvAccountDetails" runat="server" AutoGenerateColumns="false" EmptyDataText="No Account details found">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Account Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgrvAccountNumber" runat="server" Text='<%#Eval("Account_Number")%>'></asp:Label>
                                                            <asp:Label ID="lblgrvPASARefID" runat="server" Text='<%#Eval("PA_SA_REF_ID")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="cbxgrvIsCheck" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 styleFieldLabel">
                            <div align="right" class="fixed_btn">
                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_ServerClick"
                                    runat="server" type="button" accesskey="S">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <button class="css_btn_enabled" id="btnDelete" title="Delete[Alt+W]" onclick="if(funPriCheckDeleteValidation())" causesvalidation="false" onserverclick="btnDelete_ServerClick"
                                    runat="server" type="button" accesskey="W">
                                    <i class="fa fa-times" aria-hidden="true"></i></i>&emsp;Delete
                                </button>
                                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_ServerClick"
                                    runat="server" type="button" accesskey="L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false"
                                    runat="server" type="button" accesskey="X" onserverclick="btnCancel_ServerClick">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>
                        </div>
                    </div>

                    <asp:ValidationSummary runat="server" ID="vsSave" HeaderText="Correct the following validation(s):"
                        CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="false" ValidationGroup="vgSave" />
                    <asp:Label ID="lblErr" runat="server"></asp:Label>
                    <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>

                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDownloadFormat" />
            <asp:PostBackTrigger ControlID="btnUpload" />
            <asp:PostBackTrigger ControlID="lnkbtnUploadFileName" />
            <asp:PostBackTrigger ControlID="imgDownloadFile" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

