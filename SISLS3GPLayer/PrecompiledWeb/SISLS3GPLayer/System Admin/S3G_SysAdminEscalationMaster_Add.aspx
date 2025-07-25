<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3G_SysAdminEscalationMaster_Add, App_Web_vcipatnp" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <div id="tab-content" class="tab-content">
                    <div class="tab-pane fade in active show" id="tab1">
                        <div class="row">
                            <div class="col">
                                <h6 class="title_name">
                                    <asp:Label runat="server" Text="Escalation Master" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="pnlHeader" runat="server" CssClass="stylePanel" GroupingText="Header details">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                                </asp:DropDownList>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="Dynamic"
                                                        ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select the Line of Business" CssClass="validation_msg_box_sapn">
                                                    </asp:RequiredFieldValidator>

                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Line of Business" ID="lbllOB" CssClass="styleReqFieldLabel">
                                                    </asp:Label>


                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlRoleCode" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRoleCode_SelectedIndexChanged" class="md-form-control form-control">
                                                </asp:DropDownList>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvRolecode" runat="server" Display="Dynamic"
                                                        ControlToValidate="ddlRoleCode" InitialValue="0" ErrorMessage="Select the Role Description" CssClass="validation_msg_box_sapn">
                                                    </asp:RequiredFieldValidator>

                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Role Description" ID="lbllOBRolecode" CssClass="styleReqFieldLabel">
                                                    </asp:Label>


                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged" class="md-form-control form-control">
                                                </asp:DropDownList>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvUser" runat="server" Display="Dynamic"
                                                        ControlToValidate="ddlUser" InitialValue="0" ErrorMessage="Select the User" CssClass="validation_msg_box_sapn">
                                                    </asp:RequiredFieldValidator>

                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="User" ID="lblUser" CssClass="styleReqFieldLabel">
                                                    </asp:Label>


                                                </label>
                                            </div>
                                        </div>

                                          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxActive" Checked="true" runat="server" />

                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtNLDays"  AutoPostBack="true" OnTextChanged="txtNLDays_TextChanged" MaxLength="5" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" InputDirection="RightToLeft" ClearMaskOnLostFocus="true"
                                                    Mask="99.99" Enabled="true" MaskType="Number" TargetControlID="txtNLDays">
                                                </cc1:MaskedEditExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" CssClass="styleDisplayLabel" Text="NL Hours" ID="Label1"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxNLSms" runat="server" TabIndex="5" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="NL SMS" ID="lblNLSMS" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxNLEmail" runat="server" TabIndex="5" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="NL EMAIL" ID="lblNLEMAIl" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxNLcc1" runat="server" TabIndex="5" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <label>
                                                <asp:Label runat="server" Text="NL CC1" ID="Label3" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>


                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtHLDays"  AutoPostBack="true" OnTextChanged="txtHLDays_TextChanged" MaxLength="5" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                               
                                                <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" InputDirection="RightToLeft" ClearMaskOnLostFocus="true"
                                                    Mask="99.99" Enabled="true" MaskType="Number" TargetControlID="txtHLDays">
                                                </cc1:MaskedEditExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" CssClass="styleDisplayLabel" Text="HL Hours" ID="Label2"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                             <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxHLSms" runat="server" TabIndex="5" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="HL SMS" ID="Label4" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxHLEmail" runat="server" TabIndex="5" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="HL EMAIL" ID="Label5" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxHLcc1" runat="server" TabIndex="5" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <label>
                                                <asp:Label runat="server" Text="HL CC1" ID="Label6" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>

                                           <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox ID="CbxHLcc2" runat="server" TabIndex="5" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <label>
                                                <asp:Label runat="server" Text="HL CC2" ID="Label7" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>

                                      
                                    </div>
                                </asp:Panel>
                            </div>
                    </div>

                    <div class="btn_height"></div>

                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false"
                            onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S">
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
                        <button class="css_btn_enabled" id="btnDelete" title="Delete[Alt+D]" causesvalidation="false" onserverclick="btnDelete_Click" runat="server"
                            type="button" accesskey="D">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>D</u>elete
                        </button>

                    </div>

                    <div>
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>

                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="30px" Width="716px"
                            CssClass="styleMandatoryLabel" ShowSummary="false" HeaderText="Correct the following validation(s):  " />
                    </div>
                </div>
                </div>
                      
                      
            </table>
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
