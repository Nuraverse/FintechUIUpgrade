<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3G_Cln_ChequeReturnUpload, App_Web_4kkykzxm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">

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
                                            <asp:DropDownList ID="ddlDepositBank" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDepositBank" runat="server" Text="Deposit Bank" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvDepositBank" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                    ControlToValidate="ddlDepositBank" Display="Dynamic" ValidationGroup="btnUpload" InitialValue="0"></asp:RequiredFieldValidator>
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
                                            <asp:FileUpload runat="server" ID="flUpload" CssClass="upload" ToolTip="Upload File" />
                                            <asp:Label ID="lblFileName" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBankAdviceNo" runat="server" MaxLength="25" ToolTip="Bank Advice Number"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender runat="server" ID="ftbxBankAdviceNumber" FilterType="LowercaseLetters,Numbers,UppercaseLetters,Custom"
                                                TargetControlID="txtBankAdviceNo" ValidChars=" \/-()">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Bank Advice Number" ID="lblBankAdviceNumber" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rqvAdvice" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                    ControlToValidate="txtBankAdviceNo" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBankAdviceDate" runat="server" ToolTip="Bank Advice Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="ceBankAdviceDate" runat="server" Enabled="True" PopupButtonID="imgBankAdviceDate" TargetControlID="txtBankAdviceDate"></cc1:CalendarExtender>
                                            <asp:Image ID="imgBankAdviceDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBankAdviceDate" runat="server" Text="Bank Advice Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvBankAdviceDate" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                    ValidationGroup="btnSave" ControlToValidate="txtBankAdviceDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <button class="css_btn_enabled" id="btnUpload" title="Upload,[Alt+U]" causesvalidation="false" runat="server" type="button" onserverclick="btnUpload_ServerClick"
                                                accesskey="U" onclick="if(fnCheckPageValidators('btnUpload'))">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>U</u>pload
                                            </button>
                                            <button class="css_btn_enabled" id="btnDownloadFormat" title="Download Excel[Alt+O]" causesvalidation="false"
                                                runat="server" type="button" accesskey="O" onserverclick="btnDownloadFormat_ServerClick">
                                                <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;D<u>o</u>wnload Excel
                                            </button>
                                        </div>
                                    </div>

                                </div>
                                <asp:Label ID="lblNoteMessage" runat="server" CssClass="styleDisplayLabel"></asp:Label>

                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Upload Summary" ID="pnlSummary" runat="server" CssClass="stylePanel" Visible="false">
                                <div class="gird">
                                    <asp:GridView ID="grvUploadSummary" runat="server" CssClass="styleInfoLabel" AutoGenerateColumns="false" ToolTip="Summary Details" EmptyDataText="No Records Found"
                                        ShowFooter="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Drawee Bank">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblgvDraweeBankName" runat="server" Text='<%# Eval("Drawee_Bank_Name") %>' />
                                                </ItemTemplate>                                                
                                                <FooterTemplate>
                                                    <asp:Label ID="lblgvftrTotalDesc" runat="server" Text="Total" CssClass="styleDisplayLabel" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Cheque(s)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalCount" runat="server" Text='<%# Eval("Total_Upload_Records") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblgvftrTotalCount" runat="server" CssClass="styleDisplayLabel" />
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valid Cheque Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblWithoutExceptionCount" runat="server" Text='<%# Eval("WOT_Exception") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblgvftrTotalWOTCount" runat="server" CssClass="styleDisplayLabel" />
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exception">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblWithExceptionCount" runat="server" Text='<%# Eval("WITH_EXCEPTION") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblgvftrTotalWithCount" runat="server" CssClass="styleDisplayLabel" />
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 styleFieldLabel">
                            <div align="right">
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
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
