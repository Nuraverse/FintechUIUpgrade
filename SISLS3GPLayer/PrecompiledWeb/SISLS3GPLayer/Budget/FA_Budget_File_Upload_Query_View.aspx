<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FA_Budget_File_Upload_Query_View, App_Web_rj0nx3uf" title="S3G - Budjet File Upload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function fnConfirmCancel() {

            if (confirm('Do you want to Exit?')) {
                return true;
            }
            else
                return false;
        }


    </script>

    <script type="text/javascript">
        function openModal() {
            $('#copyProfileModal').modal('show');
        }
    </script>

    <div id="tab-content" class="tab-content">
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="File Upload - Query" ID="lblHeading"> </asp:Label>
                </h6>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div id="divLocationCatDetails" runat="server">
                    <asp:Panel Visible="true" runat="server" ID="pnlFileUploadQuery" GroupingText="Upload Details"
                        CssClass="stylePanel">
                        <asp:UpdatePanel ID="upLocationdetails" runat="server">
                            <ContentTemplate>
                                <div class="row">

                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtFinYear" runat="server" Enabled="false" class="md-form-control form-control login_form_content_input"></asp:TextBox>

                                         
                                            <label class="tess">
                                                <asp:Label ID="lblFinyear" runat="server" Text="Financial Year"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtItemHeader" runat="server" Enabled="false" class="md-form-control form-control login_form_content_input"></asp:TextBox>

                                            <label class="tess">
                                                <asp:Label ID="lblItemHeader" runat="server"  Text="Item Header"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtAccountNature" runat="server" Enabled="false" class="md-form-control form-control login_form_content_input"></asp:TextBox>

                                            <label class="tess">
                                                <asp:Label ID="Label1" runat="server"  Text="Account Nature"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                </div>

                                <div class="row">

                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtActivity" runat="server" Enabled="false" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                            <label class="tess">
                                                <asp:Label ID="lblActivity" runat="server"  Text="Activity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                </div>

                                <asp:Label ID="lblErr" runat="server"></asp:Label>
                                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </asp:Panel>

                    <asp:Panel GroupingText="Upload Summary" ID="pnlSummary" runat="server" CssClass="stylePanel" Width="100%">
                        <div class="gird">
                            <asp:GridView ID="grvUploadSummary" runat="server" CssClass="styleInfoLabel" AutoGenerateColumns="false"
                                ToolTip="Summary Details" EmptyDataText="No Records Found"
                                ShowFooter="true" Width="100%">
                                <Columns>

                                    <asp:TemplateField HeaderText="SNo." HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Particulars" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Eval("particulars")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFProgram_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="30%"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left"  />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="FY1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Eval("fy1")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFProgram_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Width="15%"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FY2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Eval("fy2")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFProgram_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Width="15%"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FY3">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Eval("fy3")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFProgram_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Width="15%"></ItemStyle>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="FY4">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Eval("fy4")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFProgram_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Width="15%"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FY5" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate >
                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Eval("fy5")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFProgram_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Width="15%"></ItemStyle>
                                    </asp:TemplateField>



                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </div>

    <div align="right" class="fixed_btn">

          <button class="css_btn_enabled" id="btnMonthExport"
            runat="server" onserverclick="btnExport_ServerClick" 
            type="button" causesvalidation="false" accesskey="O" title="Download,Alt+O"> 
            <i class="fa fa-download" aria-hidden="true"></i>&emsp;D<u>o</u>wnload Monthwise Data
        </button>

        <button class="css_btn_enabled" id="btnCreate"
            runat="server" onserverclick="btnExit_ServerClick"  onclick="if(fnConfirmCancel())"
            type="button" causesvalidation="false" accesskey="X" title="Create,Alt+X"> 
            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;E<u>x</u>it
        </button>
    </div>

</asp:Content>




