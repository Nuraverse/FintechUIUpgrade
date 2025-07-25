<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GLoanAdSysJournal, App_Web_523fo0sd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <asp:UpdatePanel ID="UpdatePanel2" runat="server">

                <ContentTemplate>

                    <div id="tab-content" class="tab-content">
                        <div class="tab-pane fade in active show" id="tab1">
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
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" ValidationGroup="Header"
                                            runat="server" class="md-form-control form-control">
                                        </asp:DropDownList>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server"
                                                Text="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtSJVNo" Enabled="false" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMJVNO" runat="server"
                                                Text="Sys JV Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" ValidationGroup="Header"
                                            runat="server" AutoPostBack="True"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server"
                                                Text="Location"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtSJVDate" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgSJVDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                            OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            Format="dd/MM/yyyy" PopupButtonID="imgSJVDate" TargetControlID="txtSJVDate">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMJVDate" runat="server"
                                                Text="Sys JV Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtNarration"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label1" runat="server"
                                                Text="Narration"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">

                                        <asp:GridView runat="server" CellPadding="4" CellSpacing="2" ShowFooter="false" AllowPaging="false"
                                            ID="grvSysJournal" Width="98%" RowStyle-Wrap="false"
                                            AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField DataField="Lob_Desc" HeaderText="Line of Business" />
                                                <asp:BoundField DataField="Loc_Desc" HeaderText="Branch" />
                                                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                                                <asp:BoundField DataField="Reference_Number" ItemStyle-Wrap="false" HeaderText="A/c No." />
                                                <asp:BoundField DataField="Sub_Reference_Number" ItemStyle-Wrap="false" Visible="false" HeaderText="Sub A/c No." />
                                                <asp:BoundField DataField="ValueDate" ItemStyle-Wrap="false" HeaderText="Value Date" />
                                                <%--<asp:BoundField DataField="TxnType"   ItemStyle-Wrap="false" HeaderText="Txn Type" />--%>
                                                <asp:BoundField DataField="GLAcc" ItemStyle-Wrap="false" HeaderText="GL A/c" />
                                                <asp:BoundField DataField="SLAcc" HeaderText="SL A/c" />
                                                <asp:BoundField DataField="CashFlw_Desc" HeaderText="Cash Flow Description" />
                                                <asp:BoundField DataField="TxnAmount" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" HeaderText="Txn Amount" />
                                                <asp:BoundField DataField="TxnType" HeaderStyle-Width="25px" ItemStyle-Wrap="false" HeaderText="Txn Type" />
                                                <asp:BoundField DataField="Occurance" ItemStyle-HorizontalAlign="Right" Visible="false" HeaderText="Occurance" />
                                                <asp:BoundField DataField="Dim2" HeaderText="Dim2" />



                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <div class="row" style="float: right; margin-top: 5px;">
                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" runat="server"
                                    type="button" accesskey="S" validationgroup="Header" enabled="false">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                                    type="button" accesskey="L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                    type="button" accesskey="X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Label ID="lblErrorMessage" runat="server"
                                        CssClass="styleMandatoryLabel"></asp:Label>
                                </div>
                            </div>
                            </div>
                        </div>
             </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
</asp:Content>


