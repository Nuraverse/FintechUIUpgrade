<%@ page language="C#" autoeventwireup="true" inherits="Index, App_Web_e3xzh3ai" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <script language="javascript" type="text/javascript">
         window.open("LoginPage.aspx", "_blank", "toolbar=no, location=no, directories=no, status=yes, menubar=no, scrollbars=yes, resizable=yes, copyhistory=yes, width=" + (screen.width) + ", height=" + (screen.height)).focus();

         //set new window as the opener to bypass alert
         window.opener = 'secondWindow';

         //close original window that was the inital opener without alert
         //window.self.close();

    </script>
    <form id="form1" runat="server">
        <div>
           
        </div>
    </form>
</body>

</html>
