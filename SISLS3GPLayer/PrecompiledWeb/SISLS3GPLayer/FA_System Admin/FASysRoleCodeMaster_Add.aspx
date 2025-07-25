<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Sysadm_FASysRoleCodeMaster_Add, App_Web_tfexpijv" title="Role Center Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Role Center Name" ID="lblRoleCentrName" CssClass="styleReqFieldLabel" ToolTip="Role Center Name"
                                            Font-Bold="true">
                                        </asp:Label>
                                        <asp:Label ID="lblRoleCenterName" runat="server" Text="FA" CssClass="styleDisplayLabel" Font-Bold="true" Visible="false"> </asp:Label>
                                        <asp:Label ID="lblRoleCenterName1" runat="server" Text="Financial Accounting" CssClass="styleDisplayLabel" Font-Bold="true"> </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProgram" runat="server" class="md-form-control form-control"
                                        AutoPostBack="True" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" ToolTip="Program">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlProgram" InitialValue="0" ErrorMessage="Select Program"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Program" ID="lblProgram" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtRoleCode" runat="server" MaxLength="5" ReadOnly="True" Style="text-transform: uppercase"
                                        ToolTip="Role Code" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Role Code" ID="lblRolecode" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" ToolTip="Active" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>

                                    <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active">
                                    </asp:Label>

                                </div>
                            </div>
                        </div>
                        <div align="right">
                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                type="button" accesskey="S">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <%--<cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you want to Clear_FA?"
                                TargetControlID="btnClear">
                            </cc1:ConfirmButtonExtender>--%>
                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                            <asp:Label ID="hdnProgramCode" runat="server" Text="Label" Visible="false" ToolTip="Cancel"></asp:Label>
                        </div>


                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="RoleCenterMasterDetailsAdd" runat="server" ShowSummary="false"
                                    CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" />
                            </div>
                        </div>
                        <input type="hidden" id="hdnID" runat="server" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
