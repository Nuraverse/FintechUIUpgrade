<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FAMonthAndYearLock, App_Web_tfexpijv" title="Month and Year Lock" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        var TotalChkBx;
        var Counter;

        function pageLoad() {
            $addHandler($get("hideModalPopupClientButton"), 'click', hideModalPopupViaClient);

        }

        window.onload = function () {
            //Get total no. of CheckBoxes in side the GridView.
            TotalChkBx = parseInt('<%= this.grvMothEndParam.Rows.Count %>');

            //Get total no. of checked CheckBoxes in side the GridView.
            Counter = 0;
        }

            function hideModalPopupViaClient() {
                //ev.preventDefault();        
                var modalPopupBehavior = $find('programmaticModalPopupBehavior');
                modalPopupBehavior.hide();
            }

            function HeaderClick(CheckBox, chilId) {
                //Get target base & child control.
                var TargetBaseControl =
           document.getElementById('<%= this.grvMothEndParam.ClientID %>');
            var TargetChildControl = chilId;

                //Get all the control of the type INPUT in the base control.
            var Inputs = TargetBaseControl.getElementsByTagName("input");

                //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
                Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = CheckBox.checked;


                //Reset Counter
            Counter = CheckBox.checked ? TotalChkBx : 0;
        }

        function ChildClick(CheckBox, HCheckBox) {
            //get target control.
            var HeaderCheckBox = document.getElementById(HCheckBox);

            //Modifiy Counter; 
            if (CheckBox.checked && Counter < TotalChkBx)
                Counter++;
            else if (Counter > 0)
                Counter--;

            //Change state of the header CheckBox.
            if (Counter < TotalChkBx)
                HeaderCheckBox.checked = false;
            else if (Counter == TotalChkBx)
                HeaderCheckBox.checked = true;
        }

        function ChildClick1(CheckBox, HCheckBox) {
            //get target control.
            var HeaderCheckBox = document.getElementById(HCheckBox);

            //Modifiy Counter; 
            if (CheckBox.checked && Counter < TotalChkBx)
                Counter++;
            else if (Counter > 0)
                Counter--;

            //Change state of the header CheckBox.
            if (Counter < TotalChkBx)
                HeaderCheckBox.checked = false;
            else if (Counter == TotalChkBx)
                HeaderCheckBox.checked = true;
        }


    </script>
    <div>
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
                <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>--%>
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFinacialYear" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlFinacialYear_SelectedIndexChanged"
                                        CausesValidation="false" class="md-form-control form-control">
                                    </asp:DropDownList>
                                   
                                    <asp:HiddenField ID="hdnvalue" runat="server" Value="0" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvFinancialMonth" ControlToValidate="ddlFinacialYear"
                                            runat="server" ErrorMessage="Select a Financial Year" Display="Dynamic" InitialValue="0"
                                            ValidationGroup="Main" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblYearandMonth1" runat="server" Text="Financial Year" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                               <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                   
                                    <asp:DropDownList ID="ddlFinancialMonth" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlFinancialMonth_SelectedIndexChanged"
                                        CausesValidation="false" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlFinancialMonth"
                                            runat="server" ErrorMessage="Select a Financial Month" Display="Dynamic" InitialValue="0"
                                            ValidationGroup="Main" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="Label2" runat="server" Text="Financial Month" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkYearLock" runat="server" AutoPostBack="True"  OnCheckedChanged="chkYearLock_CheckedChanged" />
                                    <asp:Label ID="lblYearLockDispaly" runat="server" Text="Year Lock"></asp:Label>
                                      <asp:Label ID="lblYearLock1" runat="server" Font-Bold="True"></asp:Label>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>

                                  <%--<asp:Label ID="lblYearLockDispaly" runat="server" Text="Year Lock"></asp:Label>--%>
                                    

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkMonthLock" runat="server" AutoPostBack="True" OnCheckedChanged="chkMonthLock_CheckedChanged" />
                                    <asp:Label ID="lblMonthLockDisplay" runat="server" Text="Month Lock"></asp:Label>
                                     <asp:Label ID="lblMonthLock1" runat="server" Font-Bold="True"></asp:Label>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>

                                    <%--<asp:Label ID="lblMonthLockDisplay" runat="server" Text="Month Lock"></asp:Label>--%>
                                   

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" TextMode="Password"
                                        onCopy="return false" onDrag="return false" onDrop="return false"
                                        onPaste="return false" autocomplete="off"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                            ErrorMessage="Enter the Password" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Main"
                                            CssClass="validation_msg_box_sapn" />
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Password" ID="lblPassword" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>


                              <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                
                                     <div class="md-input">
                                                            <button class="grid_btn" id="btnFetch" title="Alt+E" accesskey="E" runat="server" visible="false" onserverclick="btnFetch_ServerClick" >
                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>F<u>e</u>tch  Opening Balance</button>
                                   </div>
                                   
                                  
                            </div>

                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                
                                     <div class="md-input">
                                                            <button class="grid_btn" id="btnupdateopening" title="Alt+U" accesskey="U" runat="server" visible="false" onserverclick="btnupdateopening_ServerClick" >
                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i><u>U</u>pdate  Opening Balance</button>

                                                                               <asp:HiddenField ID="hdnupdate" runat="server" Value="0" />                       
                                                                                                      </div>
                                   
                                  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div id="div1" style="margin-left: 2px; margin-right: 2px; overflow: auto;" width="100%">
                                    <asp:GridView ID="grvMothEndParam" runat="server" AutoGenerateColumns="False" Width="75%"
                                        OnRowCreated="grvMothEndParam_RowCreated" OnRowDataBound="grvMothEndParam_RowDataBound"
                                        OnRowCommand="grvMothEndParam_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Branch" SortExpression="Location">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocationId" runat="server" Text='<%# Bind("Location_ID") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location_Name") %>'></asp:Label>
                                                    <asp:Label ID="lblLastMonth" runat="server" Text='<%# Bind("LAST_MONTH") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lock Date">
                                                <ItemTemplate>
                                                    <%--'<%# Bind("Lock_Date") %>'--%>
                                                    <asp:Label ID="lblLockDate" runat="server" Text='<%# Bind("Lock_Date") %>'></asp:Label>
                                                    <asp:Label ID="lblLockDate_O" runat="server" Text='<%# Bind("Lock_Date") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lock Time">
                                                <ItemTemplate>
                                                    <%--'<%# Bind("Lock Time") %>'--%>
                                                    <asp:Label ID="lblLockTime" runat="server" Text='<%# Bind("Lock_Time") %>'></asp:Label>
                                                    <asp:Label ID="lblLockTime_O" runat="server" Text='<%# Bind("Lock_Time") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Month Lock">
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblHdrCB" Text="Month Lock" runat="server" CssClass="StyleDisplayLabel" /><br />
                                                    <asp:CheckBox ID="chkHdrMonthLock" runat="server" CssClass="styleGridHeader" onclick="javascript:HeaderClick(this,'chkMonth');"
                                                        AutoPostBack="True" OnCheckedChanged="chkHdrLockEvent_CheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%-- <asp:CheckBox ID="chkMonth" runat="server" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                        AutoPostBack="True" Checked='<%#DataBinder.Eval(Container.DataItem, "Is_Month_Lock").ToString().ToUpper() == "1"%>' />--%>
                                                    <asp:CheckBox ID="chkMonth" runat="server" Enabled="true" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Is_Month_Lock")))%>'
                                                        AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Document">
                                                <ItemTemplate>
                                                    <%--'<%# Bind("Document") %>'--%>
                                                     <asp:Label ID="lbdoc"  runat="server" Text='<%# Bind("IS_DOC") %>'></asp:Label>
                                                   <%-- <asp:CheckBox ID="chkDoc" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                        Enabled="false" Checked='<%#DataBinder.Eval(Container.DataItem, "IS_DOC").ToString().ToUpper() == "1"%>' />--%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Execption Count">
                                                <ItemTemplate>
                                                    <%--'<%# Bind("Document") %>'--%>
                                                     <asp:Label ID="lblexp"  runat="server" Text='<%# Bind("Exception_Count") %>'></asp:Label>
                                                   <%-- <asp:CheckBox ID="chkDoc" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                        Enabled="false" Checked='<%#DataBinder.Eval(Container.DataItem, "IS_DOC").ToString().ToUpper() == "1"%>' />--%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Revoke">
                                                 
                                                <ItemTemplate>
                                                    <%--'<%# Bind("Document") %>'--%>
                                                    <asp:CheckBox ID="chkRevoke" runat="server" AutoPostBack="true" Enabled="false" Checked='<%#DataBinder.Eval(Container.DataItem, "Rev").ToString().ToUpper() == "1"%>'
                                                        OnCheckedChanged="chkLockEvent_CheckedChanged" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pending Documents" Visible="true">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkView" runat="server" Text="View" CommandName="view" CommandArgument='<%# Bind("Location_ID") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <%-- <EmptyDataTemplate>
                                                            No Records Found
                                                        </EmptyDataTemplate>
                                                        <EmptyDataRowStyle HorizontalAlign="Center" Font-Size="Medium" VerticalAlign="Middle"
                                                            Width="100%" CssClass="styleRecordCount" />--%>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div runat="server" id="dvProView" style="width: 75%; height: 300px;" >
                                <asp:Panel ID="PnlPassword" runat="server" BackColor="White" BorderStyle="Solid"
                                    BorderWidth="1px" Style="display: none; vertical-align: middle" Width="50%">
                                     <div runat="server" id="Div7" style="width: 100%; overflow: auto; height: 300px;" >
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Label runat="server" Text="Pending Documents" ID="Label1" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlReceipt" runat="server" BackColor="White">
                                                      <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row" style="float: right; margin-top: 5px;">
                                                          

                                                            <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">

                                                                <asp:Button ID="btnDimClose" runat="server" Text="Close" CausesValidation="false" EnableViewState="false"
                                                                    CssClass="grid_btn" OnClick="btnDimClose_Click" AccessKey="L" />
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divPendings" title="Pending Receipts" >
                                                    <asp:Label ID="lblReceipt" runat="server" Font-Bold="False" Font-Size="Small" Text="No Pending Receipt Records Found"
                                                        Visible="False" />
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvReceipt" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Receipt Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceipt_Date" runat="server" Text='<%#Eval("Receipt_Date") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Receipt No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceipt_No" runat="server" Text='<%#Eval("Receipt_No") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblReceipt_Count" runat="server" Font-Bold="False" Font-Size="Small"
                                                        Visible="True" />

                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlPay" runat="server" BackColor="White">
                                                <div id="Div2" title="Pending Payments" >
                                                    <asp:Label ID="lblPay" runat="server" Font-Bold="False" Font-Size="Small" Text="No Pending Payment Records Found"
                                                        Visible="False" />
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvPay" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Payment Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPay_Date" runat="server" Text='<%#Eval("Payment_Date") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Payment No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPay_No" runat="server" Text='<%#Eval("Payment_No") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                          <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblPay_Count" runat="server" Font-Bold="False" Font-Size="Small" Visible="True" />

                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlMJV" runat="server" BackColor="White">
                                                <div id="Div3" title="Pending Manual Journal" >
                                                    <asp:Label ID="lblMJV_Rec" runat="server" Font-Bold="False" Font-Size="Small" Text="No Pending Manual Journal Records Found"
                                                        Visible="False" />
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvMJV" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="MJV Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMJV_Date" runat="server" Text='<%#Eval("Document_Date") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="MJV No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMJV_No" runat="server" Text='<%#Eval("Document_No") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                          <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAmount" style="text-align: right;" runat="server" Text='<%#Eval("Amount") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblMJV_Count" runat="server" Font-Bold="False" Font-Size="Small" Visible="True" />
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlCreditNote" runat="server" BackColor="White" >
                                                <div id="Div4" title="Pending Credit Notes" >
                                                    <asp:Label ID="lblCreditNote" runat="server" Font-Bold="False" Font-Size="Small"
                                                        Text="No Pending Credit Note Records Found" Visible="False" />
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvCredit" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Credit Note Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCredit_Date" runat="server" Text='<%#Eval("Credit_Date") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Credit Note No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCredit_No" runat="server" Text='<%#Eval("Credit_Note") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                          <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblCredit_Count" runat="server" Font-Bold="False" Font-Size="Small"
                                                        Visible="True" />

                                                      
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlDebit" runat="server" BackColor="White" >
                                                <div id="Div5" title="Pending Debit Notes" >
                                                    <asp:Label ID="lblDebit" runat="server" Font-Bold="False" Font-Size="Small" Text="No Pending Debit Note Records Found"
                                                        Visible="False" />
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvDebit" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Debit Note Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDebit_Date" runat="server" Text='<%#Eval("Debit_Date") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Debit Note No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDebit_No" runat="server" Text='<%#Eval("Debit_Note") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                          <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblDebit_Count" runat="server" Font-Bold="False" Font-Size="Small"
                                                        Visible="True" />
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlCQR" runat="server" BackColor="White">
                                                <div id="Div6" title="Pending Cheque Returns" >
                                                    <asp:Label ID="lblCheque" runat="server" Font-Bold="False" Font-Size="Small" Text="No Cheque Return Records Found"
                                                        Visible="False" />
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvCheque" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Cheque Return Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCR_Date" runat="server" Text='<%#Eval("Return_Date") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Cheque Return No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCR_No" runat="server" Text='<%#Eval("Cheque_Rtn_No") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                          <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblCR_Count" runat="server" Font-Bold="False" Font-Size="Small" Visible="True" />
                                                     <asp:Label ID="lblDepreciation" runat="server" Font-Bold="False" Font-Size="Small"
                                                        Visible="True" />
                                                    <br />
                                                     <asp:Label ID="lblFunderInterest" runat="server" Font-Bold="False" Font-Size="Small"
                                                        Visible="True" />
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                               
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <cc1:ModalPopupExtender ID="ModalPopupExtenderPassword" runat="server" BackgroundCssClass="styleModalBackground"
                                                BehaviorID="programmaticModalPopupBehavior" DynamicServicePath="" Enabled="True"
                                                PopupControlID="PnlPassword" TargetControlID="btnModal">
                                            </cc1:ModalPopupExtender>
                                            <%-- <asp:Label ID="lblPendings" runat="server" Font-Bold="False" Font-Size="Small" Visible="True" />--%>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Label ID="lblmodalerror" runat="server" />
                                                    <br />
                                                </div>
                                            </div>
                                            <asp:Button ID="btnModal" runat="server" Style="display: none" />
                                        </div>
                                    </div>
                                    </div>
                                </asp:Panel>
                                     </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <span id="lblErrorMessage" runat="server" style="color: Red; font-size: medium"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <td colspan="4" id="tdExportDtl" runat="server" visible="false"></td>
                            </div>
                        </div>
                        <div align="right">

                            <button class="css_btn_enabled" id="btnExcel" title="Pending Documents[Alt+D]" causesvalidation="false" onserverclick="btnExcel_Click" runat="server"
                                type="button" accesskey="D">
                                <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Pending <u>D</u>ocuments
                            </button>
                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                type="button" accesskey="S" validationgroup="Main">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                            </button>
                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="vsMonthLock" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                    ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            </div>
                        </div>
                    <%--</ContentTemplate>--%>
                   <%-- <Triggers>
                        <asp:PostBackTrigger ControlID="btnExcel" />
                    </Triggers>--%>
                <%--</asp:UpdatePanel>--%>
            </div>
        </div>
    </div>
</asp:Content>





