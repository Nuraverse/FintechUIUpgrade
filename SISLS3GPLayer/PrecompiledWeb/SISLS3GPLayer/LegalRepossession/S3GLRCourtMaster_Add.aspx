<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="LegalRepossession_S3GLRCourtMaster_Add, App_Web_prpaho0u" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlCourtMaster" Width="98%" GroupingText="Court Details" CssClass="stylePanel"
                            runat="server">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtcourtcode" runat="server" ToolTip="Court Code" Enabled="false" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Court Code" ID="lblcourtcode"></asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlcourttype" runat="server" ToolTip="Court Type" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlcourttype" runat="server" Display="Dynamic" InitialValue="0"
                                                CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Select a Court Type" ControlToValidate="ddlcourttype"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Court Type" ID="lblcourttype" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlcourtlev" runat="server" ToolTip="Court Level" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlcourtlev" runat="server" Display="Dynamic" InitialValue="0"
                                                CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Select a Court Level" ControlToValidate="ddlcourtlev"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Court Level" ID="lblcourtlev" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtcnmloc" runat="server" ToolTip="Court Name/Location" class="md-form-control form-control login_form_content_input requires_true"
                                            MaxLength="50" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtcnmloc" runat="server" Display="Dynamic" InitialValue=""
                                                CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Enter Court Name/Location" ControlToValidate="txtcnmloc"></asp:RequiredFieldValidator>
                                            <cc1:FilteredTextBoxExtender ID="ftecnmloc" runat="server" TargetControlID="txtcnmloc"
                                                FilterType="UppercaseLetters,LowercaseLetters,Custom" ValidChars=" "
                                                Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Court Name/Location" ID="lblcnmloc" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnSave" runat="server" onserverclick="btnSave_Click" class="css_btn_enabled" type="button" accesskey="S" title="Save[Alt+S]"
                        onclick="if(fnCheckPageValidators('btnSave'))">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button id="btnClear" runat="server" onserverclick="btnClear_Click" class="css_btn_enabled" type="button" accesskey="L" title="Clear[Alt+L]"
                        onclick="if(fnConfirmClear())" causesvalidation="false">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button id="btnCancel" runat="server" onserverclick="btnCancel_Click"
                        class="css_btn_enabled" type="button" onclick="if(fnConfirmExit())" causesvalidation="false"
                        accesskey="X" title="Exit[Alt+X]">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%-- <div class="row" style="display: none">
                    <%--<asp:CustomValidator ID="cvCourtMaster" runat="server" CssClass="styleReqFieldLabel"
                        Enabled="true" Width="98%" />--%>
                <%--  <asp:ValidationSummary ID="lblsErrorMessage" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />
                </div>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

