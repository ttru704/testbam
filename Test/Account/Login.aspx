<%@ Page Title="Log in" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Test.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title>Welcome to BAM</title>

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="css/animate.css">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="../documentation/Design/Login Page/Style.css">
    <!--Bam icon-->
    <link rel="shortcut icon" type="image/x-icon" href="../production/images/icon.ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
    <form runat="server">
        <div class="container">
            <div class="top">
                <h1 id="title" class="hidden">Welcome to <span id="logo">BAM&nbsp; </span></h1>

            </div>
            <div class="login-box animated fadeInUp">
                <div class="box-header">
                    <h2>Log In</h2>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                </div>
                <label for="username">Username</label>
                <br />

                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The email field is required." />

                <br />
                <label for="password">Password</label>
                <br />
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />




                <br />




                <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" BackColor="#73879C" ForeColor="White" />


                <div class="checkbox">
                    <asp:CheckBox runat="server" ID="RememberMe" />

                    <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                </div>



            </div>
        </div>
    </form>
</body>




