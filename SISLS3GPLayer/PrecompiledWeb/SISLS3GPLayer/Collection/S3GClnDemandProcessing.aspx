<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnDemandProcessing, App_Web_wom33hv0" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Demand Processing" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%--<asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Demand Type"
                            Width="100%">--%>
                        <cc1:TabContainer ID="tcDemandType" runat="server" AutoPostBack="true" OnActiveTabChanged="tcDemandType_ActiveTabChanged"
                            ActiveTabIndex="0" CssClass="styleTabPanel">
                            <cc1:TabPanel ID="tpRegular" runat="server" BackColor="Red" CssClass="tabpan" HeaderText="Regular Demand">
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tpAsonDate" runat="server" HeaderText="Current Status">
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                        <tr id="trFrequency" runat="server"></tr>
                        <div class="row">

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFrequency" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlDemandMonth_SelectedIndexChanged"
                                        Visible="true" class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFrequency" runat="server" CssClass="styleReqFieldLabel" Text="Frequency"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDemandMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDemandMonth_SelectedIndexChanged"
                                        Visible="true" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvDemandMonth" runat="server" ControlToValidate="ddlDemandMonth"
                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Demand Month"
                                            InitialValue="0" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDemandMonth" runat="server" CssClass="styleReqFieldLabel" Text="Demand Month">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" Visible="true" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select Line of Business"
                                            Display="Dynamic" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>

                            <tr id="trAsondate" runat="server"></tr>

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCutoffDate" runat="server" Enabled="false"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgCutoffDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Enabled="false" Format="dd/MM/yyyy" TargetControlID="txtCutoffDate"
                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgCutoffDate"
                                        ID="CalendarExtender1">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvCutoffDate" runat="server" ErrorMessage="Enter the As on Date"
                                            ValidationGroup="Save" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtCutoffDate"
                                            Enabled="false" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <cc1:FilteredTextBoxExtender ID="fltCutoffDate" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                        TargetControlID="txtCutoffDate" ValidChars=" -,/" runat="server" Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="As on Date" ID="lblCutoffDate" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>













                        </div>
                        <div align="right">
                            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Save" runat="server"
                                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                            </button>
                        </div>
                        <%-- </asp:Panel>--%>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel runat="server" ID="pnlDemandProcess" CssClass="stylePanel" GroupingText="Demand Processing">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ShowFooter="true" runat="server" AutoGenerateColumns="false" Width="100%"
                                            ID="grvDemandProcess" HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Center"
                                            RowStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" OnRowDataBound="grvDemandProcess_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sellect All" SortExpression="Sellect All">
                                                    <HeaderTemplate>
                                                        <table>
                                                            <thead>
                                                                <tr>
                                                                    <td>
                                                                        <span id="spnAll">Select All</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" Checked="true"></asp:CheckBox>
                                                                    </td>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <HeaderStyle Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectBranch" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "SelectLocation")))%> ' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Branch">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                                        <asp:Label ID="lblProcess" runat="server" Text="0" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblGrandTotal" runat="server" Text="Total" MaxLength="3"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle Width="30%" />
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="LocationId" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBranch_Id" runat="server" Text='<%# Bind("Location_id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="No of Accounts">
                                                    <ItemTemplate>
                                                        <asp:Label Style="text-align: right" Width="100%" ID="lblNoofAccounts" runat="server"
                                                            Text='<%# Bind("No_of_Accounts") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="txtNoofAcc" runat="server" Style="text-align: right;"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle Width="15%" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Arrear Due">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblArrearsAmount" runat="server" Text='<%# Bind("Arrears_Amount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="txtArrearsAmount" runat="server" Style="text-align: right"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle Width="15%" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Current Due">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Current_Due") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="txtAmount" runat="server" Style="text-align: right"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <HeaderStyle Width="15%" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Assign DC">
                                        <HeaderTemplate>
                                            <table width="100%">
                                                <tr>
                                                    <td align="center">
                                                        Assign DC
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:CheckBox ID="chkAll_DC" runat="server"></asp:CheckBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkAssignDC" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="10%" />
                                    </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="15%" />
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnProcess" title="Process" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="true" onserverclick="btnProcess_Click" runat="server"
                        type="button">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>P</u>rocess
                    </button>
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <%-- <asp:Button ID="btnAssignDC" runat="server" CausesValidation="false" CssClass="grid_btn"
                        Text="Assign DC" OnClick="btnAssignDC_Click" />--%>
                    <button class="css_btn_enabled" id="btnAssignDC" title="Assign DC" causesvalidation="true" onserverclick="btnAssignDC_Click" runat="server"
                        type="button">
                        <i class="fa fa-at" aria-hidden="true"></i>&emsp;<u>A</u>ssign DC
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="CVDemandProcessing" runat="server" Display="None" ValidationGroup="Save"></asp:CustomValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsDemandProcess" runat="server" CssClass="styleSummaryStyle"
                            HeaderText="Correct the following validation(s):" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="Save" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--<script type="text/javascript" language="javascript">
        var tab ;

        function pageLoad() {
            tab = $find('ctl00_ContentPlaceHolder1_tcDemandType');
            var querymode = location.search.split("qsMode=");
            if (querymode.length > 1) {
                if (querymode[1].length > 1) {
                    querymode = querymode[1].split("&");
                    querymode = querymode[0];
                }
                else {
                    querymode = querymode[1];
                }
                if (querymode != 'Q') {
                    tab.add_activeTabChanged(on_Change);
                    var newindex = tab.get_activeTabIndex(index);
                }
            }
            }
            
            var index = 0;
            function on_Change(sender, e) {
                index = tab.get_activeTabIndex(index);
                if (index == 0) {
                    document.getElementById("trFrequency").style.display = 'block';
                    document.getElementById("trAsondate").style.display = 'none';
                }
                if (index == 1) {
                    document.getElementById("trFrequency").style.display = 'none';
                    document.getElementById("trAsondate").style.display = 'block';
                }
            }
        
    </script>--%>
</asp:Content>
