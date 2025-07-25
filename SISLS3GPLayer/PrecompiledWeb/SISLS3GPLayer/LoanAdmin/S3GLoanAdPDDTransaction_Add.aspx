<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdPDDTransaction_Add, App_Web_yy0xp33b" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC3" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function fnConfirmExit() {

            if (confirm('Are you sure want to Exit?')) {
                return true;
            }
            else
                return false;

        }

        function uploadComplete(sender, args) {
            var objID = sender._inputFile.id.split("_");
            var obj = args._fileName.split("\\");
            objID = "<%= gvPDDT.ClientID %>" + "_" + objID[5];
            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;
                if (obj[obj.length - 1].length > 80) {
                    alert("File Name can't exceed more than 80 characters");
                    document.getElementById(objID + "_myThrobber").innerText = "";
                    document.getElementById(objID + "_hidThrobber").value = "";
                    return false;
                }
            }

            fnSetFormTarget();
        }


        function showHand(textBoxId) {
            document.getElementById(textBoxId).style.cursor = 'hand';
            document.getElementById(textBoxId).style.cursor = 'hand';
            document.getElementById(textBoxId).style.cursor = 'hand';
        }

        function FunShowPath(input) {
            if (input != null) {
                var objID = input.id;
                var myThrobber = document.getElementById((input.id).replace('asyFileUpload', 'myThrobber'));
                if (myThrobber != null) {
                    if (myThrobber.innerText != "")
                        input.setAttribute('title', myThrobber.innerText);
                }
            }
        }
        function fnLoadCustomer() {
            document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
        }

        //Added By Shibu Resize Grid
        function GetChildGridResize(ImageType) {
            if (ImageType == "Hide Menu") {
                document.getElementById('<%=gvGrigPDDT.ClientID %>').style.width = parseInt(screen.width) - 20;
                document.getElementById('<%=gvGrigPDDT.ClientID %>').style.overflow = "scroll";
            }
            else {
                document.getElementById('<%=gvGrigPDDT.ClientID %>').style.width = parseInt(screen.width) - 260;
                document.getElementById('<%=gvGrigPDDT.ClientID %>').style.overflow = "scroll";
            }
        }
        function pageLoad(s, a) {
            document.getElementById('<%=gvGrigPDDT.ClientID %>').style.width = parseInt(screen.width) - 260;
            document.getElementById('<%=gvGrigPDDT.ClientID %>').style.overflow = "scroll";
        }
        function showMenu(show) {
            if (show == 'T') {
                document.getElementById('divMenu').style.display = 'Block';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';
                document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';
                (document.getElementById('<%=gvGrigPDDT.ClientID %>')).style.width = screen.width - 260;
            }
            if (show == 'F') {
                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';
                (document.getElementById('<%=gvGrigPDDT.ClientID %>')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
        }
        // Resize  Grid End

        function Funcheckvaliddecimal(input) {

            var Amountvalue = input.value;
            var count = 0;
            if (Amountvalue != '') {
                for (var i = 0; i < Amountvalue.length; i++) {
                    var c = Amountvalue.charAt(i);
                    if (c == '.') {
                        count++;
                    }
                }
                if (count > 1) {
                    alert('Enter a valid Decimal');
                    input.value = '';
                    input.focus();
                    return;
                }

            }
        }
    </script>

    <%--<script type="text/javascript">

        function uploadComplete(sender, args) {
            var objID = sender._inputFile.id.split("_");
            objID = "<%= gvPDDT.ClientID %>" + "_" + objID[5];
            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;
            }
        }


        function fnLoadCustomer() {
            document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
        }

        function showHand(textBoxId) {
            document.getElementById(textBoxId).style.cursor = 'hand';
            document.getElementById(textBoxId).style.cursor = 'hand';
            document.getElementById(textBoxId).style.cursor = 'hand';
        }


    </script>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcPDDT" runat="server" CssClass="styleTabPanel" Width="100%"
                                AutoPostBack="false" ActiveTabIndex="0">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" HeaderText="Customer" CssClass="tabpan" ID="tpcust"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Customer Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Customer Information" ID="pnlCustomerInfo" runat="server"
                                                            CssClass="stylePanel">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                            ToolTip="Line of Business" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                Display="Dynamic" ErrorMessage="Select the Line of Business" InitialValue="0" SetFocusOnError="True"
                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLob" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDate" runat="server" ToolTip="Date"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDate" runat="server" CssClass="styleReqFieldLabel" Text="Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Location" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                                            class="md-form-control form-control" DropDownStyle="DropDown"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                            AutoPostBack="True">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Select the Branch"
                                                                                SetFocusOnError="true" ControlToValidate="ddlBranch" InitialValue="0" ValidationGroup="Main Page"
                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPDDC" runat="server" ValidationGroup="Main Page"
                                                                            ReadOnly="True" ToolTip="PDDC Number"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblPDDC" runat="server" Text="PDDC Number" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="True" Visible="False"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:ComboBox ID="ddlCustomerCode" AutoPostBack="True" runat="server" AutoCompleteMode="SuggestAppend"
                                                                            DropDownStyle="DropDownList" Visible="False" MaxLength="0">
                                                                        </cc1:ComboBox>
                                                                        <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" Visible="False"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <UC4:ICM ID="ucCustomerCodeLov" TextWidth="120px" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="btnLoadCustomer_OnClick" />
                                                                        <asp:Button ID="Button1" runat="server" Style="display: none" Text="Load Customer"
                                                                            OnClick="btnLoadCustomer_OnClick" CausesValidation="false" />
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                                                                InitialValue="-- Select --" ErrorMessage="Select the Customer Code" ControlToValidate="ddlCustomerCode"
                                                                                SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPANum" ToolTip="Prime Account Number" runat="server" AutoPostBack="True"
                                                                            OnSelectedIndexChanged="ddlPANum_SelectedIndexChanged" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvPANum" runat="server" Display="Dynamic" ErrorMessage="Select the Prime Account Number"
                                                                                ControlToValidate="ddlPANum" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblPANum" runat="server" Text="Prime Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCustomerName" Style="display: none" ToolTip="Customer Name" runat="server" Width="86%"
                                                                            ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCustomerName" Style="display: none" runat="server" Text="Customer Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlSANum" runat="server" ToolTip="Sub Account Number"
                                                                            Visible="false" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvSANum" runat="server" Display="Dynamic" ErrorMessage="Select the Sub Account Number"
                                                                                ControlToValidate="ddlSANum" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblSANum" runat="server" Text="Sub Account Number" CssClass="styleReqFieldLabel" Visible="false"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlConstitition" ToolTip="Constitution" runat="server"
                                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlConstitition_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvConstitition" runat="server" Display="Dynamic" InitialValue="0"
                                                                                ErrorMessage="Select the Constitition" ControlToValidate="ddlConstitition" SetFocusOnError="True"
                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblConsitition" runat="server" Text="Constitution" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True" ToolTip="Status"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtProduct" runat="server" Visible="False"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:TextBox ID="txtProductName" runat="server" ReadOnly="True" ToolTip="Scheme"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label5" runat="server" CssClass="styleDisplayLabel" Text="Scheme"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Communication Address" Style="display: none" ID="Panel1" runat="server" CssClass="stylePanel">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="100%">
                                                                        <uc1:S3GCustomerAddress ID="S3GCustomerCommAddress" runat="server" ShowCustomerCode="false"
                                                                            ShowCustomerName="false" FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Permanent Address" ID="Panel2" Style="display: none" runat="server" CssClass="stylePanel">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="100%" valign="top">
                                                                        <uc1:S3GCustomerAddress ID="S3GCustomerPermAddress" runat="server" ShowCustomerCode="false"
                                                                            ShowCustomerName="false" FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel ID="tpPDDT" runat="server" HeaderText="Pre Disbursement Document Transaction Details"
                                            CssClass="tabpan" BackColor="Red" Width="99%">
                                            <HeaderTemplate>
                                                Post Disbursement Document Transaction Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <div id="gvGrigPDDT" runat="server">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvPDDT" runat="server" AutoGenerateColumns="False"
                                                                    DataKeyNames="PDDC_Doc_Cat_ID,Doc_CollectOrWaived,CollectedBy,ScannedBy" CssClass="gird_details"
                                                                    OnRowDataBound="gvPDDT_RowDataBound" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="PDDC TypeId" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPDTID" runat="server" Text='<%# Bind("PDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PDDC Type" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("PDDC_Doc_Type") %>' ToolTip="PDDC Type"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="left" Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PDDC Description" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("PDDC_Doc_Description") %>'
                                                                                    ToolTip="PDDC Description"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="60%" />
                                                                        </asp:TemplateField>
                                                                        <%--Added by Shibu 6-Jun-2013 --%>
                                                                        <asp:TemplateField HeaderStyle-Wrap="true" ItemStyle-HorizontalAlign="Center" HeaderText="Mandatory">
                                                                            <ItemTemplate>
                                                                                <asp:Label Visible="false" ID="lblOptMan" runat="server" Text='<%#Eval("Is_Mandatory")%>'></asp:Label>
                                                                                <asp:CheckBox ID="chkOptMan" runat="server" Enabled="false"></asp:CheckBox>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                            <HeaderStyle Width="5%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Doc. Position" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:DropDownList ID="ddlCollAndWaiver" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCollAndWaiver_SelectedIndexChanged">
                                                                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                                                                    <asp:ListItem Text="Collected" Value="C"></asp:ListItem>
                                                                                    <asp:ListItem Text="Waived" Value="W"></asp:ListItem>
                                                                                    <asp:ListItem Text="Not Collected" Value="NC"></asp:ListItem>
                                                                                    <asp:ListItem Text="Not Applicable" Value="NA"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collected / Waived By" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollectedBy" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblColUser" Visible="false" runat="server" Text='<%# Bind("Collected_By") %>'></asp:Label>
                                                                                <%-- <asp:DropDownList ID="ddlCollectedBy" runat="server" OnSelectedIndexChanged="ddlCollectedBy_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>--%>
                                                                                <UC3:AutoSugg ID="ddlCollectedBy" runat="server" ToolTip='<%# Bind("CollectedBy") %>' ServiceMethod="GetUserList" AutoPostBack="true"
                                                                                    IsMandatory="false" OnItem_Selected="ddlCollectedBy_SelectedIndexChanged" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" Width="18%" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="18%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collected / Waived Date" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtCollectedDate" runat="server" Width="80px" Text='<%#Bind("GetDates") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calCollectedDate" runat="server" Enabled="True" TargetControlID="txtCollectedDate"
                                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                </cc1:CalendarExtender>
                                                                                <asp:Label ID="lblCollectedDate" Visible="false" runat="server" Text='<%#Bind("Collected_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scanned By" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblScannedBy" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblScanUser" runat="server" Visible="false" Text='<%# Bind("Scanned_By") %>'></asp:Label>
                                                                                <%--<asp:DropDownList ID="ddlScannedBy" runat="server" OnSelectedIndexChanged="ddlScannedBy_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>--%>
                                                                                <UC3:AutoSugg ID="ddlScannedBy" runat="server" ToolTip='<%# Bind("ScannedBy") %>' ServiceMethod="GetUserList" AutoPostBack="true"
                                                                                    IsMandatory="false" OnItem_Selected="ddlScannedBy_SelectedIndexChanged" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" Width="18%" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="18%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtScannedDate" runat="server" Width="80px" Text='<%# Bind("Scanned_Date") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calScannedDate" runat="server" Enabled="True" TargetControlID="txtScannedDate"
                                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                </cc1:CalendarExtender>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="File Upload">
                                                                            <ItemTemplate>
                                                                                <asp:UpdatePanel ID="updFile" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <asp:TextBox ID="txOD" runat="server" Width="150px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                                                            Visible="false"></asp:TextBox>
                                                                                        <cc1:AsyncFileUpload ID="asyFileUpload" OnClientUploadComplete="uploadComplete" runat="server"
                                                                                            Width="175px" OnUploadedComplete="asyncFileUpload_UploadedComplete" onmouseover="FunShowPath(this);" />
                                                                                        <asp:Label runat="server" ID="myThrobber" Style="display: none;"></asp:Label>
                                                                                        <asp:HiddenField runat="server" ID="hidThrobber" />
                                                                                    </ContentTemplate>
                                                                                    <Triggers>
                                                                                        <asp:PostBackTrigger ControlID="asyFileUpload" />
                                                                                    </Triggers>
                                                                                </asp:UpdatePanel>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <%--End--%>
                                                                        <%-- <asp:TemplateField HeaderText="File Upload">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txOD" runat="server" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                            Visible="false"></asp:TextBox>
                                                        <cc1:AsyncFileUpload ID="asyFileUpload" OnClientUploadComplete="uploadComplete" runat="server"
                                                            OnUploadedComplete="asyncFileUpload_UploadedComplete" Width="150px" ToolTip="File Upload" />
                                                        <asp:Label runat="server" ID="myThrobber" Visible="false"></asp:Label>
                                                        <asp:HiddenField runat="server" ID="hidThrobber" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center"  Width="15%" CssClass="styleGridHeader" />
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>--%>
                                                                        <asp:TemplateField HeaderText="View Document">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Scanned_Ref_No") %>'
                                                                                    OnClick="hyplnkView_Click" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                                    runat="server" ToolTip="View Documen" />
                                                                                <asp:Label runat="server" ID="lblPath" Visible="false" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                <asp:Label runat="server" ID="lblIs_Mandatory" Text='<%# Eval("Is_Mandatory")%>'
                                                                                    Visible="false"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(100)"
                                                                                    MaxLength="100" Width="150px" Text='<%# Eval("Remarks")%>' ToolTip="Remarks"></asp:TextBox>
                                                                                <asp:Label ID="lblProgramName" runat="server" Visible="false" Text='<%# Eval("ProgramName")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Stock Date" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtStockDate" runat="server" Width="80px" Text='<%# Eval("Stock_Date")%>'
                                                                                    ToolTip="Stock Date"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calStockDate" runat="server" Enabled="False" TargetControlID="txtStockDate"
                                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                </cc1:CalendarExtender>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Total Stock Amount" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtTotalStockAmount" runat="server" Width="100px" Text='<%# Eval("Total_StockAmount")%>'
                                                                                    ToolTip="Total Stock Amount" onfocusOut="Funcheckvaliddecimal(this);"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNeedScan" runat="server" Visible="false" Text='<%# Eval("Is_NeedScanCopy")%>'></asp:Label>
                                                                                <asp:CheckBox ID="CbxCheck" runat="server" ToolTip="Select" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" Width="5%" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scan Ref. No." Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtScan" runat="server" MaxLength="12" Enabled="false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtScan"
                                                                                    FilterType="Numbers, Custom , UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <%--    <asp:TemplateField HeaderText="Collected / Waived Date" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtColletedDate" ToolTip="Collected Date" runat="server" Width="70px"
                                                            Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Getdates")).ToString(strDateFormat) %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                    <ItemStyle />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Scanned By" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtScannedBy" ToolTip="Scanned By" runat="server" Text='<%# Bind("Scandedby") %>'></asp:Label>
                                                        <asp:Label ID="lblScanUser" runat="server" Visible="false" Text='<%# Bind("Scanned_By") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtScannedDate" ToolTip="Scanned Date" runat="server" Width="70px"
                                                            Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Getdates")).ToString(strDateFormat) %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>--%>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                            </cc1:TabContainer>
                        </div>
                    </div>

                    <div id="td1" valign="top"></div>

                    <div id="Td" runat="server"></div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click"
                            runat="server" type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                            runat="server" type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click"
                            runat="server" type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer"
                            OnClick="btnLoadCustomer_OnClick" CausesValidation="false" />
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="cvPDTT" runat="server" CssClass="styleMandatoryLabel" Enabled="true"
                                Width="98%" Display="None" />
                            <asp:ValidationSummary ID="vsPDDC" runat="server" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):  " />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: medium"></asp:Label>
                            <asp:HiddenField ID="hidPRTID" runat="server"></asp:HiddenField>
                        </div>
                    </div>
                    <asp:HiddenField ID="MaxVerChk" runat="server" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
