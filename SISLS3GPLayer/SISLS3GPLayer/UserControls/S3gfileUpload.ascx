<%@ Control Language="C#" AutoEventWireup="true" CodeFile="S3GFileUpload.ascx.cs" Inherits="S3GFileUpload" %>

<script language="javascript" type="text/javascript">

    function getfile(objFileupload, objtxtFilePath, hidFilePath) {
        objFileupload.click();
        if (objFileupload.value == "") {
            hidFilePath.value = objtxtFilePath.value;
        }
        else {
            hidFilePath.value = objFileupload.value;
        }
    }

</script>

<div>
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left: 0px!important; padding-right: 0px !important;">
            <input type="file" runat="server" runat="server" id="fileupload" style="display: none" /></td> 
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left: 0px!important; padding-right: 0px !important;">
            <asp:TextBox ID="txtFilePath" ReadOnly runat="server"></asp:TextBox>
            <asp:HiddenField ID="hidFilePath" runat="server" />
            <asp:Button ID="btnBrowse" Text="Browse" runat="server" />
        </div>
    </div>
</div>

