<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3GSysAdminHierachyMaster, App_Web_xht0hlsp" title="Organization Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" ToolTip="Organization Master">
                            </asp:Label>
                        </h6>
                    </div>
                    <%--<div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>

                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <div class="panel panel-default">
                            <asp:Panel ID="PNLHierachyMaster" runat="server" CssClass="stylePanel"
                                Width="100%">
                                <asp:GridView runat="server" ID="GRVHeirachy" AutoGenerateColumns="False" Width="100%"
                                    OnRowDataBound="GRVHeirachy_RowDataBound" class="grid_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Hierarchy" HeaderStyle-Width="5%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHierachy" runat="server" Text='<%# Bind("Hierachy")%>' Width="100%" ToolTip="Hierarchy"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Width" HeaderStyle-Width="15%">
                                            <ItemTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtWidth" runat="server" Text='<%# Bind("Width")%>' MaxLength="1" ToolTip="Width"
                                                        Width="97%" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <cc1:FilteredTextBoxExtender ID="FTEWidth" runat="server" TargetControlID="txtWidth"
                                                        FilterType="Custom" Enabled="true" ValidChars="123456789">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization Description" HeaderStyle-Width="50%">
                                            <ItemTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtLocationDesc" runat="server" Text='<%# Bind("Location_Description")%>' ToolTip="Organization Description"
                                                        MaxLength="50" Width="97%" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <cc1:FilteredTextBoxExtender ID="ExttxtLocationDesc" runat="server" TargetControlID="txtLocationDesc"
                                                        ValidChars="- " FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Active" HeaderStyle-Width="5%">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkActive" runat="server" AutoPostBack="true" OnCheckedChanged="chkActive_CheckedChanged" ToolTip="Active" />
                                                <asp:Label ID="lblActive" runat="server" Text='<%# Bind("Active")%>' Visible="false" ToolTip="Active"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Operational Location" HeaderStyle-Width="5%" Visible="false">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkOperational" runat="server"
                                                    Checked='<%#DataBinder.Eval(Container.DataItem, "Operational").ToString().ToUpper() == "TRUE"%>'
                                                    AutoPostBack="true" OnCheckedChanged="chkOperational_CheckedChanged" ToolTip="Operational Location" />

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>

                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <%--Total--%>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%--                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="true" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server" enabled="false"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="true" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>--%>
                <%--  <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators();"
                            CssClass="save_btn fa fa-floppy-o" Text="Save" ValidationGroup="VGHierachy" ToolTip="Save,Alt+S" AccessKey="S"
                            OnClick="btnSave_Click" />
                        <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="cancel_btn fa fa-times"
                            Text="Clear" OnClientClick="return fnConfirmClear();" ToolTip="Clear,Alt+L" AccessKey="L"
                            Enabled="false" />
                        <i class="fa fa-share btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnCancel" Text="Exit" ValidationGroup="VGNOC"
                            CausesValidation="false" CssClass="save_btn fa fa-share-o" ToolTip="Exit,Alt+X" AccessKey="X"
                            OnClick="btnCancel_Click" OnClientClick="parent.RemoveTab();" />
                    </div>
                </div>--%>

                <%--    <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row" style="float: right; margin-top: 5px;">
                            <div class="col-lg-8 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators();"
                                    CssClass="save_btn fa fa-floppy-o" Text="Save" ValidationGroup="VGHierachy" ToolTip="Save,Alt+S" AccessKey="S"
                                    OnClick="btnSave_Click" />
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                                <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="cancel_btn fa fa-times"
                                    Text="Clear" OnClientClick="return fnConfirmClear();" ToolTip="Clear,Alt+L" AccessKey="L"
                                    Enabled="false" />
                            </div>--%>
                <%--  <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                <asp:Button runat="server" ID="btnCancel" Text="Exit" ValidationGroup="VGNOC"
                                    CausesValidation="false" CssClass="save_btn fa fa-share-o" ToolTip="Exit,Alt+X" AccessKey="X"
                                    OnClick="btnCancel_Click" OnClientClick="parent.RemoveTab();" />
                            </div>--%>
                <%--   </div>
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary runat="server" ID="vsHierachy" HeaderText="Correct the following validation(s):"
                            Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                            ShowSummary="true" ValidationGroup="VGHierachy" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
