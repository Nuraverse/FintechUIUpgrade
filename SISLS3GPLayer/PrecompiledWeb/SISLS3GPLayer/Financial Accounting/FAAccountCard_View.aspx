<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAAccountCard_View, App_Web_sravfnz4" title="Account Card" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        var btnActive_index = 0;
        var index = 0;
        function pageLoad() {
            

            tab = $find('ctl00_ContentPlaceHolder1_tcAcctSetup');

            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            
        }
        //code added to set tab focus
        function on_Change(sender, e) {
           
            fnMoveNextTab('Tab');
        }

        function fnMoveNextTab(Source_Invoker) {
            
            tab = $find('ctl00_ContentPlaceHolder1_tcAcctSetup');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            <%--var Valgrp = document.getElementById('<%=vsPricing.ClientID %>')--%>
            
            //btnSave.disabled=true;
            //    Valgrp.validationGroup = strValgrp;

            var newindex = tab.get_activeTabIndex(index);
            
            if (Source_Invoker == 'btnNextTab')
            {
               
                newindex = btnActive_index + 1;
               

            }
            else if (Source_Invoker == 'btnPrevTab')
            {

                newindex = btnActive_index - 1;
            }
            else
            {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }

            //if (newindex == tab._tabs.length - 1)
            //    btnSave.disabled = false;
            //else
            //    btnSave.disabled = true;
            if (newindex > index)
            {
                if (!fnCheckPageValidators(strValgrp, false))
                {
                    tab.set_activeTabIndex(index);
                }
                else {


                    switch (index) {

                        case 0:

                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            //if (tab._tabs[index].disabled = 'true')
                            //{
                            //    tab.set_activeTabIndex(btnActive_index + 1);
                            //    index = tab.get_activeTabIndex(index);
                            //}
                            btnActive_index = index;
                            break;
                        case 1:

                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 2:

                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                    }
                }
            }
            else
            {

                tab.set_activeTabIndex(newindex);
                index = tab.get_activeTabIndex(newindex);

            }
        }


    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>

                <div id="tab-content" class="tab-content">
                    <div class="tab-pane fade in active show" id="tab1">

                        <div>
                            <div class="row title_header">
                                <%--  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                                <%-- <div class="col-sm-11">--%>
                                <h6 class="title_name" style="margin: 0px;">
                                    <asp:Label runat="server" ID="lblHeading"></asp:Label>
                                </h6>
                                <%--</div>--%>
                            </div>
                             <div class="row">
                         <div style="display: none" class="col">

                                        <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                        <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                                    </div>
                    </div>
                            <div class="row">

                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">

                                        <UC:Suggest ID="txtDocumentNumberSearch" runat="server" class="md-form-control form-control" ServiceMethod="Getaccountcode" AutoPostBack="true"
                                            OnItem_Selected="txtDocumentNumberSearch_TextChanged" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label>
                                            <asp:Label ID="lblAcccountcode" runat="server" Text="Account Code" CssClass="styledisplaylabel"></asp:Label>
                                        </label>
                                    </div>

                                </div>


                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <UC:Suggest ID="txtdesc" runat="server" class="md-form-control form-control" ServiceMethod="Getaccountdesc" AutoPostBack="true" OnItem_Selected="txtdesc_TextChanged" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDesc" runat="server" CssClass="styledisplaylabel" Text="Account Description"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <cc1:TabContainer ID="tcAcctSetup" runat="server" Width="100%" AutoPostBack="True"
                                        CssClass="styleTabPanel" RowStyle-ForeColor="Blue" OnActiveTabChanged="tcAcctSetup_ActiveTabChanged">
                                        <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                                        <cc1:TabPanel runat="server" ID="TabPanel1" CssClass="tabpan" BackColor="Red" Width="100%">
                                            <HeaderTemplate>
                                                Asset
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <%--  </div>--%>
                                        <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                                        <cc1:TabPanel runat="server" ID="TabPanel2" CssClass="tabpan" BackColor="Red" Width="100%">
                                            <HeaderTemplate>
                                                Liability
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <%--  </div>--%>
                                        <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                                        <cc1:TabPanel runat="server" ID="TabPanel3" CssClass="tabpan" BackColor="Red" Width="100%">
                                            <HeaderTemplate>
                                                Income
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <%--  </div>--%>
                                        <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                                        <cc1:TabPanel runat="server" ID="TabPanel4" CssClass="tabpan" BackColor="Red" Width="100%">
                                            <HeaderTemplate>
                                                Expenses
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <%--  </div>--%>
                                    </cc1:TabContainer>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="gird_details" Width="100%"
                                            AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand"
                                            OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccSetId" runat="server" Text='<%# Eval("id") %>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                            CommandArgument='<%# Bind("id") %>' runat="server" CommandName="Query" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnModify" runat="server" ImageUrl="~/Images/spacer.gif"
                                                            CssClass="styleGridEdit" CommandArgument='<%# Bind("id") %>' CommandName="Modify" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="GL_CODE" HeaderText="Account Code">
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GL_Desc" HeaderText="Account Description">
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Acct_Type" HeaderText="Account Type">
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:BoundField>

                                                <asp:BoundField DataField="Line_Number" HeaderText="Line Number">
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Acct_Nature" HeaderText="Account Nature">
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <%-- <asp:BoundField DataField="SL_CODE" HeaderText="SL Code">
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                                <asp:TemplateField HeaderText="Active">
                                                    <ItemTemplate>
                                                        <asp:CheckBox Enabled="false" runat="server" ID="CbxActive" /><asp:Label ID="lblActive"
                                                            Visible="false" runat="server" Text='<%#Eval("Is_Active")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By")%>'></asp:Label>
                                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID")%>'></asp:Label>
                                                         <asp:Label ID="lblAccttype_id" Visible="false" runat="server" Text='<%# Bind("Acct_Type_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                        </asp:GridView>

                                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                    </div>
                                </div>


                            </div>




                           <%-- <div align="right">
                                <asp:Button ID="btnCreate" runat="server" class="css_btn_enabled" Text="Create"
                                    OnClick="btnCreate_Click" ToolTip="Alt+C" AccessKey="C" />


                                <asp:Button ID="btnShowAll" runat="server" Text="Show All" class="css_btn_enabled"
                                    OnClick="btnShowAll_Click" ToolTip="Alt+H" />

                            </div>--%>

                              <div align="right" >
                      <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Alt+C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                   <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                        type="button" accesskey="H" title="Alt+H">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                        
                    </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" Style="color: Red; font-size: medium"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:CustomValidator ID="CVAccountCard" runat="server" Display="None" ValidationGroup="Save"></asp:CustomValidator>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
