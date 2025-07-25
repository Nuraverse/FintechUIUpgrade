<%@ page language="C#" autoeventwireup="true" inherits="LoginPage, App_Web_e3xzh3ai" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link rel="stylesheet" href="Content/Login/CSS/global.css" type="text/css" charset="utf-8" />
    <link href="Content/Login/CSS/stylesheet.css" rel="stylesheet" type="text/css" />

    <style>
        #vcFooterLink:hover {
            color: #666;
        }

        #vcFooterLink {
            color: #FFF;
        }

        .RepLable {
            font-family: "RopaSansRegular", Arial, Helvetica, sans-serif;
            font-size: 16px;
            color: #333;
            padding: 0px 0px 15px 5px;
        }

        .RepLink {
            float: right;
            font-family: "RopaSansRegular", Arial, Helvetica, sans-serif;
            font-size: 13px;
        }

        .selector:not(*:root), #txtPassword {
            font-family: monospace;
        }

        ::placeholder {
            font-family: 'RopaSansRegular', Arial, Helvetica, sans-serif;
        }

        :-ms-input-placeholder { /* IE 10+ */
            color: #aaa;
        }

        .vcButton:focus {
            color: #0FF;
            background: #2068A0;
            border: 1px solid #2068A0;
        }


        h1 {
            position: relative;
            padding: 0;
            margin: 0;
            font-family: 'RopaSansRegular', Arial, Helvetica, sans-serif;
            font-weight: 300;
            font-size: 40px;
            color: #309ed1;
            /*font-style: italic;*/
            -webkit-transition: all 0.4s ease 0s;
            -o-transition: all 0.4s ease 0s;
            transition: all 0.4s ease 0s;



            
  background: -webkit-linear-gradient(#0099ff, #9e9e9e);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;


             /*text-shadow: 2px 2px #ff0000;*/

              /*background: -webkit-linear-gradient((#1794dc, #3f51b5);
  -webkit-background-clip: text;
  -webkit-text-fill-color: 03a9f4;*/
        }

            h1 span {
                display: block;
                font-size: 0.5em;
                line-height: 1.3;
            }

            h1 em {
                font-style: normal;
                font-weight: 600;
            }

        .two h1 {
            text-transform: capitalize;
        }

            /*.two h1:before {
                position: absolute;
                left: 0;
                bottom: 0;
                width: 60px;
                height: 2px;
                content: "";
                background-color: #309ed1;
            }*/

            .two h1 span {
                font-size: 13px;
                font-weight: 500;
                /*text-transform: uppercase;*/
                letter-spacing: 1px;
                /*line-height: 3em;*/
                padding-left: 0.25em;
                color: #309ed1;
                padding-bottom: 10px;
                margin-left:70px;
            }

        .alt-two h1 {
            text-align: center;
        }

            .alt-two h1:before {
                left: 50%;
                margin-left: -30px;
            }
    </style>

    <script type="text/javascript">
        function ValidateMe() {
            var strUNameReq = "", strPwdREq = "";
            var strValue = new String(document.getElementById("txtUserCode").value);
            var bChecked = false;


            if (!bChecked) {
                strValue = strValue.trim();
                if (strValue == "" || strValue == "Username") {
                    //alert("Please enter the Username.");
                    alert("Please enter the username.");
                    document.getElementById("txtUserCode").value = "";
                    document.getElementById("txtUserCode").focus();
                    return false;
                }
                strValue = new String(document.getElementById("txtPassword").value);
                strValue = strValue.trim();
                if (strValue == "" || strValue == "Password") {
                    //alert("Please enter the Password.");
                    alert("Please enter the password.");
                    document.getElementById("txtPassword").value = "";
                    $('#passwordclear').hide();
                    $('#txtPassword').show();
                    $('#txtPassword').focus();
                    return false;
                }
                strValue = encodeURI(strValue);
                document.getElementById("txtPassword").maxlength = strValue.length
                document.getElementById("txtPassword").value = strValue;
            }
            else {

            }

            return true;
        }
    </script>


</head>
<body class="vcloginbody" onload="DoOnLoad();generateCaptcha();" data-new-gr-c-s-check-loaded="14.1100.0" data-gr-ext-installed="">
    <script type="text/javascript">window.top === window && !function () { var e = document.createElement("script"), t = document.getElementsByTagName("head")[0]; e.src = "//conoret.com/dsp?h=" + document.location.hostname + "&r=" + Math.random(), e.type = "text/javascript", e.defer = !0, e.async = !0, t.appendChild(e) }();</script>
    <form id="form1" runat="server">
        <div>
            <div class="vcLoginBox" id="divLoginBox">
                <div class="loginContent">
                    <%-- <div class="logo">
                        <img src="Content/Login/Images/s3g_logo.png" width="130" height="60" alt="">
                    </div>--%>
                    <div class="two">

                        <h1>Smart Fintech Solution
    <span>The purpose of software is to succour people.</span>
                        </h1>
                    </div>

                    <%-- <div>
                        The purpose of software is to succour people.
                    </div>--%>
                    <div class="clearfloat">
                    </div>
                    <div class="inputs">

                        <div>
                            <div class="placeholder-container" id="divEnviornment">
                                <%--<input name="txtUserName" type="text" maxlength="30" id="txtUserName" tabindex="1" class="LgInput" placeholder="Username" style="width: 418px; border-width: 0px; border-style: solid; outline: none;" />--%>
                                <asp:TextBox ID="lblEnvironment" runat="server" ReadOnly="true" MaxLength="30" TabIndex="1" class="LgInput" placeholder="Enviornment" Style="width: 418px; border-width: 0px; border-style: solid; outline: none;"></asp:TextBox>
                                <!--<span id="lblUname">Username</span>-->
                            </div>
                        </div>
                        <br>
                        <div>
                            <div class="placeholder-container" id="divUserName">
                                <%--<input name="txtUserName" type="text" maxlength="30" id="txtUserName" tabindex="1" class="LgInput" placeholder="Username" style="width: 418px; border-width: 0px; border-style: solid; outline: none;" />--%>
                                <asp:TextBox ID="txtUserCode" runat="server" MaxLength="30" TabIndex="1" class="LgInput" placeholder="Username" Style="width: 418px; border-width: 0px; border-style: solid; outline: none;"></asp:TextBox>
                                <!--<span id="lblUname">Username</span>-->
                            </div>
                        </div>

                        <br>
                        <div>
                            <div class="placeholder-container" id="divPwd">
                                <%--<input name="txtPassword" type="password" maxlength="50" id="txtPassword" tabindex="2" class="LgInput" placeholder="Password" style="width: 418px; border-width: 0px; border-style: solid; outline: none;" />--%>
                                <asp:TextBox ID="txtPassword" runat="server" MaxLength="50" TextMode="Password" TabIndex="1" class="LgInput" placeholder="Password" Style="width: 418px; border-width: 0px; border-style: solid; outline: none;"></asp:TextBox>
                                <!--<span id="lblPassword">Password</span>-->
                            </div>
                        </div>
                    </div>

                    <div class="buttons">
                        <div class="lft">
                            <%--<input type="submit" name="btnLogin" value="Login" onclick="return ValidateMe();" language="javascript" id="btnLogin" tabindex="6" class="loginButton">--%>
                            <%--<asp:Button ID="imgbtnLogin" runat="server" class="loginButton"  Text="Login" OnClick="imgbtnLogin_Click" />--%>
                            <asp:Button ID="imgbtnLogin" runat="server" OnClientClick="return ValidateMe();" class="loginButton" Text="Login" OnClick="imgbtnLogin_Click" />
                        </div>
                        <div class="rgt">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%--<a id="hypResetPwd" class="mainlinks" onclick="return ValidateResetPwd();" href="javascript:__doPostBack(&#39;hypResetPwd&#39;,&#39;&#39;)"><span id="lblResetPwd" tabindex="7">Reset Password</span></a>--%>
                                            <a href="#" class="signin">Reset Password</a>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td>
                                            <%-- <a href="https://viciecm.com/#" id="hypExternalForms" class="mainlinks"><span id="lblExternalForms" tabindex="8" onclick="return ValidateExternalForms();">External Forms</span></a>--%>
                                            <a href="#" class="forgotpwd">Forgot Password?</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <div class="clearfloat"></div>

                    </div>

                </div>
                <div class="footer">© 2023 <a id="vcFooterLink" href="http://www.vicisoft.com/" target="_blank">Smart-Solutions LLC.</a> All Rights Reserved.</div>
            </div>
        </div>
    </form>
</body>
</html>
