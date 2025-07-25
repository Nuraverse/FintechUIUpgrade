<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FAAccountLedger, App_Web_upeq32zu" title="Untitled Page" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <style type="text/css">
                .ajax__calendar_inactive {
                    color: #dddddd;
                }
            </style>
            <script language="javascript" type="text/javascript">
                //var cal1;
                //var cal2;

                //function pageLoad() {            

                //    cal1 = $find("calendar1");
                //    cal2 = $find("calendar2");

                //    modifyCalDelegates(cal1);
                //    modifyCalDelegates(cal2);
                //}
                //lblcoulumndesc
                //function modifyCalDelegates(cal) {
                //    //we need to modify the original delegate of the month cell. 
                //    cal._cell$delegates = {
                //        blur: Function.createDelegate(cal, DisableDates(cal))
                //    }
                //}      

                //function DisableDates(a) {            
                //    try {
                //        debugger;
                //        for (var d = 0; d < a._days.all.length; d++) {
                //            if (a[d].date.getFullYear() == "2013" || a[d].date.getFullYear() == "2014") {
                //                a[d].className = "ajax__calendar_day ajax__calendar_day_disabled"
                //            }
                //            else {
                //                a[d].className = "ajax__calendar_day"
                //            }
                //        }
                //    }
                //        catch (e) { }
                //}     

                function divexpandcollapse(divname) {
                    debugger;
                    var div = document.getElementById(divname);
                    //var img = document.getElementById('img' + divname);
                    if (div.style.display == "none") {
                        div.style.display = "inline";
                        return true;
                        //img.src = "../Images/minus.png";
                    } else {
                        div.style.display = "none";
                        return true;
                        //img.src = "../Images/plus.png";
                    }
                }

            </script>
            <script src="../Scripts/Extension.min.js" type="text/javascript"></script>
            <%-- <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>--%>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ControlToValidate="ddlActivity"
                                                    InitialValue="--Select--" ErrorMessage="Select Activity" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                                    InitialValue="--Select--" ErrorMessage="Select Branch" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblLocation" Text="GL Branch" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkLocationPrint" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" />
                                            <asp:Label runat="server" ID="lblLocationPrint" Text="Branch Print" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlAccountFrom" runat="server" AutoPostBack="True"
                                                OnItem_Selected="ddlAccountFrom_SelectedIndexChanged"
                                                ServiceMethod="FunPriBindGL" ErrorMessage="Enter Account From"
                                                IsMandatory="true" ValidationGroup="vgGo" ToolTip="Account From"
                                                watermarktext="--Select--" />

                                            <cc1:ComboBox ID="ddlSLFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" Visible="false">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblAccFrom" CssClass="styleReqFieldLabel" Text="Account From"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlAccountTo" runat="server" AutoPostBack="True"
                                                OnItem_Selected="ddlAccountTo_SelectedIndexChanged"
                                                ServiceMethod="FunPriBindGL" ErrorMessage="Enter Account From"
                                                IsMandatory="false" ValidationGroup="vgGo" ToolTip="Account From"
                                                watermarktext="--Select--" />

                                            <cc1:ComboBox ID="ddlSLTo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" Visible="false">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblAccTo" CssClass="styleReqFieldLabel" Text="Account To"></asp:Label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkSubAccount" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" Visible="false" />
                                            <asp:Label runat="server" ID="lblSubAccount" Text="Sub Account" Visible="false" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtFromDate"
                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                                    ErrorMessage="Select From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtToDate"
                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                PopupButtonID="txtToDate" BehaviorID="calendar2" ID="CalToDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                                                    ErrorMessage="Select To Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkRemarks" runat="server" />
                                            <asp:Label runat="server" ID="lblRemarks" Text="Remarks" AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" />
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocationrecord" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" Visible="false"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlLocation"
                                                    InitialValue="--Select--" ErrorMessage="Select Location" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label1" Text="Record Location" Visible="false" />
                                            </label>
                                        </div>
                                    </div>


                                </div>

                                <div align="right">
                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>

                                    <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if( fnConfirmClear())"
                                        type="button" accesskey="L" title="Clear[Alt+L]" onserverclick="btnClear_Click">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                    </button>

                                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                                        type="button" accesskey="X" title="Cancel[Alt+X]">
                                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                                    </button>
                                    <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" causesvalidation="false" runat="server"
                                        type="button" accesskey="P" title="Print[Alt+P]">
                                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                                    </button>

                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <%--For Showing Grid--%>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlAccountLedger" runat="server" Visible="false" GroupingText="Account Ledger Details"
                                Width="100%" CssClass="stylePanel">


                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                        <asp:Panel ID="pnlScroll" runat="server" GroupingText="" Width="100%" CssClass="stylePanel">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvAccountLedger" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                            RowStyle-Width="0" OnRowDataBound="gvAccountLedger_RowDataBound" Width="100%" DataKeyNames="GL_Code ">

                                                            <Columns>
                                                                <%--Serial Number--%>
                                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                <%--Location--%>

                                                                <asp:TemplateField HeaderText="Branch">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%--     <asp:TemplateField HeaderText="Add" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="3%" >
                                                        <ItemTemplate>
                                                            <a href="JavaScript:divexpandcollapse('div<%# Eval("Gl_code")%>');">

                                                                <img id='imgdiv<%# Eval("Gl_code")%>' alt="Add" width="15px" border="0" src="../Images/plus.png" onclick="Show_Hide_DetailsGrid"  />
                                                            </a>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                                <%--Doc Date --%>
                                                                <asp:TemplateField HeaderText="Document Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Doc No --%>
                                                                <asp:TemplateField HeaderText="Document Number">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Value Date --%>
                                                                <asp:TemplateField HeaderText="Value Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Account --%>
                                                                <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                <%--Description --%>
                                                                <asp:TemplateField HeaderText="Description">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' Visible="false" />

                                                                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />

                                                                        <asp:LinkButton ID="lnkhyper" runat="server" Text='<%#Eval("Description") %>' OnClick="Show_Hide_DetailsGrid" ToolTip="Description">
                                                                        </asp:LinkButton>
                                                                        <asp:Label ID="lblcoulumndesc" runat="server" Text='<%#Eval("column_desc") %>' ToolTip="Description" Visible="false" />
                                                                        <br />
                                                                        <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                                        <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                                        <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                                        <asp:HiddenField ID="hdnsort" runat="server" Value='<%#Eval("sort") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                </asp:TemplateField>
                                                                <%--SL Code--%>
                                                                <%--       <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateField>--%>
                                                                <%--Debit--%>
                                                                <asp:TemplateField HeaderText="Debit">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Credit--%>
                                                                <asp:TemplateField HeaderText="Credit">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Balance--%>
                                                                <asp:TemplateField HeaderText="Balance">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Total" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTotaldebit" runat="server" Text='<%#Eval("Totaldebit") %>' ToolTip="Balance" />
                                                                        <asp:Label ID="lblTotalCredit" runat="server" Text='<%#Eval("Totalcredit") %>' ToolTip="Balance" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />

                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-Width="0.01%">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td colspan="100%">
                                                                                <%--<div id='div<%# Eval("Gl_code") %>' style="display: none; position: relative; left: 15px; overflow: auto">--%>

                                                                                <asp:GridView ID="grvChild" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                                                                    RowStyle-Width="0" OnRowDataBound="grvChild_RowDataBound" Width="100%" ShowHeader="false">
                                                                                    <Columns>
                                                                                        <%--Serial Number--%>
                                                                                        <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                                        <%--Location--%>
                                                                                        <%--  <asp:TemplateField HeaderText="Location">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                                </asp:TemplateField>--%>
                                                                                        <%--Doc Date --%>
                                                                                        <asp:TemplateField HeaderText="Document Date">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <%--Doc No --%>
                                                                                        <asp:TemplateField HeaderText="Document Number">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <%--Value Date --%>
                                                                                        <asp:TemplateField HeaderText="Value Date">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <%--Account --%>
                                                                                        <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                                        <%--Description --%>
                                                                                        <asp:TemplateField HeaderText="Description">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAcc" runat="server" Visible="false" Text='<%#Eval("Account") %>' />

                                                                                                <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />
                                                                                                <asp:Label ID="lblcoulumndesc" runat="server" Text='<%#Eval("column_desc") %>' ToolTip="Description" Visible="false" />
                                                                                                <br />
                                                                                                <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                                                                <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                                                                <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                                        </asp:TemplateField>
                                                                                        <%--SL Code--%>
                                                                                        <%--    <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateField>--%>
                                                                                        <%--Debit--%>
                                                                                        <asp:TemplateField HeaderText="Debit">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                            <FooterTemplate>
                                                                                                <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <%--Credit--%>
                                                                                        <asp:TemplateField HeaderText="Credit">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                            <FooterTemplate>
                                                                                                <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <%--Balance--%>
                                                                                        <asp:TemplateField HeaderText="Balance">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                            <FooterTemplate>
                                                                                                <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Total" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblTotaldebit" runat="server" Text='<%#Eval("Totaldebit") %>' ToolTip="Balance" />
                                                                                                <asp:Label ID="lblTotalCredit" runat="server" Text='<%#Eval("Totalcredit") %>' ToolTip="Balance" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />

                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>

                                                                                <%--</div>--%>
                                                                            </td>
                                                                        </tr>

                                                                        </tr>
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


                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <uc2:PageNavigator ID="ucCustomPaging" runat="server"></uc2:PageNavigator>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:HiddenField ID="hdn_FTDate" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvprint" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                    RowStyle-Width="0" Width="100%" DataKeyNames="GL_Code">

                                    <Columns>
                                        <%--Serial Number--%>
                                        <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                        <%--Location--%>

                                        <asp:TemplateField HeaderText="Location">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="7%" />
                                        </asp:TemplateField>
                                        <%--     <asp:TemplateField HeaderText="Add" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="3%" >
                                                        <ItemTemplate>
                                                            <a href="JavaScript:divexpandcollapse('div<%# Eval("Gl_code")%>');">

                                                                <img id='imgdiv<%# Eval("Gl_code")%>' alt="Add" width="15px" border="0" src="../Images/plus.png" onclick="Show_Hide_DetailsGrid"  />
                                                            </a>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                        <%--Doc Date --%>
                                        <asp:TemplateField HeaderText="Document Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Doc No --%>
                                        <asp:TemplateField HeaderText="Document Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Value Date --%>
                                        <asp:TemplateField HeaderText="Value Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Account --%>
                                        <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                        <%--Description --%>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' />

                                                <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />


                                                <asp:Label ID="lblcoulumndesc" runat="server" Text='<%#Eval("column_desc") %>' ToolTip="Description" Visible="false" />
                                                <br />
                                                <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                <asp:HiddenField ID="hdnsort" runat="server" Value='<%#Eval("sort") %>' />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>
                                        <%--SL Code--%>
                                        <%--       <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateField>--%>
                                        <%--Debit--%>
                                        <asp:TemplateField HeaderText="Debit">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Credit--%>
                                        <asp:TemplateField HeaderText="Credit">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Balance--%>
                                        <asp:TemplateField HeaderText="Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotaldebit" runat="server" Text='<%#Eval("Totaldebit") %>' ToolTip="Balance" />
                                                <asp:Label ID="lblTotalCredit" runat="server" Text='<%#Eval("Totalcredit") %>' ToolTip="Balance" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />

                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Width="0.01%">
                                            <ItemTemplate>
                                                <tr>
                                                    <td colspan="100%">
                                                        <%--<div id='div<%# Eval("Gl_code") %>' style="display: none; position: relative; left: 15px; overflow: auto">--%>

                                                        <asp:GridView ID="grvChild" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                                            RowStyle-Width="0" OnRowDataBound="grvChild_RowDataBound" Width="100%" ShowHeader="false">
                                                            <Columns>
                                                                <%--Serial Number--%>
                                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                <%--Location--%>
                                                                <%--  <asp:TemplateField HeaderText="Location">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                                </asp:TemplateField>--%>
                                                                <%--Doc Date --%>
                                                                <asp:TemplateField HeaderText="Document Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Doc No --%>
                                                                <asp:TemplateField HeaderText="Document Number">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Value Date --%>
                                                                <asp:TemplateField HeaderText="Value Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Account --%>
                                                                <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                <%--Description --%>
                                                                <asp:TemplateField HeaderText="Description">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAcc" runat="server" Visible="false" Text='<%#Eval("Account") %>' />

                                                                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />
                                                                        <asp:Label ID="lblcoulumndesc" runat="server" Text='<%#Eval("column_desc") %>' ToolTip="Description" Visible="false" />
                                                                        <br />
                                                                        <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                                        <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                                        <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                </asp:TemplateField>
                                                                <%--SL Code--%>
                                                                <%--    <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateField>--%>
                                                                <%--Debit--%>
                                                                <asp:TemplateField HeaderText="Debit">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Credit--%>
                                                                <asp:TemplateField HeaderText="Credit">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%--Balance--%>
                                                                <asp:TemplateField HeaderText="Balance">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTotaldebit" runat="server" Text='<%#Eval("Totaldebit") %>' ToolTip="Balance" />
                                                                        <asp:Label ID="lblTotalCredit" runat="server" Text='<%#Eval("Totalcredit") %>' ToolTip="Balance" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />

                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>

                                                        <%--</div>--%>
                                                    </td>
                                                </tr>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                            <asp:ValidationSummary ID="vsAccountLedger" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />--%>
                            <asp:CustomValidator ID="cvAccountLedger" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>
                    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />


        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
