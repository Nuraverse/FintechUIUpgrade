<%@ page title="Terrorist_File_Upload" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" asynctimeout="36000" inherits="LoanAdmin_S3G_LoanAd_Terrorist_File_Upload, App_Web_aojrc4jn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }

    </script>
    <asp:UpdatePanel ID="UpdFileUpload" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" ToolTip="Holiday Master">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div class="modal">
                                <div class="center">
                                    <img alt="" src="../Images/ajax-loader_2.giff" />
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div>
                                <asp:Panel ID="pnlFileUpload" GroupingText="File Upload" runat="server" CssClass="stylePanel">

                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlTemplateType" Enabled="true" runat="server" ToolTip="File Type" OnSelectedIndexChanged="ddlTemplateType_SelectedIndexChanged" AutoPostBack="true"
                                                    class="md-form-control form-control">
                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="CSV" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="XML" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvToolTip" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="ddlTemplateType" Display="Dynamic"
                                                        ErrorMessage="Select the File Type" InitialValue="0" SetFocusOnError="true" ValidationGroup="save"></asp:RequiredFieldValidator>
                                                </div>
                                                <%--                                                <asp:RadioButton ID="rbtnCSV" GroupName="FUP" Text="CSV" runat="server" OnCheckedChanged="rbtnCSV_CheckedChanged" TabIndex="2" AutoPostBack="true" ToolTip="File Type" />
                                                <asp:RadioButton ID="rbtnXML" GroupName="FUP" Text="XML" runat="server" OnCheckedChanged="rbtnXML_CheckedChanged" TabIndex="3" AutoPostBack="true" ToolTip="File Type"/>--%>
                                                <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblFileUploadSelection" runat="server" CssClass="styleReqFieldLabel" Text="File Type"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtFileName" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvfilename" ControlToValidate="txtFileName" CssClass="validation_msg_box_sapn" runat="server" Display="Dynamic" ErrorMessage="Enter File Name" ValidationGroup="save"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblFileName2" runat="server" CssClass="styleReqFieldLabel" Text="File Name"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="styleFieldLabel col-lg-4 col-md-6 col-sm-6 col-xs-12" style="display: none;">
                                                <div class="md-input">
                                                    <asp:Label ID="lblIsdeleteInsert" runat="server" CssClass="styleReqFieldLabel" Text="Delete Insert"></asp:Label>
                                                    <asp:CheckBox ID="chkIsDeleteInsert" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="styleFieldLabel col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:Label ID="lblFileUpload" Visible="false" runat="server" CssClass="styleReqFieldLabel" Text="File Upload"></asp:Label>
                                                <asp:Button ID="btnBrowse" Visible="false" Enabled="false" runat="server" OnClick="btnBrowse_OnClick" CssClass="styleSubmitButton" Style="display: none"></asp:Button>
                                                <asp:FileUpload runat="server" Visible="false" Enabled="false" ID="flUpload" ToolTip="Upload File" />
                                                <asp:Label ID="lblCurrentPath" runat="server" Visible="false" Text="" />
                                                <asp:Button CssClass="styleSubmitButton" ID="btnDlg" Visible="false" runat="server" Text="Browse"
                                                    Style="display: none" CausesValidation="false"></asp:Button>
                                                <asp:Label ID="lblFileName" runat="server" Visible="false" CssClass="styleReqFieldLabel"></asp:Label>
                                            </div>
                                        </div>
                                </asp:Panel>

                                <tr class="styleFieldAlign">
                                    <td>
                                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                        <asp:CustomValidator ID="CVUsermanagement" runat="server" Display="None" CssClass="styleMandatoryLabel" ValidationGroup="save"></asp:CustomValidator>
                                    </td>
                                </tr>
                            </div>
                        </div>
                    </div>
                    <div align="center">
                        <asp:Timer runat="server" ID="UpdateTimer" Interval="5000" OnTick="UpdateTimer_Tick" />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('save'))" causesvalidation="false" validationgroup="save" onserverclick="btnSave_Click"
                                    runat="server" type="button" accesskey="S">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <%--<asp:Button ID="btnSave" ValidationGroup="save" OnClientClick="return fnCheckPageValidators('save')" runat="server" CssClass="styleSubmitButton" Text="Save" AccessKey="S" ToolTip="Save, Alt+S"
                                        OnClick="btnSave_Click" />--%>
                                <button class="css_btn_enabled" id="Button1" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="Button1_Click"
                                    runat="server" type="button" accesskey="L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <%-- <asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="save_btn fa fa-share-o" OnClientClick="return fnConfirmExit();"
                                    OnClick="btnExit_Click" CausesValidation="false" ToolTip="Exit,Alt+X" AccessKey="X" />--%>
                                <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnExit_Click"
                                    runat="server" type="button" accesskey="X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                                <%--button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]"  causesvalidation="false"
                                    runat="server" type="button" accesskey="X" onclick="RemoveTabnew(this);" OnClientClick="return fnConfirmExit();">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>--%>
                                <%--<asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" CssClass="styleSubmitButton" CausesValidation="False" OnClientClick="parent.RemoveTab();" ToolTip="Exit, Alt+X" AccessKey="X"
                                        Text="Exit" />--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel1" GroupingText="File Upload-Monitor" runat="server" CssClass="stylePanel">
                                <asp:GridView ID="grvMonitor" runat="server">
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Label ID="lblShowProgress" Visible="false" runat="server" BackColor="SpringGreen"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:ValidationSummary runat="server" ID="VSUsermanagement" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ValidationGroup="save" ShowMessageBox="false" ShowSummary="false" Enabled="false" />
                    </div>

                </div>
            </div>



        </ContentTemplate>

    </asp:UpdatePanel>



</asp:Content>
