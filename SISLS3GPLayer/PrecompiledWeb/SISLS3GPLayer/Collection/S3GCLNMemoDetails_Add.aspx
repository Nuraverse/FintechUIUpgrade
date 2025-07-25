<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GCLNMemoDetails_Add, App_Web_f2u5fcxj" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
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
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                        class="md-form-control form-control" ToolTip="Line of Business">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <%--<uc:Suggest ID="ddlBranch" runat="server" AutoPostBack="True" OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                        ServiceMethod="GetBranchList" WatermarkText="--All--" class="md-form-control form-control" ToolTip="Branch" />--%>
                                     <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                          class="md-form-control form-control" ToolTip="Branch">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                    <asp:HiddenField ID="hfDesc" runat="server" />
                                    
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:CheckBox ID="CbxActive" runat="server" ToolTip="Active"/>
                                    <label class="tess">
                                        <asp:Label ID="lblActive" runat="server" Text="Active" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                    <asp:HiddenField ID="hfGLCode" runat="server" />
                                    <asp:HiddenField ID="hfSLCodeCnt" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:Panel runat="server" ID="panMemo" GroupingText="Memo Details" CssClass="stylePanel">
                            <%--<div class="row">--%>
                            <%--<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">--%>
                            <asp:GridView ID="gvMemo" runat="server" class="gird_details" AutoGenerateColumns="False"
                                HorizontalAlign="Center" OnRowCommand="gvMemo_RowCommand" OnRowDataBound="gvMemo_RowDataBound"
                                OnRowDeleting="gvMemo_RowDeleting" ShowFooter="true">
                                <Columns>
                                    <asp:TemplateField Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCode" runat="server" Text='<%# Eval("Lookup_Code") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFCode" runat="server" Text='<%# Eval("Lookup_Code") %>' /></ItemTemplate>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemoID" runat="server" Text='<%# Eval("Memo_ID") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblfMemoID" runat="server" Text='<%# Eval("Memo_ID") %>' /></ItemTemplate>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Serial Number">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblSNO" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Memo Description" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="txtDesc" Text='<%# Eval("Lookup_Description")%>' ToolTip="Memo Description"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlDesc" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDesc_SelectedIndexChanged"
                                                    CssClass="md-form-control form-control login_form_content_input" ToolTip="Memo Description">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="GL Account" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="txtGLAC" Text='<%# Eval("GL_Account")%>' ToolTip="GL Account"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <%--<asp:DropDownList ID="ddlGL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGL_SelectedIndexChanged"
                                                    CssClass="md-form-control form-control login_form_content_input">
                                                    <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                                </asp:DropDownList>--%>
                                                <uc:Suggest ID="ddlGL" runat="server" AutoPostBack="True" OnItem_Selected="ddlGL_SelectedIndexChanged" ToolTip="GL Account"
                                                    ServiceMethod="GetGLAccountDetails" WatermarkText="--Select--" class="md-form-control form-control login_form_content_input requires_false" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SL Account" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="txtSL" Text='<%# Eval("SL_Account")%>' ToolTip="SL Account"></asp:Label>
                                            <%-- <asp:TextBox ID="txtSL" runat="server" MaxLength="3" Text='<%# Eval("SL_Account")%>' Width="200px" ReadOnly="true"></asp:TextBox>--%>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <%--<asp:DropDownList ID="ddlSL" runat="server" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input">
                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                </asp:DropDownList>--%>
                                                <uc:Suggest ID="ddlSL" runat="server" ToolTip="SL Account" Enabled="false"
                                                    ServiceMethod="GetSLAccountDetails" WatermarkText="--Select--" class="md-form-control form-control login_form_content_input requires_false" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server" CssClass="grid_btn_delete"
                                                CausesValidation="false" AccessKey="R" title="Remove[Alt+R]" />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                          <%--  <asp:Button ID="btnAddrow" CausesValidation="false" runat="server" CommandName="AddNew" AccessKey="A" title="Add[Alt+A]"
                                                CssClass="grid_btn" Text="Add"></asp:Button>--%>
                                            <button ID="btnAddrow" runat="server" type="button" accesskey="A" title="Add[Alt+A]" 
                                                CausesValidation="false" class="grid_btn" onserverclick="btnAddrow_Click">
                                                <i class="fa fa-plus" aria-hidden="true"></i><u>A</u>dd
                                            </button>                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <%--</div>--%>
                            <%--  </div>--%>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnSave" runat="server" class="css_btn_enabled" type="submit" accesskey="S" title="Save[Alt+S]"
                        onclick="if(fnCheckPageValidators())" onserverclick="btnSave_Click" causesvalidation="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave  
                    </button>
                    <button id="btnClear" runat="server" class="css_btn_enabled" type="submit" accesskey="L" title="Clear[Alt+L]"
                        causesvalidation="False" onserverclick="btnClear_Click" onclick="if(fnConfirmClear())">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <%--  <cc1:ConfirmButtonExtender ID="btnAssetClear_ConfirmButtonExtender" runat="server"
                            ConfirmText="Are you sure you want to Clear?" Enabled="True" TargetControlID="btnClear">
                        </cc1:ConfirmButtonExtender>--%>
                    <button id="btnCancel" runat="server" class="css_btn_enabled" type="submit" causesvalidation="False"
                        onserverclick="btnCancel_Click" accesskey="X" title="Exit[Alt+X]" onclick="if(fnConfirmExit())">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%--<asp:ValidationSummary ID="vsMemo" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):  " />--%>
                        <%--<asp:CustomValidator ID="cvMemo" runat="server" Display="Dynamic"></asp:CustomValidator>--%>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" class="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
