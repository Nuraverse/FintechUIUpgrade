<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminLookupMaster.aspx.cs" Inherits="System_Admin_S3GSysAdminLookupMaster"
    Title="S3G - Lookup Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function fnSaveValidation() {
            //Sathish R 13-09-2018
          
            if (confirm('Do you want to save?')) {
               
                var a = event.srcElement;
              
                if (a.type == "submit") {
                    a.style.display = 'none';
                }
                //End here
                //document.getElementById('ctl00_ContentPlaceHolder1_btnsave2').click();
                return true;
            }
            else {
                return false;
            }


        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel GroupingText="Lookup Values" ID="pnlLookInfo" runat="server"
                            CssClass="stylePanel">
                            <div class="row">
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlModule" runat="server" AutoPostBack="true" ToolTip="Module Name" class="md-form-control form-control"
                                            OnSelectedIndexChanged="ddlModule_SelectedIndexChanged" TabIndex="3"
                                            onmouseover="ddl_itemchanged(this);">
                                        </asp:DropDownList>
                                        <%--OnTextChanged="ddlModule_TextChanged" --%>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn" ValidationGroup="Add"
                                                runat="server" ControlToValidate="ddlModule" InitialValue="0" ErrorMessage="Select Module Name"
                                                Display="Dynamic">
                                      
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Module Name" ID="lblModule" CssClass="styleReqFieldLabel">
                                                <asp:Button ID="btnsave2" CausesValidation="false" Style="display: none" runat="server" OnClick="btnSave_Click" />
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlProgram" runat="server" TabIndex="4" ToolTip="Program Name" class="md-form-control form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"
                                            onmouseover="ddl_itemchanged(this);">
                                        </asp:DropDownList>


                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn" ValidationGroup="Add"
                                                ControlToValidate="ddlProgram" InitialValue="0" ErrorMessage="Select Program Name"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Program Name" ID="lblProgram" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc1:Suggest ID="ddlLookupTypeDesc" runat="server" AutoPostBack="true" ServiceMethod="GetLookupTypeDesc" OnItem_Selected="ddlLookupTypeDesc_Item_Selected" ToolTip="Field Name" ValidationGroup="Add" IsMandatory="true" class="md-form-control form-control" ErrorMessage="Select the Field Name" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>

                                            <asp:Label runat="server" Text="Field Name" CssClass="styleReqFieldLabel"
                                                ID="lblLookupTypeDesc">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <%--<tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Program Name" ID="lblDocType"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlDocType" onmouseover="ddl_itemchanged(this);" runat="server"
                                        Width="205px" TabIndex="4">
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width: 20%">
                                        <asp:RequiredFieldValidator ID="rfvDocType" runat="server" Display="None" ErrorMessage="Select the Program Name"
                                            ControlToValidate="ddlDocType" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>--%>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divRCUType" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlRCUType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRCUType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvRCUType" CssClass="styleMandatoryLabel"
                                            runat="server" ControlToValidate="ddlRCUType" ErrorMessage="Select the RCU Type"
                                            InitialValue="0" Display="None" Enabled="false">
                                        </asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="RCU Type" CssClass="styleReqFieldLabel" ID="lblRCU">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divLookupCode" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtLookupCode" runat="server" onkeyup="maxlengthfortxt(20);"  MaxLength="50" ToolTip="Lookup Code" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="fttxtLookupCode" TargetControlID="txtLookupCode"
                                            FilterType="Numbers" runat="server">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtLookupCode" SetFocusOnError="true" CssClass="validation_msg_box_sapn" runat="server" ValidationGroup="Add"
                                                ControlToValidate="txtLookupCode" ErrorMessage="Enter Lookup Code" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Lookup Code" CssClass="styleReqFieldLabel" ID="lblLookupCode">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtLookupName" runat="server" ValidationGroup="Add" onkeyup="maxlengthfortxt(50);" ToolTip="Lookup Description" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLookupName" SetFocusOnError="true" CssClass="validation_msg_box_sapn" runat="server" ValidationGroup="Add"
                                                ControlToValidate="txtLookupName" ErrorMessage="Enter Lookup Description" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>


                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Lookup Desc" CssClass="styleReqFieldLabel" ID="lblLookupName">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:ImageButton ID="imgbtnAdd" ImageUrl="~/Images/downarrow_03.png" runat="server" ValidationGroup="Add"
                                            Height="20px" OnClick="imgbtnAdd_Click" ToolTip="Add" />
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                </div>
                            </div>

                            <div class="row">
                                <asp:Panel GroupingText="Details" ID="pnlDetail" runat="server"
                                    CssClass="stylePanel" Width="80%">

                                    <div style="height: 235px; overflow-x: hidden; overflow-y: auto;">
                                        <asp:GridView ID="gvLookupMaster" runat="server" AutoGenerateColumns="false"
                                            OnRowDataBound="gvLookupMaster_RowDataBound" OnRowUpdating="gvLookupMaster_RowUpdating" class="gird_details">
                                            <%--OnRowCommand="gvLookupMaster_RowCommand"--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID" Visible="false">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHID" runat="server" Text="ID"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblID" runat="server" Text='<%#Bind("ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblFieldName" runat="server" Text="Field Name"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLookupCategory" ToolTip="Field Name" runat="server" Text='<%#Bind("Lookup_Type") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHLookupCode" runat="server" Text="Lookup Code"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLookupCode" ToolTip="Lookup Code" runat="server" Text='<%#Bind("Lookup_Code") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHLookupDesc" runat="server" Text="Lookup Desc"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtLookupDesc" ToolTip="Lookup Description" runat="server" Text='<%#Bind("Description") %>' CssClass="md-form-control form-control login_form_content_input" MaxLength="200" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Table Name" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTableName" runat="server" Text='<%#Bind("Table_Name") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHName" runat="server" Text="Name"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%#Bind("Name") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Update">
                                                    <ItemTemplate>
                                                        <div class="row">
                                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" OnClick="btnUpdate_Click"
                                                                ToolTip="Update, Alt+U" CssClass="grid_btn" AccessKey="U" CausesValidation="false" />
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </asp:Panel>
                            </div>

                        </asp:Panel>
                    </div>
                </div>

                <%-- <div class="row" align="right">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnSave" ValidationGroup="save" AccessKey="S" ToolTip="Save, Alt+S"
                            CssClass="cancel_btn fa fa-times" Text="Save" OnClientClick="return fnCheckPageValidators('save');" OnClick="btnSave_Click" Enabled="false" />

                        <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnClear" CssClass="save_btn fa fa-floppy-o" CausesValidation="false" ToolTip="Clear, Alt+L" AccessKey="L"
                            Text="Clear" OnClick="btnClear_Click" Enabled="false" OnClientClick="return fnConfirmClear();" />
                    </div>
                </div>--%>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <%--<div align="right">--%>
                    <button class="css_btn_disabled" id="btnSave" onclick="if(fnSaveValidation())" onserverclick="btnSave_Click" runat="server"
                        type="submit" accesskey="S"  causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>


                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                  

                </div>
                <div style="display: none">

                    <asp:ValidationSummary Style="display: none" CssClass="styleSummaryStyle" runat="server" ID="vsCurrency" ValidationGroup="Add"
                        HeaderText="Please correct the following validation(s):  " ShowSummary="true"
                        ShowMessageBox="false" />

                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>

                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
