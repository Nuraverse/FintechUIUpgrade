<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Budget_BUD_FormulaMaster_Add, App_Web_rj0nx3uf" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function GetOnlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function FocusComp() {
            document.getElementById("<%= lbxOperator.ClientID %>").selectedIndex = -1;
            document.getElementById("<%= lbxFormula.ClientID %>").selectedIndex = -1;
        }

        function FocusOP() {
            document.getElementById("<%= lbxComponents.ClientID %>").selectedIndex = -1;
            document.getElementById("<%= lbxFormula.ClientID %>").selectedIndex = -1;
        }

        function FocusFormula() {
            document.getElementById("<%= lbxComponents.ClientID %>").selectedIndex = -1;
            document.getElementById("<%= lbxOperator.ClientID %>").selectedIndex = -1;
        }


        function fnConfirmExit() {
            if (confirm('Do you want to Exit?'))
                return true;
            else
                return false;
        }
        function fnConfirmClear() {
            if (confirm('Do you want to Clear?'))
                return true;
            else
                return false;
        }
        function fnConfirmSave() {
            if (confirm('Do you want to Save?'))
                return true;
            else
                return false;
        }
    </script>
    <style type="text/css" media="screen">
        .ListBox {
            font-family: Calibri;
            font-size: small;
            border-style: solid;
            color: #000000;
        }

            .ListBox :hover {
                font-family: Calibri;
                font-size: small;
                border-style: solid;
                background-color: #009956;
                color: #ffffff;
            }

        .ListBox {
            cursor: pointer;
        }
    </style>
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <div style="margin-bottom: 50px;">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel" ForeColor="Black">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Panel ID="pnlFormula" runat="server" CssClass="stylePanel" GroupingText="Formula Details">
                            <table id="tblFormula" runat="server" width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlItemHeader" runat="server" ToolTip="Item Header" ValidationGroup="Save"
                                                class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlItemHeader_SelectedIndexChanged" >
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVItemHeader" ValidationGroup="Save" ErrorMessage="Select Item Header"
                                                    InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlItemHeader"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Item Header" ID="lblItemHeader" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </td>
                                    <td colspan="2" style="width: 30%">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlAccNature" runat="server" ToolTip="Account Nature" ValidationGroup="Save"
                                                class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAccNature_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVAccNature" ValidationGroup="Save" ErrorMessage="Select Account Nature"
                                                    InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlAccNature"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Account Nature" ID="lblAccNature" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>

                                    </td>
                                </tr>
                                <tr>

                                    <td colspan="2" style="width: 30%">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlSublineItem" runat="server" ToolTip="Subline Item" ValidationGroup="Save"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVSublineItem" ValidationGroup="Save" ErrorMessage="Select Subline Item"
                                                    InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlSublineItem"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Subline Item" ID="lblSublineItem" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>

                                    </td>
                                    <td style="width: 20%">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFormulaType" runat="server" ToolTip="Formula type" ValidationGroup="Save"
                                                class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFormulaType_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVFormulaType" ValidationGroup="Save" ErrorMessage="Select Formula Type"
                                                    InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlFormulaType"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Formula Type" ID="lblFormulaType" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="col-md-4 mt-2 styleFieldLabel">
                                            <div class="md-value">
                                                <label>
                                                    <asp:Label runat="server" Text="Active" ID="Label4"></asp:Label>
                                                </label>
                                            </div>

                                            <label class="switch ">
                                                <input type="checkbox" disabled="disabled" class="md-form-control form-control" runat="server" id="ChkbxStatus" checked="checked" />
                                                <span class="slider round"></span>
                                            </label>
                                            <span class="highlight"></span>

                                        </div>

                                    </td>
                                </tr>
                                <tr>
                            <td colspan="4">
                                            <%-- Activity Add by : Boobalan M - 12-12-2019--%>
                                                        <div class="row">

                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">

                                                                <asp:Panel ID="pnlActivity" Visible="false" Width="98%" runat="server" CssClass="stylePanel" GroupingText="Activity">
                                                                    <div style="overflow-x: hidden; overflow-y: auto; max-height: 120px; text-align: center" class="grid">
                                                                        <asp:GridView runat="server" ID="grvActivityList" HeaderStyle-CssClass="styleGridHeader" Width="100%"
                                                                            OnRowDataBound="grvActivity_RowDataBound" AutoGenerateColumns="False" class="grid_details">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Activity"
                                                                                    HeaderStyle-Width="70%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblActivity" runat="server" ToolTip='<%#Eval("DESCRIPTION")%>' Text='<%#Eval("DESCRIPTION")%>'></asp:Label>
                                                                                        <asp:Label ID="lblActivityID" runat="server" Visible="false" Text='<%#Eval("DESCRIPTION")%>'></asp:Label>
                                                                                        <asp:TextBox ID="txtActivityId" Visible="false" AutoPostBack="true" Text='<%#Eval("ID")%>' runat="server"></asp:TextBox>

                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderStyle-Width="30%">

                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkSelectLI" runat="server"></asp:CheckBox>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </asp:Panel>

                                                            </div>

                                                        </div>
                                </td>
                               
                                </tr>

                                <tr>
                                    <td style="width: 35%">
                                        <asp:Label runat="server" ID="lblHdr" Visible="false"></asp:Label>
                                        <asp:ListBox ID="lbxComponents" runat="server" Width="100%" Height="150px" SelectionMode="Single"
                                            AutoPostBack="true" OnSelectedIndexChanged="lbxComponents_SelectedIndexChanged" CssClass="ListBox" onfocus="FocusComp();"></asp:ListBox></td>
                                    <td style="width: 10%">
                                        <asp:ListBox ID="lbxOperator" runat="server" Width="60%" Height="150px" SelectionMode="Single"
                                            AutoPostBack="true" OnSelectedIndexChanged="lbxOperator_SelectedIndexChanged"
                                            CssClass="ListBox" onfocus="FocusOP();"></asp:ListBox>
                                        <asp:TextBox ID="tbxValue" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                    <%-- <td style="width: 10%">
                                        
                                       &nbsp;&nbsp;
                                        <asp:ImageButton ID="btnAddComponent" ImageUrl="~/Images/arrow-add.png" runat="server" Width="30px" ToolTip="Add" CausesValidation="false" AlternateText="" />
                                    </td>--%>
                                    <td style="width: 35%">
                                        <asp:ListBox ID="lbxFormula" runat="server" Width="100%" Height="150px" SelectionMode="Single" CssClass="ListBox" onfocus="FocusFormula();"></asp:ListBox></td>
                                    <td style="width: 10%; text-align: left; padding-left: 10px;">
                                        <asp:ImageButton ID="btnUp" ImageUrl="~/FA Images/Arrow-up.png" runat="server" ToolTip="Move Up" CausesValidation="false" OnClick="btnUp_Click" AlternateText="Move Up" />
                                        <br />
                                        <br />
                                        <asp:ImageButton ID="btnDelete" ImageUrl="~/FA Images/Arrow-delete.png" runat="server" ToolTip="Remove" CausesValidation="false" OnClick="btnDelete_Click" AlternateText="Remove" />
                                        <br />
                                        <br />
                                        <asp:ImageButton ID="btnDown" ImageUrl="~/FA Images/Arrow-down.png" runat="server" ToolTip="Move Down" CausesValidation="false" OnClick="btnDown_Click" AlternateText="Move Down" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="height: 10px;" id="tdGrid" runat="server" visible="false">
                                        <div class="grid">
                                            <asp:GridView runat="server" ID="grvGLCode" AutoGenerateColumns="false" ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="GL Code">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblGLCodeDesc" Text='<%#Eval("GLCodeDesc") %>'></asp:Label>
                                                            <asp:Label runat="server" ID="lblGLCodeID" Text='<%#Eval("GLCodeID") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFGLCode" runat="server" ToolTip="GL Code" ValidationGroup="Add"
                                                                    class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFGLCode_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVFGLCode" ValidationGroup="Add" ErrorMessage="Select GL Code"
                                                                        InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlFGLCode"
                                                                        SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SL Code">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblSLCodeDesc" Text='<%#Eval("SLCodeDesc") %>'></asp:Label>
                                                            <asp:Label runat="server" ID="lblSLCodeID" Text='<%#Eval("SLCodeID") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFSLCode" runat="server" ToolTip="SL Code" ValidationGroup="Add"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVSLCode" ValidationGroup="Add" ErrorMessage="Select SL Code"
                                                                        InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlFSLCode"
                                                                        SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <button class="css_btn_enabled" id="btnDelete" title="Delete,Alt+D" onserverclick="btnDelete_ServerClick" runat="server"
                                                                type="button" accesskey="D">
                                                                <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>D</u>elete</button>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onserverclick="btnAdd_ServerClick" runat="server"
                                                                type="button" accesskey="A" validationgroup="Add">
                                                                <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd</button>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                    </td>
                                </tr>
                                <tr style="padding-top: 8px;">
                                    <td colspan="4">
                                        <asp:TextBox ID="tbxFormulaView" runat="server" TextMode="MultiLine" Rows="5" Width="100%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnValidateFormula" Text="Validate Formula" runat="server" CssClass="styleSubmitLongButton" CausesValidation="false" Visible="false" />
                                        <asp:CustomValidator ID="cvFormula" runat="server">&nbsp;</asp:CustomValidator>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                    </div>
                </div>

                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onserverclick="btnSave_ServerClick"
                        runat="server" validationgroup="Save"  onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_ServerClick" causesvalidation="false" runat="server"
                        type="button" accesskey="L" title="Clear, Alt+L" onclick="if(fnConfirmClear())">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExit" onserverclick="btnExit_ServerClick" causesvalidation="false" runat="server"
                        type="button" accesskey="X" title="Exit, Alt+X" onclick="if(fnConfirmExit())">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
            </div>
            <%--    onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false"--%>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

