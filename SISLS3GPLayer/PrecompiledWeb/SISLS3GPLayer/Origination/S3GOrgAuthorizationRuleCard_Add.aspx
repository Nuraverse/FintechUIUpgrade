<%@ page title="S3G - Authorization Rule Card" language="C#" autoeventwireup="true" masterpagefile="~/Common/MasterPage.master" inherits="Origination_S3GOrgAuthorizationRuleCard_Add, App_Web_54a2gfky" validaterequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function ChkToamountValidate(txtFrm, txtTo) {
            var frmamt = 'ctl00_ContentPlaceHolder1_' + txtFrm;
            var toamt = 'ctl00_ContentPlaceHolder1_' + txtTo;
            var txtfrmamt = document.getElementById(frmamt).value;
            var txttoamt = document.getElementById(toamt).value;
            if (txtfrmamt != "") {
                if (parseFloat(txttoamt) < parseFloat(txtfrmamt)) {
                    document.getElementById(toamt).value = "";
                    alert("ToAmount Should Be Greater Than FromAmount");
                    document.getElementById(toamt).focus();
                }
                else
                    return true;
            }
            else {
                document.getElementById(toamt).value = "";
                alert("Shoud Be Enter FromAmount Before Enter ToAmount");
                document.getElementById(frmamt).focus();
            }
        }
        function ValidateMandatory1() {
            TargetBaseControl = document.getElementById('ctl00_ContentPlaceHolder1_grvAuthorizationrulecardDetail');
            var Inputs = TargetBaseControl.getElementsByTagName("input");
            var TotalScore = 0;
            for (var n = 0; n < Inputs.length; ++n) {
                if (Inputs[n].type == 'text') {
                    if (Inputs[n].value != '') {
                        if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 13) == 'AddFromAmount') {
                            var fromamount = parseFloat(Inputs[n].value)
                        }
                        if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 11) == 'AddToAmount') {
                            var Toamount = parseFloat(Inputs[n].value)
                            if (fromamount >= Toamount) {
                                document.getElementById(Inputs[n].id).focus();
                                alert(' To Amount should be greater than From Amount ');
                                return false;
                            }
                        }
                    }
                    else {
                        if (n == 0) {
                            document.getElementById(Inputs[n].id).focus();
                            alert('Enter From Amount');
                            return false;
                        }
                        if (n == 1) {
                            document.getElementById(Inputs[n].id).focus();
                            alert('Enter To Amount');
                            return false;
                        }
                        if (n == 2) {
                            document.getElementById(Inputs[n].id).focus();
                            alert('Enter Total Approval(s)');
                            return false;
                        }

                        //             if(n==3)
                        //             {
                        //             document.getElementById(Inputs[n].id).focus();
                        //             alert('Enter Level 4 Approval(s)');
                        //             return false;
                        //             }
                    }

                }
                //         else
                //         {     
                //                          
                //                          if(document.getElementById('ctl00$ContentPlaceHolder1$grvAuthorizationrulecardDetail$ctl03$ddlEntityType').options.value=="-1")
                //                          {
                //                             alert('Select a Entity Type');
                //                             document.getElementById('ctl00$ContentPlaceHolder1$grvAuthorizationrulecardDetail$ctl03$ddlEntityType').focus();
                //                             return false;
                //                          }
                //                     
                //         }               

            }
        }

    </script>

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
                    <%-- <div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                        onmouseover="ddl_itemchanged(this);" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlLOB" ValidationGroup="Save" InitialValue="0" ErrorMessage="Select Line of Business"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlConstitution" runat="server" ToolTip="Constitution" onmouseover="ddl_itemchanged(this);" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Constitution" ID="lblConstitution" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlproduct" runat="server" ToolTip="Scheme" onmouseover="ddl_itemchanged(this);" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Scheme" ID="lblproduct" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <%--  </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divTran" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlTransacType" Visible="false" runat="server" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Transaction Type" ID="lbltrasactionType" Visible="false"
                                            CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlprogram" runat="server" onmouseover="ddl_itemchanged(this);" class="md-form-control form-control" ToolTip="Program">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="validation_msg_box_sapn"
                                            runat="server" ControlToValidate="ddlprogram" ValidationGroup="Save" InitialValue="0"
                                            ErrorMessage="Select Program" Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Program" ID="lblprogram" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlEntityType" runat="server" class="md-form-control form-control" ToolTip="Approver Type" AutoPostBack="true" OnSelectedIndexChanged="ddlEntityType_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Designation" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="User Level" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="User Name" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvEntityType" CssClass="validation_msg_box_sapn" runat="server"
                                            InitialValue="-1" ControlToValidate="ddlEntityType" ValidationGroup="Save" ErrorMessage="Select Approver Type"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Approver Type" ID="lblEntityType" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>

                                </div>
                            </div>
                            <%--</div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label ID="Label1" runat="server" Text="Active"></asp:Label>&nbsp;
                                    <asp:CheckBox ID="ChkActive" runat="server" Checked="True" ToolTip="Active" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <asp:Panel ID="panDateFormat" GroupingText="Authorization Rule Card Details" runat="server"
                                    Width="100%" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <br></br>
                                            <asp:GridView ID="grvAuthorizationrulecardDetail" ShowFooter="true" AutoGenerateColumns="false" CssClass="gird_details"
                                                runat="server" OnRowCommand="grvAuthorizationrulecardDetail_RowCommand" OnRowDataBound="grvAuthorizationrulecardDetail_RowDataBound"
                                                OnRowDeleting="grvAuthorizationrulecardDetail_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                            <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="From Amount">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtFromAmount" MaxLength="12" EnableViewState="true" ToolTip="From Amount" Text='<%# Bind("From_Amount")%>'
                                                                runat="server" class="md-form-control form-control login_form_content_input" Enabled="false" Style="text-align: right"></asp:TextBox>
                                                            <%--<asp:Label ID="lblRulecardDetailID" runat="server" Text='<%# Bind("Authorization_Rule_Card_Detail_ID")%>'--%>
                                                            <%--Code changed for oracle table column name - Kuppusamy.B - 03/11/2011--%>
                                                            <asp:Label ID="lblRulecardDetailID" runat="server" Text='<%# Bind("AUTH_RULE_CARD_DET_ID")%>'
                                                                Visible="false"></asp:Label>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtFromAmount"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30%" HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtAddFromAmount" MaxLength="12" runat="server" ToolTip="From Amount" Enabled="false"
                                                                    class="md-form-control form-control login_form_content_input" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtAddFromAmount"
                                                                    FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </FooterTemplate>
                                                        <FooterStyle Width="30%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="To Amount">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtToAmount" MaxLength="12" Style="text-align: right" ToolTip="To Amount"
                                                                class="md-form-control form-control login_form_content_input" Enabled="false"
                                                                Text='<%# Bind("To_Amount")%>' runat="server"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtToAmount"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30%" HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtAddToAmount" MaxLength="12" runat="server" ToolTip="To Amount"
                                                                    class="md-form-control form-control login_form_content_input">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtAddToAmount"
                                                                    FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                            </div>
                                                            <span class="bar">
                                                        </FooterTemplate>
                                                        <FooterStyle Width="30%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Total Approvals">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txttotalapproval" MaxLength="1" Text='<%# Bind("Total_Approvals")%>'
                                                                        Width="20%" Style="text-align: right" runat="server"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txttotalapproval"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtAddtotalapprovals" MaxLength="1" runat="server" Width="20%" Style="text-align: right">
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtAddtotalapprovals"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </FooterTemplate>
                                                                <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>--%>
                                                    <%--<asp:TemplateField HeaderText="Level 4/5 Approvals">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtlevel4approvals" MaxLength="1" Text='<%# Bind("Level4_Approvals")%>' Width="20%"
                                                                        runat="server" Style="text-align: right"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtlevel4approvals"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtAddlevel4approvals" MaxLength="1" runat="server" Width="20%" Style="text-align: right">
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtAddlevel4approvals"
                                                                        FilterType="Numbers" Enabled="true">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </FooterTemplate>
                                                                <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>--%>
                                                    <%--<asp:TemplateField HeaderText="Entity Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEntityType" runat="server" Text='<%# Bind("Level4_Approvals")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlEntityType" runat="server">
                                                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="Designation" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="User Level" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="User Name" Value="3"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvEntityType" runat="server" Enabled="true" ErrorMessage="Select a Entity Type"
                                                                        Display="None" ControlToValidate="ddlEntityType" InitialValue="-1" SetFocusOnError="true">
                                                                    </asp:RequiredFieldValidator>--%>
                                                    <%--</FooterTemplate> </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Approver">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnIApprover" CssClass="css_btn_enabled" runat="server" Text="Approver" Width="100px"
                                                                OnClick="btnIApprover_Click" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        <FooterTemplate>
                                                            <asp:Button ID="btnFApprover" CssClass="css_btn_enabled" runat="server" Text="Approver" AccessKey="A" ToolTip="Approver,Alt+A"
                                                                Width="100px" OnClick="btnFApprover_Click" OnClientClick="return ValidateMandatory1();" />
                                                        </FooterTemplate>
                                                        <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server" CssClass="grid_btn_delete"
                                                                CausesValidation="false" AccessKey="R" ToolTip="Remove,Alt+R" />
                                                            <asp:Label ID="lblRowStatus" runat="server" Text='<%# Bind("RowStatus")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        <FooterTemplate>
                                                            <asp:Button ID="btnDetails" Text="Add" OnClientClick="return ValidateMandatory1();" AccessKey="N" ToolTip="Add,Alt+N"
                                                                CommandName="AddNew" runat="server" CssClass="css_btn_enabled" CausesValidation="false" />
                                                        </FooterTemplate>
                                                        <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 md-input">
                                            <asp:Button ID="btnReset" Visible="false" CssClass="css_btn_enabled" Text="Reset" AccessKey="R" ToolTip="Reset,Alt+R"
                                                runat="server" CausesValidation="false" OnClick="btnReset_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="btn_height"></div>
                        <div align="right" class="fixed_btn">
                            <button runat="server" id="btnSave" onclick="if(fnCheckPageValidators('Save'))" accesskey="S" title="Save[Alt+S]"
                                class="css_btn_enabled" validationgroup="Save" type="button" onserverclick="btnSave_Click" causesvalidation="false">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                            </button>
                            <button id="btnClear" class="css_btn_enabled" runat="server" onserverclick="btnClear_Click" type="button"
                                onclick="if(fnConfirmClear())" causesvalidation="false" accesskey="L" title="Clear[Alt+L]">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                            </button>
                            <i class="fa fa-share btn_i" aria-hidden="true"></i>
                            <button runat="server" id="btnCancel" text="Exit" causesvalidation="false" onclick="if(fnConfirmExit())"
                                class="css_btn_enabled" onserverclick="btnCancel_Click" accesskey="X" title="Exit[Alt+X]" type="button">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>
                        <%--<div class="row">
                            <div class="col">
                                <div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="row" style="float: right; margin-top: 5px;">
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <%--<asp:ValidationSummary ID="AuthorizationRulecardAdd" ValidationGroup="Save" runat="server"
                                    ShowSummary="true" HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />--%>
                                <input id="hdnGrvCnt" runat="server" value="0" type="hidden" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%-- <div class="row">
        <div class="col-md-12 ">--%>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <div class="row">
        <div class="col-md-12">
            <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
                BorderStyle="Solid" BackColor="White" Width="100%">
                <%--    <div>
                    <div class="row">
                        <div class="col">--%>
                <asp:UpdatePanel ID="upPass" runat="server">
                    <ContentTemplate>
                        <div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <%--  <div id="divTransaction" class="container" runat="server" width="100%">--%>
                                        <asp:GridView ID="grvApprover" runat="server" AutoGenerateColumns="false" Height="150px"
                                            OnRowDataBound="grvApprover_DataBound" OnRowDeleting="grvApprover_RowDeleting" Width="100%"
                                            ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" Text='<% #Bind("SNo")%>' Visible="false" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sequence Number" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSequenceNumber" ToolTip="Sequence Number" Text='<% #Bind("SequenceNumber")%>'
                                                            runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <%-- <FooterStyle Width="3%" HorizontalAlign="Center" />
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />--%>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Approval Entity" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalEntity" Visible="false" runat="server" Text='<% #Bind("ApprovEntity") %>'>
                                                            </asp:Label>
                                                            <asp:DropDownList ID="ddlApprovalEntity" ToolTip="Approval Entity" runat="server"
                                                                Visible="false">
                                                                <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Text="Designation" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="User Level" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="User Name" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Branch">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<% #Bind("Location")%>' ToolTip="Branch">
                                                        </asp:Label>
                                                        <asp:Label ID="lblLocationID" runat="server" Visible="false" Text='<% #Bind("LocationID")%>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <uc2:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                                OnItem_Selected="ddlLocation_SelectedIndexChanged" ErrorMessage="Select a Branch" ToolTip="Branch"
                                                                ValidationGroup="PopUpAdd" IsMandatory="true" class="md-form-control form-control" />
                                                            <%--<asp:DropDownList ID="ddlLocation" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                                ToolTip="Location" runat="server" Style="width: 150px">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ValidationGroup="PopUpAdd"
                                                                InitialValue="0" ControlToValidate="ddlLocation" Display="None" ErrorMessage="Select Location"></asp:RequiredFieldValidator>--%>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <%--<FooterStyle Width="3%" HorizontalAlign="Center" />
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />--%>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Approval Authority">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApprovalPerson" runat="server" Text='<% #Bind("ApprovPerson")%>' ToolTip="Approval Authority">
                                                        </asp:Label>
                                                        <asp:Label ID="ApprovPersonID" runat="server" Visible="false" Text='<% #Bind("ApprovPersonID")%>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:DropDownList ID="ddlApprovPerson" ToolTip="Approval Authority" runat="server" CssClass="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvApprovalPerson" runat="server" ValidationGroup="PopUpAdd" CssClass="validation_msg_box_sapn"
                                                                    ControlToValidate="ddlApprovPerson" Display="Dynamic" InitialValue="0" ErrorMessage="Select Approval Authority"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <%--<FooterStyle Width="3%" HorizontalAlign="Center" />
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />--%>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnDelete" Text="Delete" CommandName="Delete" runat="server" CssClass="grid_btn_delete"
                                                            CausesValidation="false" AccessKey="C" ToolTip="Delete,Alt+C" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnDetails" Text="Add" ValidationGroup="PopUpAdd" CommandName="Add" AccessKey="O" ToolTip="Add,Alt+O"
                                                            runat="server" CssClass="grid_btn" CausesValidation="false" OnClick="btnDetails_Click"
                                                            OnClientClick="return fnCheckPageValidators('PopUpAdd',false);" />
                                                    </FooterTemplate>
                                                    <%--<FooterStyle Width="3%" HorizontalAlign="Center" />
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />--%>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <%--  </div>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row" style="float: right; margin-top: 5px;">
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-right: 35px;">
                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnDEVModalAdd" runat="server" Text="Save" ToolTip="Save,Alt+V" AccessKey="V" class="css_btn_enabled"
                                                OnClick="btnDEVModalAdd_Click" />
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-right: 10px;">
                                            <i class="fa fa-reply btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnDEVModalCancel" runat="server" Text="Exit" OnClick="btnDEVModalCancel_Click" AccessKey="T"
                                                ToolTip="Exit,ALt+T" class="css_btn_enabled"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                        HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                                </div>
                            </div>--%>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--   </div>
                    </div>
                </div>--%>
            </asp:Panel>
            <!--modal popup -->

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <p>Some text in the modal.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%--</div>
    </div>--%>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />
</asp:Content>
