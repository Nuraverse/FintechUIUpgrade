<%--<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    CodeFile="S3G_Management_Accounts.aspx.cs" Inherits="S3G_Management_Accounts" %>--%>

<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3G_Monthly_MIS, App_Web_nmps0mjf" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<%--<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>--%>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>

        <style type="text/css">
            .switch {
                position: relative;
                display: inline-block;
                width: 40px;
                height: 20px;
                margin-top: 9px;
            }

                .switch input {
                    display: none;
                }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
            }

                .slider:before {
                    position: absolute;
                    content: "";
                    height: 13px;
                    width: 13px;
                    left: 3px;
                    bottom: 4px;
                    background-color: white;
                    transition: .4s;
                }

                .slider:after {
                    left: 3px;
                }


            /* include generated hidden field here */
            input[type="checkbox"]:checked + input[type="hidden"] + .slider,
            input[type="checkbox"]:checked + .slider {
                background-color: #336699;
            }

            /* include generated hidden field here */
            input[type="checkbox"]:focus + input[type="hidden"] + .slider,
            input[type="checkbox"]:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            /* include generated hidden field here */
            input[type="checkbox"]:checked + input[type="hidden"] + .slider:before,
            input[type="checkbox"]:checked + .slider:before {
                transform: translateX(20px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

                .slider.round:before {
                    border-radius: 50%;
                }

            .custom-checkbox .custom-control-label::before {
                border-color: transparent;
                background-color: transparent;
            }

            .custom-checkbox .custom-control-label::after {
                background-image: url(five-pointed-star.svg);
                background-size: 100%;
            }

            .custom-checkbox .custom-control-input:checked ~ .custom-control-label::before {
                border-color: transparent;
                background-color: transparent;
            }

            .custom-checkbox .custom-control-input:checked ~ .custom-control-label::after {
                background-image: url(five-pointed-star-selected.svg);
                background-size: 100%;
            }
        </style>
    </head>




    <script language="javascript" type="text/javascript">

        function Alert(type, title, msg) {
            switch (type) {
                case "basic":
                    swal({
                        Text: msg
                    });
                    break;
                case "success":
                    swal(title, msg, "success");
                    break;
                case "error":
                    swal(title, msg, "error");
                    break;
                case "warning":
                    swal(title, msg, "warning");
                    break;
            }

        }
        function fnConfirmSave() {

            if (confirm('Do you want to Save?')) {
                return true;
            }
            else
                return false;

        }
        function fnConfirmClear() {

            if (confirm('Do you want to Clear?')) {
                return true;
            }
            else
                return false;
        }

        function fnConfirmLock() {

            if (confirm('Do you want to Lock this budget?')) {
                return true;
            }
            else
                return false;
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }



    </script>

    <asp:UpdatePanel ID="PnlBudgetPalnning" runat="server">
        <ContentTemplate>

            <script type="text/javascript">


                function fnCheckPageValidators_Go(strValGrp, blnConfirm) {
                    if (Page_ClientValidate() == false) {
                        var iResult = "1";
                        for (i = 0; i < Page_Validators.length; i++) {
                            val = Page_Validators[i];
                            controlToValidate = val.getAttribute("controltovalidate");
                            if (controlToValidate != undefined) {
                                if (document.getElementById(controlToValidate) != null) {
                                    document.getElementById(controlToValidate).border = "1";
                                }
                            }
                        }
                        for (i = 0; i < Page_Validators.length; i++) { //For loop1
                            val = Page_Validators[i];
                            var isValidAttribute = val.getAttribute("isvalid");
                            var controlToValidate = val.getAttribute(" ");
                            if (controlToValidate != undefined) {
                                if (strValGrp == undefined) {
                                    if (document.getElementById(controlToValidate) != null) {
                                        if (isValidAttribute == false) {

                                            document.getElementById(controlToValidate).className = 'styleReqFieldFocus';
                                            //This is to avoid not to validate control which is already in false state (valid attribute)
                                            document.getElementById(controlToValidate).border = "0";
                                            iResult = "0";
                                        }
                                        else if (document.getElementById(controlToValidate).border != "0") {
                                            document.getElementById(controlToValidate).className = 'styleReqFieldDefalut';
                                        }
                                    }
                                }

                            }
                        }
                        Page_BlockSubmit = false;
                    }
                    if (Page_ClientValidate(strValGrp)) {

                        return true;

                    }
                    else {
                        Page_BlockSubmit = false;
                        return false;
                    }
                }


            </script>

            <div id="progress" runat="server" visible="false" class="loder_img">
                <img src="../Images/MFC_Loader.gif" id="imgLoading2" title="Loading.." />
                <label id="lblLoading" title="MFC-Please Wait..."></label>
            </div>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading"></asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="divpnlHierarchyType" runat="server">
                            <asp:Panel ID="pnlHierarchyType" runat="server" GroupingText="Hierarchy Type" CssClass="stylePanel"
                                Visible="false">

                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:RadioButtonList ID="rblHierarchy" runat="server" RepeatDirection="Horizontal"
                                                ValidationGroup="vgLocationGroup">
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="rfvHierarchy" runat="server" ValidationGroup="vgLocationGroup"
                                                Display="None" InitialValue="" ControlToValidate="rblHierarchy" ErrorMessage="Select the Hierarchy Type"></asp:RequiredFieldValidator>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <span class="styleReqFieldLabel">Hierarchy Type</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="divLocationCatDetails" runat="server">
                            <asp:Panel Visible="true" runat="server" ID="pnlBudgetMaster" GroupingText="Monthly MIS"
                                CssClass="stylePanel">
                                <asp:UpdatePanel ID="upLocationdetails" runat="server">
                                    <ContentTemplate>


                                        <div class="row">

                                            <div class="col-lg-4 col-md-6 styleFieldLabel" runat="server" visible="false">

                                                <div class="md-input">
                                                    <uc2:Suggest ID="ddlReportName" runat="server" ServiceMethod="GetGLList" ToolTip="Report Name" IsMandatory="true"
                                                        ValidationGroup="Save" AutoPostBack="true" ErrorMessage="Select Report Name" class="md-form-control form-control" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="LblGlCode" CssClass="styleReqFieldLabel"
                                                            Text="Report Name"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvCreditApprovalRpt1" runat="server">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlFinacialYearBase" runat="server" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlFinacialYearBase_SelectedIndexChanged" ValidationGroup="GO"
                                                        ToolTip="Financial Years" class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Go" ErrorMessage="Select Financial Years"
                                                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlFinacialYearBase"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFinancialYearBase" runat="server" Text="Financial Years " CssClass="styleReqFieldLabel" ToolTip="Financial Years"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>



                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvCreditApprovalRpt2" runat="server">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlFromYearMonthBase" runat="server"
                                                        ToolTip="Month" class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvReportType" runat="server" ControlToValidate="ddlFromYearMonthBase"
                                                            InitialValue="0" Display="Dynamic" ErrorMessage="Select a Month" ValidationGroup="Go"
                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>


                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblFromYearMonthBase" runat="server" Text="Month" CssClass="styleReqFieldLabel" ToolTip="Month"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>



                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvStartDateSearch" runat="server" visible="false">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtStartDateSearch" runat="server" ValidationGroup="GO" autocomplete="off" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgStartDateSearch" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                                    <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                                        PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                                        <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                            runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Start Date" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvEndDateSearch" runat="server" visible="false">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtEndDateSearch" runat="server" ValidationGroup="GO"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgEndDateSearch" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                                    <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                                        PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                                        <%-- OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                            runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter the End Date"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                                                    </label>
                                                </div>
                                            </div>


                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>

                            <div align="right">

                                <button class="css_btn_enabled" id="btnSearch"
                                    onserverclick="btnSearch_Click" validationgroup="Go" runat="server"
                                    type="button" onclick="if(fnCheckPageValidators_Go())" causesvalidation="false" accesskey="D" title="PDF,Alt+D">
                                    <i class="fa fa-arrow-circle-right"></i>&emsp;P<u>D</u>F
                                </button>



                                <button class="css_btn_enabled" id="btnClear" runat="server"
                                    type="button" accesskey="l" causesvalidation="false" onserverclick="btnClearClick" onclick="if(fnConfirmClear('Do you want to Clear?'))" title="Clear[Alt+l]">
                                    <i class="fa fa-eraser"></i>&emsp;C<u>l</u>ear
                                </button>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="btnSearch" />
        </Triggers>

    </asp:UpdatePanel>
</asp:Content>

