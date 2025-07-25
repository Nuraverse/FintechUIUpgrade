<%@ page title="" language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" inherits="Common_GetLOV, App_Web_3y5trygh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ACT" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/LOVPageNavigator.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    function popup(strVal,strVal2,strControl,strControl3)
    {
        opener.window.document.getElementById(strControl).value=strVal;
        opener.window.document.getElementById(strControl3).value=strVal2;
        opener.window.document.getElementById(strControl).focus();
        window.close();
    }
    function ScreenClose()
    {        
        window.close();
    }
    </script>

    <div>
        <div>
        <div class="row">
                    <asp:Label ID="lblHeaderText" runat="server"></asp:Label>
                </div>

             <div class="row">
                    <asp:HiddenField ID="hdnQuery" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                </div>
            </div>
                
        <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div class="gird">
                    <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="false" CssClass="gird_details"
                        HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="gvList_RowDataBound" ShowHeader="true" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Code">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Customer Code" ToolTip="Sort By Customer Code"
                                        CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                    <asp:TextBox ID="txtHeaderSearch1" runat="server" AutoCompleteType="None" AutoPostBack="true"
                                         OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                    <ACT:FilteredTextBoxExtender ID="txtExtHeaderSearch1" runat="server" TargetControlID="txtHeaderSearch1"
                                        ValidChars="- /" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                        Enabled="True">
                                    </ACT:FilteredTextBoxExtender>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<% # Bind("ID") %>' Visible="false"></asp:Label>
                                    <asp:LinkButton ID="lbId" runat="server" Text='<% # Bind("Code") %>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID") %>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Customer Name" ToolTip="Sort By Customer Name"
                                        CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                    <asp:TextBox ID="txtHeaderSearch2" runat="server" AutoCompleteType="None" AutoPostBack="true"
                                         OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                    <ACT:FilteredTextBoxExtender ID="txtExtHeaderSearch2" runat="server" TargetControlID="txtHeaderSearch2"
                                        ValidChars="- /" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                        Enabled="True">
                                    </ACT:FilteredTextBoxExtender>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbName" runat="server" Text='<% # Bind("Name") %>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID") %>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="AliceBlue" />
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                        <HeaderStyle CssClass="styleGridHeader" />
                    </asp:GridView>
                      <uc1:PageNavigator ID="ucLOVPageNavigater" runat="server" />
                      </div>
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    

                  </div>
            </div>
               
    </div>
      <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row" style="float: right; margin-top: 5px;">
                         <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                       <asp:Button ID="btnClose" runat="server" Text="Cancel" CssClass="grid_btn" AccessKey="M" ToolTip="Alt+M" OnClientClick="ScreenClose();" />
            </div>
                    </div>
          </div>
        </div>
</asp:Content>
