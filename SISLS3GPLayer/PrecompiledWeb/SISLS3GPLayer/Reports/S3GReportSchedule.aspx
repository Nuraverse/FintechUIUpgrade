<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GReportSchedule, App_Web_zznul5le" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagName="PageNavigator" TagPrefix="uc1" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagName="PageTransNavigator" TagPrefix="uc2" Src="~/UserControls/PageNavigator.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function onCalendarShown(sender, args) {
            sender._switchMode("months", true);
            changeCellHandlers(cal1);
        }

    </script>
    <script src="../Content/Scripts/UserScript.js"></script>
    <asp:UpdatePanel ID="updPanel" runat="server">

        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Report Schedule Details" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </h6>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="PnlInputCriteria0" GroupingText="Input Criteria" runat="server" CssClass="stylePanel">

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <%--<asp:CheckBoxList ID="ChkLSTLob" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ChkLSTLob_SelectedIndexChanged"></asp:CheckBoxList>--%>
                                    <asp:DropDownList ID="ChkLSTLob" class="md-form-control form-control" AutoPostBack="true" ToolTip="Line of Business" OnSelectedIndexChanged="ChkLSTLob_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLineofBusiness" CssClass="styleDisplayLabel" ToolTip="Line of Business">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <%-- <asp:Panel runat="server" ID="pnlChekBox" CssClass="stylePanel" ScrollBars="None" GroupingText="" Style="width: 100%; height: 100px;"
                                        BorderColor="#77B6E9" BorderWidth="1">--%>
                                    <%--                                        <asp:CheckBox ID="CheckAll" runat="server" class="md-form-control form-control" OnCheckedChanged="ChckAll_SelectedIndexChanged" Text="All" AutoPostBack="true"></asp:CheckBox>--%>
                                    <asp:DropDownList ID="ChckBoxListLocation" runat="server"></asp:DropDownList>
                                    <%-- </asp:Panel>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Location" ID="lblLocation" CssClass="styleDisplayLabel" ToolTip="Location">
                                        </asp:Label>
                                    </label>
                                </div>

                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDemandMonth" class="md-form-control form-control" runat="server" Visible="true">
                                    </asp:DropDownList>
                                    <%-- <asp:RequiredFieldValidator ID="rfvDemandMonth" CssClass="styleMandatoryLabel" runat="server"
                                        ControlToValidate="ddlDemandMonth" InitialValue="0" ErrorMessage="Select Report Month"
                                        Display="None" ValidationGroup="btngo"></asp:RequiredFieldValidator>--%>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvDemandMonth" ValidationGroup="btngo" InitialValue="0"
                                            CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select Report Month" ControlToValidate="ddlDemandMonth"
                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Report Month" ID="lblDate" CssClass="styleReqFieldLabel"
                                            ToolTip="Date From"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlfileformate" class="md-form-control form-control" runat="server"></asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="rfvFileFormate" runat="server" ControlToValidate="ddlfileformate" InitialValue="0" ValidationGroup="btngo" Display="None" ErrorMessage="Select File Format"></asp:RequiredFieldValidator>--%>

                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvFileFormate" ValidationGroup="btngo" InitialValue="0"
                                            CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select File Format" ControlToValidate="ddlfileformate"
                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Format" ID="Label1" CssClass="styleReqFieldLabel"
                                            ToolTip="Date From"></asp:Label>
                                    </label>
                                    <asp:HiddenField ID="hdnProgram" runat="server" />
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtScheduleat" class="md-form-control form-control" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="calScheduleAt" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" runat="server"
                                        TargetControlID="txtScheduleat">
                                    </cc1:CalendarExtender>
                                    <%--<asp:RequiredFieldValidator ID="rfvSheduleDate" runat="server" ControlToValidate="txtScheduleat" ValidationGroup="btngo" Display="None" ErrorMessage="Select Schedule At"></asp:RequiredFieldValidator>--%>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvSheduleDate" ValidationGroup="btngo"
                                            CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select Schedule At" ControlToValidate="txtScheduleat"
                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Schedule At" ID="lblScheduleAt" CssClass="styleReqFieldLabel"
                                            ToolTip="Schedule At"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlprogramName" class="md-form-control form-control" runat="server"></asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvreportname" ValidationGroup="btngo" InitialValue="0"
                                            CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select Report Name" ControlToValidate="ddlprogramName"
                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <%--<asp:RequiredFieldValidator ID="rfvreportname" runat="server" ControlToValidate="ddlprogramName" InitialValue="0" ValidationGroup="btngo" Display="None" ErrorMessage="Select Report Name"></asp:RequiredFieldValidator>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Report Name" ID="lblReportName" CssClass="styleReqFieldLabel"
                                            ToolTip="Report Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>


            <div align="right">
                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Schedule" onclick="if(fnCheckPageValidators())" validationgroup="btngo" runat="server"
                    type="button" causesvalidation="true" accesskey="S" title="Save,Alt+S">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u></u>Save
                </button>
                <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" validationgroup="btngo" runat="server"
                    type="button" causesvalidation="false" accesskey="L" title="Clear,Alt+L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u></u>Clear
                </button>
                <button class="css_btn_enabled" id="btnExit" onserverclick="btnExit_ServerClick" validationgroup="btngo" runat="server"
                    type="button" causesvalidation="false" accesskey="E" title="Exit,Alt+E">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u></u>Exit
                </button>
                <button class="css_btn_enabled" id="btncanenReq" onserverclick="btn_CancelRequest" validationgroup="btngo" runat="server"
                    type="button" causesvalidation="true" accesskey="R" title="Cancel,Alt+R">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u></u>Exit
                </button>
            </div>

            <div class="row">
                <asp:ValidationSummary ID="lblsErrorMessage" runat="server" CssClass="styleMandatoryLabel"
                    HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btngo" />
                <asp:CustomValidator ID="cvApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" Width="98%" />
            </div>

            <%--   <table>
                <tr class="styleButtonArea" style="padding-left: 4px">
                    <td height="8px" align="center" style="margin-left: 80px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>

            <%-- <asp:Button ID="btnGo" runat="server" Text="Schedule" ValidationGroup="btngo" OnClientClick="return fnCheckPageValidators()" CssClass="styleSubmitButton"
                            ToolTip="Go" OnClick="btnGo_Schedule" />--%>
            <%--   &nbsp; &nbsp;&nbsp;&nbsp;--%>
            <%--   <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="styleSubmitButton"
                    CausesValidation="false" ToolTip="Clear" OnClick="btnClear_Click" />--%>
            <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="btn_CancelClick" Text="Cancel" CssClass="styleSubmitButton"
                            CausesValidation="false" ToolTip="Cancel" />--%>

            <%--   </td>
                </tr>
            </table>--%>


            <%--   <table>--%>
            <%-- <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:Button ID="btncanenReq" runat="server" Text="Cancel Request" OnClick="btn_CancelRequest" CssClass="styleSubmitButton" ValidationGroup="Go"
     CausesValidation="true" ToolTip="Cancel Request" />
                    </td>
                </tr>--%>
            <%-- </table>--%>
            <%-- <asp:CustomValidator ID="cvApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
                Enabled="true" Width="98%" />--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

