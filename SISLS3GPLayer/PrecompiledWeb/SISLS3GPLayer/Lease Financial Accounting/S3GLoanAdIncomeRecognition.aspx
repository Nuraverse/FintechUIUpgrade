<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" enableeventvalidation="false" autoeventwireup="true" inherits="S3GLoanAdIncomeRecognition, App_Web_sp1i5jlb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading"
                                CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlIncomeRecog" runat="server" CssClass="stylePanel" GroupingText="Schedule Details">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            runat="server" AutoPostBack="True" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlLOB" ValidationGroup="grpGO" InitialValue="0" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOBSave" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlLOB" ValidationGroup="grpSave" InitialValue="0" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Line of Business" ID="lblLOB">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFrequency" runat="server"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvFrequency" ValidationGroup="grpGO" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlFrequency" InitialValue="0" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvFrequencySave" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlFrequency" ValidationGroup="grpSave" InitialValue="0" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Frequency" ID="lblFrequency" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtCutoffDate"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgCutoffDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                            Format="dd/MM/yyyy"
                                            PopupButtonID="imgCutoffDate" TargetControlID="txtCutoffDate">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Cut off Date" ID="lblCutoffDate" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:RadioButtonList ID="rbtnSchedule" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                            OnSelectedIndexChanged="rbtnSchedule_SelectedIndexChanged"
                                            CssClass="md-form-control form-control radio">
                                            <asp:ListItem Selected="True" Text="Schedule at:" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Schedule Now" Value="1"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtScheduleDate"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgScheduleDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CECScheduleDate" runat="server" Enabled="True"
                                            Format="dd/MM/yyyy" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                            PopupButtonID="imgScheduleDate" TargetControlID="txtScheduleDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvScheduleDate" CssClass="validation_msg_box_sapn"
                                                ErrorMessage="Enter Schedule Date" ValidationGroup="grpSave"
                                                runat="server" ControlToValidate="txtScheduleDate">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Schedule Date" ID="Label2">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtScheduleTime"
                                            Class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                        (HH:MM AM)
                                   
                                     
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ValidationGroup="grpSave" Display="Dynamic" ID="rfvScheduleTime" CssClass="validation_msg_box_sapn"
                                                runat="server" ErrorMessage="Enter Schedule Time" ControlToValidate="txtScheduleTime" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                        </div>
                                        <asp:RegularExpressionValidator ID="REVScheduleTime" runat="server"
                                            ErrorMessage="Enter Valid Schedule Time" ValidationGroup="grpSave" Enabled="false"
                                            ControlToValidate="txtScheduleTime" SetFocusOnError="True" Display="None"
                                            ValidationExpression="(^([0-9]|[0-1][0-9]|[2][0-3]):([0-5][0-9])(\s{0,1})(AM|PM|am|pm|aM|Am|pM|Pm{2,2})$)|(^([0-9]|[1][0-9]|[2][0-3])(\s{0,1})(AM|PM|am|pm|aM|Am|pM|Pm{2,2})$)"></asp:RegularExpressionValidator>
                                        <%--<span class="styleMandatory">(Should be alteast five minutes greater than current time)</span>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Schedule Time" ID="Label4">
                                            </asp:Label>
                                        </label>


                                    </div>
                                </div>
                            </div>
                            <div  align="right">
                                <button class="css_btn_enabled" id="btnGO" onserverclick="btnGO_Click" validationgroup="grpGO" runat="server"
                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvCutoffDate" runat="server"
                                        ControlToValidate="txtCutoffDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                        ErrorMessage="Enter Cut off Date" ValidationGroup="grpGO">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvCutoffDateSave" runat="server"
                                        ControlToValidate="txtCutoffDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                        ErrorMessage="Enter Cut off Date" ValidationGroup="grpSave">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="Panel1" Visible="false" runat="server" Width="100%" CssClass="stylePanel" GroupingText="Income Recognition Details">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView runat="server" OnRowDataBound="grvIRConsolidate_RowDataBound"
                                            AutoGenerateColumns="FALSE" CellPadding="4" CellSpacing="2"
                                            OnRowCommand="grvIRConsolidate_RowCommand"
                                            ID="grvIRConsolidate" Width="99%">
                                            <Columns>
                                                <%-- Check Box  --%>
                                                <asp:TemplateField HeaderText="Process">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkIR" runat="server"></asp:CheckBox>
                                                        <asp:HiddenField ID="hdnIRStatus" runat="server" Value='<%# Bind("Status")%>'></asp:HiddenField>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-Wrap="true" HeaderText="Revoke">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkRevoke" runat="server"></asp:CheckBox>
                                                        <asp:Label ID="lblRevokeStatus" Visible="false" runat="server" Text='<%# Bind("Status")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Branch  --%>

                                                <asp:TemplateField ItemStyle-Width="100px" HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtBranchName" runat="server" Text='<%# Bind("Location")%>'></asp:Label>
                                                        <asp:Label ID="lblBranchID" runat="server" Visible="false" Text='<%# Bind("Location_Code")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <%-- Number of Inst  --%>
                                                <asp:TemplateField HeaderText="Number of Installments" Visible="false" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNoofInstallment" runat="server" Text='<%# Bind("NoofInstallment")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <%-- Number of A/c  --%>
                                                <asp:TemplateField HeaderText="Number of Accounts" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNoOfAccounts" runat="server" Text='<%# Bind("ACC_COUNT")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- IR Amount  --%>
                                                <asp:TemplateField HeaderText="Income Amount" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIRAmount" runat="server" Text='<%# Bind("IR_AMOUNT")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='Yet to Process'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Income Recognition No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIncome_Recognition_No" runat="server" Text='<%# Bind("Income_Recognition_No")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="false" HeaderText="Posting">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnPosting" OnClientClick="return fnCheckPageValidationPosting();" runat="server" CommandArgument='<%# Bind("Income_Calculation_ID") %>'
                                                            CssClass="styleGridShortButton" CommandName="Posting" Text="Posting" />
                                                        <asp:Label ID="lblPostingStatus" Visible="false" runat="server" Text='<%# Bind("PostingStatus")%>'></asp:Label>
                                                        <asp:Label ID="lblMonthLock" Visible="false" runat="server" Text='<%# Bind("MonthLock")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Query">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnQuery" Enabled="false" ImageUrl="~/Images/spacer.gif" ToolTip="Query" CssClass="styleGridEditDisabled"
                                                            CommandArgument='<%# Bind("Income_Calculation_ID") %>' CommandName="Query" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" HeaderText="XL Porting">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnPorting" Enabled="false" ImageUrl="~/Images/spacer.gif" ToolTip="XL Porting" CssClass="styleGridEditDisabled"
                                                            CommandArgument='<%# Bind("Income_Calculation_ID") %>' CommandName="Porting" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <asp:Panel ID="pnlIRDetails" Visible="false" runat="server" Width="100%" CssClass="stylePanel" GroupingText="Income Calculation Details">
                                    <asp:GridView runat="server" AutoGenerateColumns="false" CellPadding="6" CellSpacing="2"
                                        ShowFooter="false" AllowPaging="false" AllowSorting="false"
                                        ID="grvIncomeRecognition">
                                        <Columns>
                                            <asp:BoundField DataField="LOB_Name" HeaderText="Line of Business" />
                                            <asp:BoundField DataField="Location" HeaderText="Branch" />
                                            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                                            <asp:BoundField DataField="PANum" ItemStyle-Wrap="true" ItemStyle-Width="120px" HeaderText="Account Number" />
                                            <asp:BoundField DataField="SANum" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderText="Sub Account Number" Visible="false" />
                                            <asp:BoundField DataField="PRODUCT" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderText="Scheme" />
                                            <asp:BoundField DataField="Int.FromDate" HeaderText="Income From Date" HeaderStyle-Wrap="true" />
                                            <asp:BoundField DataField="Int.ToDate" HeaderText="Income To Date" HeaderStyle-Wrap="true" />
                                            <asp:BoundField DataField="NoofDays" ItemStyle-HorizontalAlign="Right" HeaderText="No of Days" />
                                            <asp:BoundField DataField="IncomeAmount"
                                                ItemStyle-HorizontalAlign="Right"
                                                HeaderText="Income Amount" />
                                            <asp:BoundField DataField="DealerCommission"
                                                ItemStyle-HorizontalAlign="Right"
                                                HeaderText="Dealer Commission" />
                                        </Columns>
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <RowStyle HorizontalAlign="Left" />
                                    </asp:GridView>
                                </asp:Panel>

                            </div>
                            <div class="row">                                
                                    <uc1:PageNavigator Visible="false" ID="ucCustomPaging" runat="server"></uc1:PageNavigator>                               
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div  align="right">
                    <button class="css_btn_enabled" id="btnCalculate"  onserverclick="btnCalculate_Click" runat="server"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" visible="false"  >
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                       </button>
                   
                    <button class="css_btn_enabled" id="btnSave" enabled="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="grpSave"
                        onclientclick="return fnCheckPageValidators('grpSave');" >
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnRevoke" onserverclick="btnRevoke_Click" causesvalidation="false" runat="server" onclick="if(return fnCheckPageValidationRevoke())"
                        type="button" accesskey="R" title="Revoke[Alt+R]" enabled="false">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>R</u>evoke
                    </button>
                    <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclientclick="return confirm( )"
                        onserverclick="btnClear_Click" type="button" accesskey="L" title="Clear[Alt+L]">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X" title="Exit[Alt+X]">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row" style="display:none;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                            Height="100px" CssClass="styleMandatoryLabel" ValidationGroup="grpGO"
                            Width="500px" ShowMessageBox="false" ShowSummary="true" />

                        <asp:ValidationSummary runat="server" ID="vsSave" HeaderText="Correct the following validation(s):"
                            Height="100px" CssClass="styleMandatoryLabel" ValidationGroup="grpSave"
                            Width="500px" ShowMessageBox="false" ShowSummary="true" />
                        <input type="hidden" runat="server" id="hdnIncomeRecgId" />

                        <asp:Label ID="lblErrorMessage" runat="server"
                            CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
                <div class="row" style="display:none;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                        <asp:CustomValidator ID="rfvCompareCutoffDate" runat="server"
                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="grpSave"
                            ErrorMessage="Cut off Date must be last date of month"></asp:CustomValidator>
                        <asp:Label ID="Label1" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
            </div>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <script language="javascript" type="text/javascript">

        var bResult;

        function fnCheckPageValidation(grpSave) {
             //if (!fnCheckPageValidators(grpSave, false))
               //return false;

            bResult = fnIsCheckboxChecked('<%=grvIRConsolidate.ClientID%>', 'chkIR', 'Location');
            if (bResult) {

                if (confirm('Are you sure you want to save Income Recognition?')) {
                    return true;
                }
                else
                    return false;
            }
            return bResult;
        }

        function fnCheckPageValidationRevoke() {

            bResult = fnIsCheckboxChecked('<%=grvIRConsolidate.ClientID%>', 'chkRevoke', 'Location');
            if (bResult) {
                if (confirm('Are you sure you want to Revoke?')) {
                    return true;
                }
                else
                    return false;
            }
            return bResult;
        }

        function fnCheckPageValidationPosting() {

            if (confirm('Are you sure you want to Post Sys Journal?')) {
                return true;
            }
            else
                return false;
        }


    </script>

</asp:Content>


