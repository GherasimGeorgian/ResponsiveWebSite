﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <title>Title</title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
               <!--Navbar -->
            <nav class ="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class ="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx"><span><img alt="LogoErrLoad" src="Images/logo3.jpg" height="30" /></span> AllForYou</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-header">Men</li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Shirts</a></li>
                                    <li><a href="#">Pants</a></li>
                                    <li><a href="#">Denims</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li class="dropdown-header">Woman</li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Top</a></li>
                                    <li><a href="#">Leggings</a></li>
                                    <li><a href="#">Denims</a></li>
                                </ul>
                            </li>
                            <li><a href="SignUp.aspx">Sign Up</a></li>
                            <li class="active"><a href="SignIn.aspx">Sign In</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!--Navbar -->
             <br/>
             <!--SignInStart -->
            <div class="continer">
                <div class="form-horizontal">
                    <h2 style="margin-left:40px">Login</h2>
                    <hr/>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="UserName"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" CssClass="text-danger" runat="server" ErrorMessage="The username filed is required" ControlToValidate="UserName"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                     <div class="form-group">
                        <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" CssClass="text-danger" runat="server" ErrorMessage="The password filed is required" ControlToValidate="Password"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                      <div class="col-md-2"> </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                            <asp:Label ID="Label3" runat="server" CssClass=" control-label" Text="Remember me?"></asp:Label>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-md-2"> </div>
                        <div class="col-md-6">
                            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-default" OnClick="Button1_Click" />
                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/SignUp.aspx">Sign Up</asp:LinkButton>
                      </div>
                    </div>


                     <div class="form-group">
                        <div class="col-md-2"> </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="lbForgotPass" runat="server" PostBackUrl="~/ForgotPassword.aspx">Forgot Password...</asp:LinkButton>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-2"> </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblError" CssClass="text-danger" runat="server"></asp:Label>
                        </div>
                    </div>

                </div>
            </div>

            <!--SignInStop  -->

         <!--Footer -->
            <footer class="footer-pos">
                <div class="container">
                    <p class="pull-right"><a href="#">Back to top</a></p>
                    <p>&copy; 2020 Geo &middot; <a href="Default.aspx">Home</a>&middot; <a href="#">About</a>&middot; <a href="#">Contact</a>&middot; <a href="#">Products</a></p>
                </div>
            </footer>
          <!--Footer -->

            </div>
    </form>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
