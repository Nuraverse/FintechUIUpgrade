<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRPTCBOReports, App_Web_qvacefhr" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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


    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="Panel1" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                        Width="99%">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                  
                                     <asp:TextBox ID="txtStartDate" autocomplete="off" runat="server" ToolTip="As on Date"
                                      class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                    <cc1:CalendarExtender ID="calStartDate" runat="server" Enabled="True" TargetControlID="txtStartDate"
                                        PopupButtonID="imgStartDate">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                                            Display="Dynamic" ErrorMessage="Select a As on Date" ValidationGroup="Go"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblStartDate" runat="server" CssClass="styleReqFieldLabel" Text="As on Date"></asp:Label>
                                    </label>
                                </div>
                            </div>



                            <%--                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEndDate" runat="server" autocomplete = "off"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="calEndDate" runat="server" Enabled="True" TargetControlID="txtEndDate"
                                        PopupButtonID="imgEndDate">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="imgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate"
                                            Display="Dynamic" ErrorMessage="Select a End Date" ValidationGroup="Go"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEndDate" runat="server" CssClass="styleReqFieldLabel" Text="End Date"></asp:Label>
                                    </label>
                                </div>
                            </div>--%>

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlReportType" runat="server"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvReportType" runat="server" ControlToValidate="ddlReportType"
                                            InitialValue="0" Display="Dynamic" ErrorMessage="Select a Report Type" ValidationGroup="Go"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblReportType" runat="server" Text="Report Type" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <%--                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox runat="server" ID="txtCBONo" ReadOnly="true"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCBONo" runat="server" Text="CBO No" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>--%>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <%--  <button class="css_btn_enabled" id="btnrecords" onserverclick="btnrecords_OnClick" validationgroup="Go" runat="server"
                    type="button" causesvalidation="false" accesskey="E" title="Excel,Alt+E">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                </button>--%>
                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_OnClick" validationgroup="Go" runat="server"
                    type="button" causesvalidation="false" onclick="if(fnCheckPageValidators_Go())" accesskey="O" title="Download,Alt+O">
                    <i class="fa fa-download" aria-hidden="true"></i>&emsp;D<u>o</u>wnload
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" visible="false" id="btnCancel" title="Cancel[Alt+C]" onclick="if(fnConfirmExit('btnCancel'))"
                    causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                    type="button" accesskey="C">
                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel" ShowSummary="false"
                        ValidationGroup="btnSave" HeaderText="Please correct the following validation(s):" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>















