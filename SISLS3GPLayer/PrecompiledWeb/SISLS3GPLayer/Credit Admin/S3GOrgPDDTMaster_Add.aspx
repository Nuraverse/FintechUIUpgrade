<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgPDDTMaster_Add, App_Web_perom1xt" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC3" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function uploadComplete(sender, args) {
            var objID = sender._inputFile.id.split("_");
            var obj = args._fileName.split("\\");
            objID = "<%= gvPRDDT.ClientID %>" + "_" + objID[5];
            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;
                //                document.getElementById(objID + "_hidThrobber").style.Visbility = 'hidden';
                //                document.getElementById(objID + "_hidThrobber").style.display = 'none';
                //document.getElementById(objID + "_myThrobber").visible = false;


                if (obj[obj.length - 1].length > 80) {
                    alert("File Name can't exceed more than 80 characters");
                    document.getElementById(objID + "_myThrobber").innerText = "";
                    document.getElementById(objID + "_hidThrobber").value = "";
                    return false;
                }


            }

        }

        function fnLoadPath(btnBrowse) {

            if (btnBrowse != null)

                document.getElementById('ctl00_ContentPlaceHolder1_tcPDDT_tpPDDT_btnBrowse').click();
        }
        function fnLoadPath(btnBrowseI) {

            if (btnBrowseI != null)

                document.getElementById(btnBrowseI).click();
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
                //document.getElementById('<%=gvPRDDT.ClientID %>').style.width = parseInt(screen.width) - 20;
                document.getElementById('<%=gvPRDDT.ClientID %>').style.overflow = "scroll";
            }
            else {
                //document.getElementById('<%=gvPRDDT.ClientID %>').style.width = parseInt(screen.width) - 260;
                document.getElementById('<%=gvPRDDT.ClientID %>').style.overflow = "scroll";
            }
        }
        //function pageLoad(s, a) {
        //alert('test');
        //PageLoadTabContSetFocus();
        //if (document.getElementById('<%=gvPRDDT.ClientID %>') != null) {
        // document.getElementById('<%=gvPRDDT.ClientID %>').style.width = parseInt(screen.width) - 260;
        //document.getElementById('<%=gvPRDDT.ClientID %>').style.overflow = "scroll";
        //}
        //}

        function showMenu(show) {
            if (show == 'T') {
                document.getElementById('divMenu').style.display = 'Block';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';
                document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';
                //(document.getElementById('<%=gvPRDDT.ClientID %>')).style.width = screen.width - 260;
            }
            if (show == 'F') {
                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';
                //(document.getElementById('<%=gvPRDDT.ClientID %>')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
        }
        // Resize  Grid End

        //Start SetFocus for TabContainer first Control 
        //Created By: Magesh.A
        //Created Date: 03/08/2018

        function PageLoadTabContSetFocus() {
            var TC = $find("<%=tcPDDT.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlRefPoint.ClientID %>").focus();
            }
        }

        //End SetFocus for TabContainer first Control 
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                            <asp:HiddenField ID="hdnrow" runat="server" />
                        </h6>
                    </div>
                    <%--             <div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>
                <div class="row">
                    <cc1:TabContainer ID="tcPDDT" runat="server" CssClass="styleTabPanel"
                        AutoPostBack="false" OnActiveTabChanged="tcPDDT_ActiveTabChanged" ActiveTabIndex="0">
                        <cc1:TabPanel runat="server" HeaderText="Customer" CssClass="tabpan" ID="tpcust"
                            BackColor="Red">
                            <HeaderTemplate>
                                Customer Details
                            </HeaderTemplate>
                            <ContentTemplate>
                                <%-- <asp:UpdatePanel ID="updPanelFirstTab" runat="server">
                                        <ContentTemplate>--%>
                                <asp:Panel GroupingText="Customer Information" ID="pnlCustomerInfo" runat="server"
                                    CssClass="stylePanel">
                                    <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row" style="padding: 5px !important;">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlRefPoint" runat="server" ToolTip="Ref. Point" AutoPostBack="True" CssClass="md-form-control form-control"
                                                            OnSelectedIndexChanged="ddlRefPoint_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvRefPoint" runat="server" Display="Dynamic" ErrorMessage="Select the Ref. Point" CssClass="validation_msg_box_sapn"
                                                                ControlToValidate="ddlRefPoint" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblRefPoint" runat="server" Text="Ref. Point" CssClass="styleReqFieldLabel"></asp:Label>
                                                            <asp:HiddenField ID="hdnofferdate" runat="server" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDate" runat="server" ToolTip="Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblDate" runat="server" Text="Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Select the Line of Business" ControlToValidate="ddlLOB" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblLob" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPRDDC" runat="server" ReadOnly="True" ToolTip="PRDDC No." class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblPRDDC" runat="server" Text="PRDDC No." CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                            CssClass="md-form-control form-control" DropDownStyle="DropDown"
                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                            AutoPostBack="True">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Select the Branch" CssClass="validation_msg_box_sapn"
                                                                SetFocusOnError="true" ControlToValidate="ddlBranch" InitialValue="0" ValidationGroup="Main Page"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <UC3:AutoSugg ID="ddlEnquiry" hovermenuextenderleft="true" runat="server" AutoPostBack="true" ToolTip="Ref. Code" dispalycontent="Both" class="md-form-control form-control" OnItem_Selected="ddlEnquiry_Item_Selected"
                                                            ServiceMethod="GetRefPoint" />
                                                        <%--<asp:DropDownList ID="ddlEnquiry" AutoPostBack="true" ToolTip="Ref. Code" CssClass="md-form-control form-control" OnSelectedIndexChanged="ddlEnquiry_SelectedIndexChanged" runat="server"></asp:DropDownList>--%>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblEnquiry" runat="server" Text="Ref. Code" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="True" Visible="False" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <cc1:ComboBox ID="ddlCustomerCode" AutoPostBack="True" runat="server" ToolTip="Customer Code" AutoCompleteMode="SuggestAppend"
                                                            DropDownStyle="DropDownList" Visible="False" MaxLength="0">
                                                        </cc1:ComboBox>
                                                        <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
                                                        <UC4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" ToolTip="Customer Code" Enabled="false" AutoPostBack="true" DispalyContent="Both"
                                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="btnLoadCustomer_OnClick" />
                                                        <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer"
                                                            OnClick="btnLoadCustomer_OnClick" CausesValidation="false" />
                                                        <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"
                                                            InitialValue="-- Select --" ErrorMessage="Select the Customer Code" ControlToValidate="ddlCustomerCode"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True" ToolTip="Status" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none;">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtCustomerName" runat="server" ToolTip="Customer Name" class="md-form-control form-control login_form_content_input requires_false" ReadOnly="True"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtProduct" runat="server" Visible="False" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <asp:TextBox ID="txtProductName" runat="server" ReadOnly="True" ToolTip="Scheme" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblProduct" runat="server" Text="Scheme" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlConstitition" runat="server" AutoPostBack="True" CssClass="md-form-control form-control"
                                                            OnSelectedIndexChanged="ddlConstitition_SelectedIndexChanged" ToolTip="Constitution">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvConstitition" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Select the Constitition" ControlToValidate="ddlConstitition" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <%-- <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator
                                                                ID="rfvConstitition1" runat="server" Display="Dynamic" ErrorMessage="Select the Constitition" CssClass="validation_msg_box_sapn"
                                                                ControlToValidate="ddlConstitition" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>--%>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblConsitition" runat="server" Text="Constitution" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                        <div>
                                                            <asp:Button ID="btnNextTab" Style="display: none" runat="server" AccessKey="N" ToolTip="Alt+N" Text="Next Tab" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div>
                                    <div class="col">
                                        <asp:Panel GroupingText="Communication Address" Style="display: none" ID="Panel1" runat="server" CssClass="stylePanel" ToolTip="Communication Address">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <uc1:S3GCustomerAddress ID="S3GCustomerCommAddress" runat="server" ShowCustomerCode="false" ToolTip="Communication Address"
                                                        ShowCustomerName="false" FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="col">
                                        <asp:Panel GroupingText="Permanent Address" Style="display: none" ID="Panel2" runat="server" CssClass="stylePanel" ToolTip="Permanent Address">
                                            <div>
                                                <div class="row">
                                                    <div class="col">
                                                        <uc1:S3GCustomerAddress ID="S3GCustomerPermAddress" runat="server" ShowCustomerCode="false"
                                                            ShowCustomerName="false" FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <%--/ContentTemplate>
                                    </asp:UpdatePanel>--%>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tpPDDT" runat="server" HeaderText="Pre Disbursement Document Transaction Details"
                            CssClass="tabpan" BackColor="Red" ToolTip="Pre Disbursement Document Transaction Details">
                            <HeaderTemplate>
                                Pre Disbursement Document Transaction Details
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upgrid" runat="server">
                                    <ContentTemplate>
                                        <div>
                                            <div class="row">
                                                <div class="col gird">
                                                    <%--<div class="container" id="gvGrigPDDT" runat="server" style="width: 100%">--%>
                                                    <div class="row" style="padding: 0px !important;">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                           <%-- <asp:UpdatePanel ID="updFile" runat="server">
                                                                <ContentTemplate>--%>
                                                                    <asp:GridView ID="gvPRDDT" runat="server" AutoGenerateColumns="False"
                                                                        ToolTip="Pre Disbursement Document Transaction Details" Width="100%"
                                                                        BorderColor="Gray" DataKeyNames="PRDDC_Doc_Cat_ID,Doc_CollectOrWaived,CollectedBy,ScandedBy"
                                                                        OnRowDataBound="gvPRDDT_RowDataBound" class="gird_details">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSno" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="PRDDC TypeId" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblPRTID" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                                    <asp:Label ID="lblReceivedStatus" runat="server" Text='<%# Bind("RECEIVED_STATUS") %>'></asp:Label>
                                                                                    <asp:Label ID="lblChecklistFlag" runat="server" Text='<%# Bind("CHECKLIST_FLAG") %>'></asp:Label>
                                                                                    <asp:Label ID="lblNeedScanCopy" runat="server" Text='<%# Bind("IS_NEEDSCANCOPY") %>'></asp:Label>
                                                                                    <asp:Label ID="lblPRDDTrans" runat="server" Text='<%# Bind("PRDDTrans") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="PRDDC Type" ItemStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("PRDDC_Doc_Type") %>' ToolTip="PRDDC Type"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <%-- <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />--%>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="PRDDC Description" ItemStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("PRDDC_Doc_Description") %>' ToolTip="PRDDC Description"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Left" Width="20%" />--%>
                                                                            </asp:TemplateField>
                                                                            <%--Added by Shibu 6-Jun-2013 --%>
                                                                            <asp:TemplateField HeaderStyle-Wrap="true" ItemStyle-HorizontalAlign="Center" HeaderText="Mandatory">
                                                                                <ItemTemplate>
                                                                                    <asp:Label Visible="false" ID="lblOptMan" runat="server" Text='<%#Eval("Is_Mandatory")%>' ToolTip="Mandatory"></asp:Label>
                                                                                    <asp:CheckBox ID="chkOptMan" runat="server" Enabled="false"></asp:CheckBox>
                                                                                </ItemTemplate>
                                                                                <%-- <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                            <HeaderStyle Width="10%" />--%>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Doc. Position" ItemStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <asp:DropDownList ID="ddlCollAndWaiver" runat="server" Width="100px" CssClass="md-form-control form-control" AutoPostBack="true" ToolTip="Doc. Position" OnSelectedIndexChanged="ddlCollAndWaiver_SelectedIndexChanged">
                                                                                        <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                                                                        <asp:ListItem Text="Collected" Value="C"></asp:ListItem>
                                                                                        <asp:ListItem Text="Waived" Value="W"></asp:ListItem>
                                                                                        <asp:ListItem Text="Not Received" Value="NC"></asp:ListItem>
                                                                                        <asp:ListItem Text="Not Applicable" Value="NA"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle HorizontalAlign="Center" Width="20%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="20%" />--%>
                                                                            </asp:TemplateField>
                                                                            <%--End--%>
                                                                            <%--Newly added by saranya--%>
                                                                            <asp:TemplateField HeaderText="CollectedById" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCollectedBy" runat="server" Text='<%# Bind("Collected_By_Id") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <%--End--%>
                                                                            <asp:TemplateField HeaderText="Collected / Waived By" ItemStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <%--<asp:Label ID="txtColletedBy" runat="server" Text='<%# Bind("CollectedBy") %>'></asp:Label>
                                                        <asp:Label ID="lblColUser" Visible="false" runat="server" Text='<%# Bind("Collected_By") %>'></asp:Label>--%>
                                                                                    <%-- <asp:DropDownList ID="ddlCollectedBy" runat="server" OnSelectedIndexChanged="ddlCollectedBy_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>--%>
                                                                                    <UC3:AutoSugg ID="ddlCollectedBy" runat="server" ToolTip='<%# Bind("CollectedBy") %>' ServiceMethod="GetUserList"
                                                                                        IsMandatory="false" />
                                                                                    <%--OnItem_Selected="ddlCollectedBy_SelectedIndexChanged"--%>
                                                                                </ItemTemplate>
                                                                                <%--    <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />--%>
                                                                                <ItemStyle HorizontalAlign="Center" Width="25%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Collected / Waived Date" ItemStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <%--Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Getdates")).ToString(strDateFormat) %>'--%>
                                                                                    <asp:TextBox ID="txtCollectedDate" runat="server" Text='<%#Bind("GetDates") %>' ToolTip="Collected / Waived Date" class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>
                                                                                    <cc1:CalendarExtender ID="calCollectedDate" runat="server" Enabled="True" TargetControlID="txtCollectedDate"
                                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                </ItemTemplate>
                                                                                <%--       <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />--%>
                                                                                <ItemStyle />
                                                                                <ItemStyle HorizontalAlign="Center" Width="25%" />
                                                                            </asp:TemplateField>
                                                                            <%--Newly added by saranya--%>
                                                                            <asp:TemplateField HeaderText="ScannedById" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblScannedBy" runat="server" Text='<%# Bind("Scanned_By_Id") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <%--End--%>
                                                                            <asp:TemplateField HeaderText="Scanned By" ItemStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <%--<asp:Label ID="txtScannedBy" runat="server" Text='<%# Bind("Scandedby") %>'></asp:Label>
                                                        <asp:Label ID="lblScanUser" runat="server" Visible="false" Text='<%# Bind("Scanned_By") %>'></asp:Label>--%>
                                                                                    <%-- <asp:DropDownList ID="ddlScannedBy"   runat="server" OnSelectedIndexChanged="ddlScannedBy_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>--%>
                                                                                    <UC3:AutoSugg ID="ddlScannedBy" runat="server" ToolTip='<%# Bind("ScandedBy") %>' ServiceMethod="GetUserList" AutoPostBack="false"
                                                                                        IsMandatory="false" />
                                                                                    <%-- OnItem_Selected="ddlScannedBy_SelectedIndexChanged" --%>
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />--%>
                                                                                <ItemStyle HorizontalAlign="Center" Width="25%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <%--<asp:Label ID="txtScannedDate" runat="server" Width="70px" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Getdates")).ToString(strDateFormat) %>'></asp:Label>--%>
                                                                                    <asp:TextBox ID="txtScannedDate" runat="server" Text='<%# Bind("Scanned_Date") %>' class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>
                                                                                    <cc1:CalendarExtender ID="calScannedDate" runat="server" Enabled="True" TargetControlID="txtScannedDate"
                                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="25%" />
                                                                                <%-- <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />--%>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="File Upload">
                                                                                <ItemTemplate>
                                                                                    <div class="md-input">
                                                                                        <asp:UpdatePanel ID="updFileI" runat="server" UpdateMode="Conditional">
                                                                                            <ContentTemplate>
                                                                                                <asp:TextBox ID="txOD" runat="server" Width="100px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                                                                    Visible="false" BorderColor="Green"></asp:TextBox>
                                                                                                <asp:FileUpload runat="server" ID="asyFileUpload" ToolTip="Upload File" />
                                                                                                <asp:Button ID="btnBrowseI" CausesValidation="false" runat="server" OnClick="btnBrowseI_Click" Style="display: none"></asp:Button>
                                                                                                <asp:Label ID="lblActualPathI" CausesValidation="false" Visible="true" BorderColor="Green" runat="server" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                                <asp:HiddenField ID="hdnFilePath" runat="server" Value='<%# Eval("Scanned_Ref_No") %>' />
                                                                                                <asp:Label runat="server" ID="myThrobber" Style="display: none;"></asp:Label>
                                                                                                <asp:HiddenField runat="server" ID="hidThrobber" />
                                                                                                <asp:Label runat="server" ID="lblPathUploadlabel" BorderColor="Green"></asp:Label>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                               <%-- <br />
                                                                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server"
                                                                                                    AssociatedUpdatePanelID="updFileI">
                                                                                                    <ProgressTemplate>
                                                                                                        Please wait image is getting uploaded....
                                                                                                    </ProgressTemplate>
                                                                                                </asp:UpdateProgress>
                                                                                                <br />--%>
                                                                                            </ContentTemplate>
                                                                                            <Triggers>
                                                                                                <asp:PostBackTrigger ControlID="btnBrowseI" />
                                                                                            </Triggers>
                                                                                        </asp:UpdatePanel>

                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Scan Ref. No." Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtScan" runat="server" Width="95%" MaxLength="12" Enabled="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtScan"
                                                                                        FilterType="Numbers, Custom , UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="View Document">
                                                                                <ItemTemplate>
                                                                                    <%--<asp:LinkButton runat="server" ID="hyplnkView" OnClick="hyplnkView_Click" Text="View Document"></asp:LinkButton>--%>
                                                                                    <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Scanned_Ref_No") %>'
                                                                                        OnClick="hyplnkView_Click" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEditDisabled"
                                                                                        runat="server" />
                                                                                    <asp:Label runat="server" ID="lblPath" Visible="false" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <%--             <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />--%>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Remarks">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Eval("Remarks")%>' Width="200px" TextMode="MultiLine" ToolTip="Remarks" onkeyup="maxlengthfortxt(100)"
                                                                                        MaxLength="100" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <%-- <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtRemarks"
                                                            FilterType="Numbers, Custom , UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                            Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>--%>
                                                                                    <asp:Label ID="lblProgramName" runat="server" Visible="false" Text='<%# Eval("ProgramName")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Select">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="CbxCheck" runat="server" />
                                                                                </ItemTemplate>
                                                                                <%--         <HeaderStyle CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="5%" />--%>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                               <%-- </ContentTemplate>
                                                            </asp:UpdatePanel>--%>

                                                        </div>
                                                    </div>
                                                    <%--</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
                <div class="row" style="float: right; margin-top: 5px;" id="Td" runat="server">
                    <%--<button runat="server" id="btnSave" accesskey="S" title="Save[Alt+S]" onclick="if(fnCheckPageValidation())"
                        class="css_btn_enabled" ValidationGroup="Main Page" onserverclick="btnSave_Click" type="submit">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button runat="server" id="btnClear" accesskey="L" title="Clear[Alt+L]" causesvalidation="false" class="css_btn_enabled"
                        ValidationGroup="Main Page" onclick="if(fnConfirmClear())" type="submit"
                        onserverclick="btnClear_Click">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>  --%>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnSave" CssClass="save_btn fa fa-floppy-o" Text="Save" AccessKey="S" ToolTip="Save,Alt+S"
                            OnClientClick="return fnCheckPageValidators();" OnClick="btnSave_Click" ValidationGroup="Main Page" />
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="l">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                    </div>
                    <%--<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnClear" CssClass="save_btn fa fa-floppy-o" Text="Clear" AccessKey="L" ToolTip="Clear,Alt+L"
                            CausesValidation="False" OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();" />
                    </div>--%>
                    <%--<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">--%>
                    <div></div>
                    <div></div>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onclick="if(fnConfirmExit())" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <%--</div>--%>
                    <%--<cc1:ConfirmButtonExtender ID="btnClear_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure you want to Clear?"
                            Enabled="True" TargetControlID="btnClear">
                        </cc1:ConfirmButtonExtender>--%>
                    <%--<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <i class="fa fa-share btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnCancel" CssClass="save_btn fa fa-floppy-o" CausesValidation="False" AccessKey="X" ToolTip="Exit,Alt+X"
                            Text="Exit" OnClick="btnCancel_Click" OnClientClick="return fnConfirmExit();" />
                    </div>--%>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsPRDDC" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):  " Enabled="false" Visible="false" />
                        <asp:CustomValidator ID="cvPRDTT" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: medium"></asp:Label>
                        <asp:HiddenField ID="hidPRTID" runat="server"></asp:HiddenField>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="MaxVerChk" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
