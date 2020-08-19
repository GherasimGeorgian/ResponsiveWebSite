<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

 
<!DOCTYPE html>

<style>
   

</style>
<html xmlns="http://www.w3.org/1999/xhtml" runat="server">
<head runat="server">
 
    
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <title>Sign Up</title>

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
                            <li class="active"><a href="SignUp.aspx">Sign Up</a></li>
                            <li><a href="SignIn.aspx">Sign In</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!--Navbar -->

            <!--SignUp -->
            <div class="center-page">
                <label class="col-xs-11">Username</label>
                <div class="col-xs-11">
                     <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                </div>

                <label class="col-xs-11">Password</label>
                <div class="col-xs-11">
                     <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>

                <label class="col-xs-11">Confirm Password</label>
                <div class="col-xs-11">
                     <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                </div>

                <label class="col-xs-11">Name</label>
                <div class="col-xs-11">
                     <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                </div>

                <label class="col-xs-11">Email</label>
                <div class="col-xs-11">
                     <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                </div>

                <div class="col-xs-11 space-vert">
                     <asp:Button ID="btnSignUp" runat="server" class="btn btn-success" Text="Sign Up" OnClick="btnSignUp_Click" />
                     <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDataBaseConnectionString1 %>" DeleteCommand="DELETE FROM [Users] WHERE [UId] = @UId" InsertCommand="INSERT INTO [Users] ([Username], [Password], [Email], [Name]) VALUES (@Username, @Password, @Email, @Name)" ProviderName="<%$ ConnectionStrings:MyDataBaseConnectionString1.ProviderName %>" SelectCommand="SELECT [UId], [Username], [Password], [Email], [Name] FROM [Users]" UpdateCommand="UPDATE [Users] SET [Username] = @Username, [Password] = @Password, [Email] = @Email, [Name] = @Name WHERE [UId] = @UId">
                    <DeleteParameters>
                        <asp:Parameter Name="UId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="UId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
            <!--SignUp -->

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
