<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgComplainceMaster_Add, App_Web_midi1nyg" %>

<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function fnvalidcustomername(txtCustomerName) {
            if (txtCustomerName.value == "0") {
                alert('Customer Name should not be 0');
                document.getElementById(txtCustomerName.id).focus();
            }
        }
        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
        }
        function checkDate_ApplicationDate(sender, args) {
            //debugger;
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 1;
            if (vartoday >= selectedDate) {
                alert('Group limit expiry Date should be greater than Current Date');
                document.getElementById("<%= txtGroupLimiExpDate.ClientID %>").value = "";
            }
        }
    </script>


    <asp:UpdatePanel ID="upCollection" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtGroupCode" runat="server" MaxLength="20" onkeyup="maxlengthfortxt(20);" onfocusOut="fnvalidcustomername(this);" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Group Code"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="ftxtCustomerName" ValidChars=" .&" TargetControlID="txtGroupCode"
                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvtxtGroupCode" runat="server"
                                            ControlToValidate="txtGroupCode" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                            ErrorMessage="Enter the Group Code" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lbltxtGroupCode" CssClass="styleReqFieldLabel" Text="Group Code"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtGroupName" runat="server" MaxLength="100" onkeyup="maxlengthfortxt(100);" onfocusOut="fnvalidcustomername(this);" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Group Name"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="flttxtGroupName" ValidChars=" .&" TargetControlID="txtGroupName"
                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvtxtGroupName" runat="server"
                                            ControlToValidate="txtGroupName" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                            ErrorMessage="Enter the Group Name" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lbltxtGroupName" CssClass="styleReqFieldLabel" Text="Group Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtGroupLimit" runat="server" MaxLength="15"
                                        Style="text-align: right;" ToolTip="Group Limit" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="flttxtGroupLimit" runat="server"
                                        FilterType="Custom, Numbers" Enabled="true" TargetControlID="txtGroupLimit">
                                    </cc1:FilteredTextBoxExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvGroupLimit" runat="server"
                                            ControlToValidate="txtGroupLimit" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                            InitialValue="" ErrorMessage="Enter the Group Limit" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblGroupLimit" CssClass="styleReqFieldLabel" Text="Group Limit" ToolTip="Group Limit"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtGroupLimiExpDate" runat="server" Enabled="true" AutoPostBack="true"
                                        ToolTip="Factoring Limit Expiry date" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <cc1:CalendarExtender runat="server" TargetControlID="txtGroupLimiExpDate"
                                        Format="DD/MM/YYYY" ID="calGroupLimiExpDate" Enabled="true" OnClientDateSelectionChanged="checkDate_ApplicationDate">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvtxtGroupLimiExpDate" runat="server"
                                            ControlToValidate="txtGroupLimiExpDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                            InitialValue="" ErrorMessage="Enter the Group Limit Expiry Date" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblGroupExpDate" CssClass="styleReqFieldLabel" Text="Group Limit Expiry Date"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkHActive" runat="server" ToolTip="Active" Checked="true" Enabled="false" />
                                    <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active" ToolTip="Active" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:Button ID="btnLoadCustomer" Style="display: none" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomerMapFWC_Click" />
                                    <asp:TextBox ID="txtCusomerCodeMapFWChidden" runat="server" ToolTip="Clients Customer" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="display: none;" MaxLength="50"></asp:TextBox>
                                    <UC4:ICM ID="ucCustomerCodeLov" WatermarkTextEnable="false" ValidationGroup="vgAdd" ToolTip="Client Customer Code" ShowHideAddressImageButton="false" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                        strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerLovCustomerMapFWC_Item_Selected" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblCustomerCode" CssClass="styleDisplayLabel" Text="Customer"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtCusomerCodeMapFWChidden" runat="server" ControlToValidate="txtCusomerCodeMapFWChidden"
                                            ErrorMessage="Select the Customer" ValidationGroup="vgAdd" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <button class="css_btn_enabled" id="lnkAdd" title="Add [Alt+V]" causesvalidation="true" validationgroup="vgAdd" onserverclick="lnkAddCustomerMapFWC_Click" runat="server"
                                        type="submit" accesskey="V">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u></u>Add
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <asp:Panel ID="pnlGroupCustomerMapping" class="container" GroupingText="Group/Customer Mapping"
                                runat="server" Width="100%" CssClass="stylePanel">
                                <div class="gird">
                                    <asp:HiddenField ID="hdnMaxlimit" runat="server" />
                                    <asp:HiddenField ID="hdnLimitExpDate" runat="server" />
                                    <asp:GridView ID="grvCustSubLimit" HorizontalAlign="Center" runat="server" Width="50%" DataKeyNames="Serial_Number" class="gird_details" AutoGenerateColumns="false"
                                        ShowFooter="false" OnRowDataBound="grvCustSubLimit_RowDataBound"
                                        OnRowCommand="grvCustSubLimit_RowCommand"
                                        OnRowDeleting="grvCustSubLimit_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:Label ID="lblSerialNo" Value='<%#Eval("Serial_Number") %>' ToolTip="S.No" runat="server"></asp:Label>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle Width="2%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle Width="2%" HorizontalAlign="Center" />
                                                <FooterStyle Width="2%" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Code/Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEntityId" Text='<%#Eval("ENTITY_ID") %>' Visible="false" runat="server" />
                                                    <asp:Label ID="lblEntityName" Text='<%#Eval("ENTITY_NAME") %>' ToolTip="Customer Code/Name" runat="server"
                                                        Width="90%"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="70%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle Width="70%" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Max Lending Limit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMaxLimit" Text='<%#Eval("MAX_LIMIT") %>' ToolTip="Max lending limit" runat="server"
                                                        Width="90%"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="70%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle Width="70%" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Limit Expiry Date" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbllimitExpDate" Text='<%#Eval("LIMIT_EXP_DATE") %>' runat="server" />
                                                </ItemTemplate>
                                                <HeaderStyle Width="70%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle Width="70%" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <table width="50%">
                                                        <tr>
                                                            <td>
                                                                <asp:LinkButton ID="lnkRemove" runat="server" ToolTip="Delete [Alt+2]" Text="Delete" CommandName="Delete"
                                                                    OnClientClick="return confirm('Are you sure want to delete?');" AccessKey="2" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <ItemStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                                <HeaderStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </div>


                        <div class="row">
                            <asp:Panel ID="pnlLimit_Transfer" class="container" GroupingText="Limit Transfer"
                                runat="server" Width="100%" Height="340px" CssClass="stylePanel">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlFromCustomer" runat="server" AutoPostBack="True" ToolTip="From Customer" CssClass="md-form-control form-control"
                                                    OnSelectedIndexChanged="ddlFromCustomer_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="From Customer" CssClass="styleReqFieldLabel" ID="lblFromCustomer"></asp:Label>
                                                </label>
                                                <%-- <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvddlFromCustomer" runat="server" ErrorMessage="Select the Line of Business" SetFocusOnError="true" ValidationGroup="Save"
                                                        ControlToValidate="ddlFromCustomer" InitialValue="0" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtUtilizedLimit" runat="server" MaxLength="20" enabled="false"
                                                    Style="text-align: right;" ToolTip="Utilized Limit" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>


                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblUtilizedLimit" CssClass="styleDisplayLabel" Text="Utilized Limit" ToolTip="Utilized Limit"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAvailableLimit" runat="server" MaxLength="20" enabled="false"
                                                    Style="text-align: right;" ToolTip="Available Limit" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>


                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblAvailableLimit" CssClass="styleDisplayLabel" Text="Available Limit" ToolTip="Available Limit"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlToCustomer" runat="server" AutoPostBack="True" ToolTip="To Customer" CssClass="md-form-control form-control"
                                                    OnSelectedIndexChanged="ddlToCustomer_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="To Customer" CssClass="styleDisplayLabel" ID="lblToCustomer"></asp:Label>
                                                </label>
                                                <%-- <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvddlFromCustomer" runat="server" ErrorMessage="Select the Line of Business" SetFocusOnError="true" ValidationGroup="Save"
                                                        ControlToValidate="ddlFromCustomer" InitialValue="0" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtTransferAmount" runat="server" MaxLength="15"
                                                    Style="text-align: right;" ToolTip="Transfer Amount" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftetxtTransferAmount" runat="server"
                                                    FilterType="Custom, Numbers" Enabled="true" TargetControlID="txtTransferAmount">
                                                </cc1:FilteredTextBoxExtender>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblTransferAmount" CssClass="styleDisplayLabel" Text="Transfer Amount" ToolTip="Transfer Amount"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <h6 class="title_name">
                                                <asp:Label runat="server" ID="lblLimitGridHeader"  Text="Limit Transfer History">
                                                </asp:Label>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="gird">
                                            <asp:GridView ID="gvLimit_transfer_history" runat="server" class="gird_details" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Limit Transfer Id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLimitTransfer_ID" runat="server" Text='<%#Eval("LIMIT_TRANSFER_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="From Customer">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFromCustomer" runat="server" Text='<%#Eval("FROM_CUSTOMER") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="To Customer">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblToCustomer" runat="server" Text='<%#Eval("TO_CUSTOMER") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Transfer Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTransfer_amount" runat="server" Text='<%#Eval("TRANSFER_AMOUNT") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Modified By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblModified_By" runat="server" Text='<%#Eval("USER_NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Modified On">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblModified_On" runat="server" Text='<%#Eval("MODIFIED_ON") %>'></asp:Label>
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
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onclick="if(fnCheckPageValidators('Save'))" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" validationgroup="vgHeader">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" causesvalidation="false" onclick="if(fnConfirmClear())" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onclick="if(fnConfirmExit())" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--onclick="if(fnCheckPageValidators('Save'))" 
    onclick="if(fnConfirmClear())" 
    onclick="if(fnConfirmExit())" --%>
</asp:Content>
