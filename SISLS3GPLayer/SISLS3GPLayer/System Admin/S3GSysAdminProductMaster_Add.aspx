<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminProductMaster_Add.aspx.cs" ValidateRequest="false" Inherits="S3GSysAdminProductMaster_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="mbcbb" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <script language="javascript" type="text/javascript">
                function fnchksplchar() {
                    var key = (typeof window.event != 'undefined') ? window.event.keycode : e.keycode;
                    if (key != undefined) {
                        alert(key);
                        if (((key < '97') || (key > '122')) && ((key < '65') || (key > '90')) && ((key < '48') || (key > '57'))) {
                            event.keycode = 0;
                            return false;
                        }
                    }
                    else {
                        var sKeyCode = window.event.keyCode;
                        if (((window.event.keyCode < 97) || (window.event.keyCode > 122)) && ((window.event.keyCode < 65) || (window.event.keyCode > 90))) {
                            window.event.keyCode = 0;
                            return false;
                        }
                    }
                }
                function TabOrder() {
                    alert('in');
                    if (window.event.keyCode == 9) {
                        alert(window.event.keyCode);
                        var txtdesc = document.getElementById('ctl00_ContentPlaceHolder1_txtProductDesc');
                        //var btncmb=document.getElementById('ctl00_ContentPlaceHolder1_cmbRoleCenterCode_Button');
                        document.getElementById(txtdesc.id).focus();
                    }
                }
            </script>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        <div>
                            <div class="row">
                                <div class="col">
                                    <h6 class="title_name">
                                        <asp:Label runat="server" ID="lblHeading">
                                        </asp:Label>
                                    </h6>
                                </div>
                                <%-- <div class="col" align="right">
                                    <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                                    <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                                </div>--%>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row" style="margin-top: 10px;">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">

                                                <asp:DropDownList ID="ddlLOB" runat="server"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddLOB_SelectedIndexChanged" ToolTip="Line of Business"
                                                    class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ValidationGroup="Add"
                                                        ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select a Line of Business"
                                                        Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <mbcbb:ComboBox ID="cmbProductCode" runat="server" AppendDataBoundItems="false" AutoCompleteMode="None"
                                                    AutoPostBack="True" CssClass="WindowsStyle" DropDownStyle="Simple" MaxLength="3"
                                                    OnSelectedIndexChanged="cmbProductCode_SelectedIndexChanged"
                                                    ToolTip="Scheme Code" OnItemInserted="cmbProductCode_ItemInserted">
                                                </mbcbb:ComboBox>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvProductCode" CssClass="validation_msg_box_sapn" runat="server" ValidationGroup="Add"
                                                        ControlToValidate="cmbProductCode" InitialValue="0" ErrorMessage="Enter/Select a Scheme Code"
                                                        SetFocusOnError="True" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <%--<asp:RegularExpressionValidator ID="ReqValContactPerson_SpecialChars" runat="server" CssClass="validation_msg_box_sapn"
                                                        ControlToValidate="cmbProductCode" Display="Dynamic" ValidationGroup="Add"
                                                        ErrorMessage="Please enter valid first name" SetFocusOnError="True"
                                                        ValidationExpression="[\%\/\\\&\?\,\'\;\:\!\-]+"></asp:RegularExpressionValidator>--%>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblProductCode" runat="server" CssClass="styleReqFieldLabel" Text="Scheme Code"> </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtProductDesc" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="40"
                                                    Style="background-image: url('');" ToolTip="Scheme Description"></asp:TextBox>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvProductDesc" runat="server" ControlToValidate="txtProductDesc" ValidationGroup="Add"
                                                        SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Scheme Description"
                                                        Text="Enter Scheme Description">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblProductDesc" runat="server" CssClass="styleReqFieldLabel" Text="Scheme Description"> </asp:Label>
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display:none;">
                                            <div class="md-input" >
                                                <asp:CheckBox ID="chkasset" runat="server" AutoPostBack="true" Checked="true" Visible="false" Enabled="false" OnCheckedChanged="chkasset_OnCheckedChanged"
                                                    ToolTip="Asset Required" />
                                                <asp:Label ID="lblasset" runat="server" CssClass="styleDisplayLabel" Text="Asset Required">
                                                </asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:CheckBox ID="chkActive" runat="server" Checked="true" ToolTip="Active" />
                                                <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel"  style="display:none;">
                                            <div class="md-input">
                                                <asp:CheckBox ID="chkmonthly" runat="server" ToolTip="Monthly Charge" Checked="true" Visible="false" OnCheckedChanged="chkmonthly_OnCheckedChanged" AutoPostBack="true" />
                                                <asp:Label ID="lblmonthly" runat="server" CssClass="styleDisplayLabel" Text="Monthly Charge"></asp:Label>
                                            <asp:HiddenField ID="hdnsearialno" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:UpdatePanel ID="grid" runat="server">
                                        <ContentTemplate>
                                            <div align="center" class="gird col-md-12">
                                                <asp:GridView ID="gvInflow" runat="server" AutoGenerateColumns="False" EditRowStyle-CssClass="styleFooterInfo"
                                                    ShowFooter="True" OnRowDataBound="gvInflow_RowDataBound" OnRowDeleting="gvInflow_Deleting" Width="100%"
                                                    DataKeyNames="Sno" class="gird_details">
                                                    <RowStyle HorizontalAlign="Left" Width="100%" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl.No." ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                                                <asp:Label ID="lblProd_CashflowDet_Id" runat="server" Visible="false" Text='<% #Bind("Prod_Cashflow_Det_Id")%>'></asp:Label>
                                                            <asp:Label ID="lblmaster_id" runat="server" Text='<% #Bind("Master_Id")%>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cash Inflow">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCashInflow" runat="server" Text='<%# Bind("Cashinflow") %>'></asp:Label>
                                                                <asp:Label ID="lblCashInflow_ID" runat="server" Text='<%# Bind("Cashflow_ID") %>'
                                                                    Visible="false"></asp:Label>
                                                                <asp:Label ID="lblchargetypee" runat="server" Text='<%# Bind("chargetype") %>' Visible="false"></asp:Label>
                                                                <%-- <asp:Label ID="cashflowlabel" runat="server" Visible="false" Text='<%# Bind("Cashflow_IDD") %>'></asp:Label>--%>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlCashInflow" AutoPostBack="true" OnSelectedIndexChanged="DropDownCashflow_SelectedIndexChanged" CssClass="md-form-control form-control"
                                                                        runat="server" ToolTip="Cash Inflow">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ChargeType">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblchargetype" Text='<%# Bind("Charge") %> ' runat="server"></asp:Label>
                                                                <asp:Label ID="lblchargetypevalue" Text='<%# Bind("ChargeType") %>' Visible="false"
                                                                    runat="server">
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlChargeType" AutoPostBack="true" OnSelectedIndexChanged="DropDownchargetype_SelectedIndexChanged" CssClass="md-form-control form-control"
                                                                        runat="server" ToolTip="Charge Type">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Value" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnAssignIValue" runat="server" CssClass="grid_btn"
                                                                    CausesValidation="false" UseSubmitBehavior="false" OnClick="btnIAssignValue_Click" ToolTip="Assign Value,Alt+A"
                                                                    Width="50px" Text="Assign" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Button ID="btnAssignFValue" UseSubmitBehavior="false" runat="server" CausesValidation="false" CssClass="grid_btn"
                                                                    OnClick="btnFAssignValue_Click" ToolTip="Assign Value,Alt+A" AccessKey="A" Text="Assign" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkActive" runat="server" OnCheckedChanged="chkActive_CheckedChanged" AutoPostBack="true" Checked='<%#DataBinder.Eval(Container.DataItem, "Is_Active").ToString().ToUpper() == "TRUE"%>' />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:CheckBox ID="chkActiveF" runat="server" ToolTip="Active" TextAlign="Right" Checked="true" Enabled="false"></asp:CheckBox>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkDelete" UseSubmitBehavior="false" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="grid_btn_delete" AccessKey="R" ToolTip="Delete, Alt+R"
                                                                      OnClientClick="return confirm('Are you sure you want to remove?');" >
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Button ID="btnAdd" runat="server" CommandName="Add" CssClass="grid_btn"
                                                                    OnClick="btnAdd_Click" UseSubmitBehavior="false" Text="Add" ValidationGroup="Grid" ToolTip="Add,Alt+T" AccessKey="T" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>
                                                    </Columns>

                                                </asp:GridView>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                            </div>
                            <%--onserverclick="btnSave_Click"
                                 onclick="return fnCheckPageValidators('Add');"
                                onclick="if(!confirm('Sure?')) return;"
                            --%>

                            <div class="btn_height"></div>
                            <div align="right" class="fixed_btn">

                                <button class="css_btn_enabled" id="btnSave" runat="server" type="button" onserverclick="btnSave_Click" causesvalidation="false"
                                    onclick="if(fnCheckPageValidators('Add'))" accesskey="S" title="Save,Alt+S" validationgroup="Add">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>

                                <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_ServerClick" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                                    type="button" accesskey="L" title="Clear[Alt+L]">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>


                                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false"
                                    type="button" accesskey="X" title="Exit[Alt+X]" onclick="if(fnConfirmExit())">
                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>
                            <%--    <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row" style="float: right; margin-top: 5px;">
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnSave" runat="server" CausesValidation="false" CssClass="save_btn fa fa-floppy-o"
                                                OnClick="btnSave_Click" Text="Save" ToolTip="Save,Alt+V" AccessKey="V" OnClientClick="return fnCheckPageValidators('Add');"
                                                ValidationGroup="Add" />
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-times btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnClear" runat="server" CssClass="save_btn fa fa-eraser-o" CausesValidation="false"
                                                OnClick="btnClear_Click" Text="Clear" ToolTip="Clear,Alt+L" AccessKey="L" />
                                            <mbcbb:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to clear?"
                                                TargetControlID="btnClear">
                                            </mbcbb:ConfirmButtonExtender>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                            <asp:Button ID="btnCancel" runat="server" CausesValidation="false" CssClass="save_btn fa fa-share-o" OnClientClick="return fnConfirmExit();"
                                                OnClick="btnCancel_Click" Text="Exit" ToolTip="Exit,Alt+X" AccessKey="X" />
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                        <div style="display: none;">
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                            <%--                            <asp:ValidationSummary ID="ProductDetailsAdd" runat="server" HeaderText="Correct the following validation(s):"
                                CssClass="styleMandatoryLabel" ShowSummary="true" ValidationGroup="Add" />--%>
                        </div>
                        <div>
                            <input type="hidden" id="hdnID" runat="server" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <%--<div class="col-md-12">--%>
            <cc1:ModalPopupExtender ID="ModalPopupExtenderAssignValue" runat="server" TargetControlID="btnModal"
                PopupControlID="PnlAssignAmount" BackgroundCssClass="styleModalBackground" Enabled="true">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="PnlAssignAmount" Style="display: none; vertical-align: middle" runat="server"
                BorderStyle="Solid" BackColor="White" Width="90%">
                <asp:UpdatePanel ID="upPass" runat="server">
                    <ContentTemplate>

                        <div>
                            <div class="row">
                                <div class="gird col-md-12">
                                    <div id="divTransaction" class="container" runat="server" style="height: 200px; width: 640px;">
                                        <br />
                                        <br />
                                        <asp:GridView ID="grvAssignValue" runat="server" ShowFooter="true" AutoGenerateColumns="false"
                                            Width="99%" Height="50px" OnRowCommand="grvassign_rowcommand" OnRowDeleting="grv_RowDeleting"
                                            OnRowDataBound="grvAssignValue_RowDataBound" CssClass="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" Text='<% #Bind("SNo")%>' Visible="false" runat="server"></asp:Label>
                                                        <asp:Label ID="Label1" Style="text-align: right" Text='<%#Container.DataItemIndex+1%>'
                                                            Visible="true" runat="server"> </asp:Label>
                                                        <asp:Label ID="cashflowid" runat="server" Text='<% #Bind("cashflowid")%>' Visible="false"></asp:Label>
                                                        <%--<asp:Label ID="lblProd_Cashflow_Det_Id" runat="server" Text='<% #Bind("Prod_Cashflow_Det_Id")%>'></asp:Label>--%>
                                                        <asp:Label ID="lblmasterid" runat="server" Text='<% #Bind("Master_Id")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="From Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFromAmount" ToolTip="Sequence Number" Style="text-align: right"
                                                            Text='<% #Bind("FromAmount")%>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtFromAmount" runat="server" Style="text-align: right" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fromamount" runat="server" TargetControlID="txtFromAmount"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="To Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToAmount" Visible="true" Style="text-align: right" Text='<% #Bind("ToAmount")%>'
                                                            runat="server">
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtToamount" runat="server" Style="text-align: right" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <cc1:FilteredTextBoxExtender ID="toamount" runat="server" TargetControlID="txtToamount"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Percentage/Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpercentageoramount" Style="text-align: right" Visible="true" Text='<% #Bind("PercentageorAmount")%>'
                                                            runat="server">
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtpercentageoramount" Style="text-align: right" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="Filter" runat="server" TargetControlID="txtpercentageoramount"
                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <div class="validation_msg_box">
                                                                <asp:RangeValidator ID="Regx" runat="server" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="PopUpAdd"
                                                                    ControlToValidate="txtpercentageoramount" Visible="false" MaximumValue="100"
                                                                    MinimumValue="0" ErrorMessage="Percentage should not exceed 100%"></asp:RangeValidator>
                                                            </div>
                                                        </div>
                                                        <%-- <asp:RegularExpressionValidator ID="Regx" Visible="false" ValidationGroup="PopUpAdd"
                                                                            ValidationExpression="^((100)|(\d{0,2}))$" ControlToValidate="txtpercentageoramount"
                                                                            Display="None" runat="server" ErrorMessage="Enter 1-100 Percentage with Round of 2 "></asp:RegularExpressionValidator>--%>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkAssignDelete" runat="server" CausesValidation="false" CommandName="Delete" CssClass="grid_btn_delete" AccessKey="C" ToolTip="Alt+C"
                                                            Style="text-align: right" Text="Delete" OnClientClick="return confirm('Are you sure want to Delete this record?');">
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnAddd" runat="server" CausesValidation="true" CommandName="Add"
                                                            CssClass="grid_btn" Text="Add" ValidationGroup="PopUpAdd" ToolTip="Add,Alt+B" AccessKey="B" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="btn_height"></div>
                            <div align="right">


                                <button class="css_btn_enabled" id="btnModalAdd" visible="false" onserverclick="btnModalAdd_Click" runat="server" accesskey="S"
                                    type="button"  causesvalidation="false" title="Save[Alt+S]">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>

                                <button class="css_btn_enabled" id="btnModalCancel" onserverclick="btnModalCancel_Click" runat="server" causesvalidation="false" title="Hide[Alt+H]"
                                    type="button" accesskey="H">
                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>H</u>ide
                                </button>



                                <%--  
                                                <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />--%>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
            <asp:Button ID="btnModal" Style="display: none" runat="server" />
            <%--  </div>--%>
        </div>
    </div>

</asp:Content>
