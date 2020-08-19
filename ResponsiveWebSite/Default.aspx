<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<style>


</style>
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
                            <li class="active"><a href="Default.aspx">Home</a></li>
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
                            <li><a href="SignIn.aspx">Sign In</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!--Navbar -->
            <!--Carousel -->
            <div class="container" style="width: 100%;">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="Images/carousel1.jpg" alt="PH1" style="width: 100%;" class: "tales" />
                            <div class="carousel-caption">
                                <h2>Inovatie</h2>
                                <p><a class="btn btn-lg btn-primary" href="SignIn.aspx" role="button">Join Us Today</a></p>
                            </div>
                        </div>

                        <div class="item">
                            <img src="Images/carousel2.jpg" alt="PH2" style="width: 100%;" class: "tales" />
                            <div class="carousel-caption">
                                <h2>Munca</h2>
                            </div>
                        </div>

                        <div class="item">
                            <img src="Images/carousel3.jpg" alt="PH3" style="width: 100%;" class: "tales" />
                            <div class="carousel-caption">
                              <h2>Talent</h2>
                            </div>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
             </div>
            <!--Carousel -->
            <br/>
             <!--Middle-content -->
                <div class="container center">
                    <div class="row">
                        <div class="col-lg-4">
                            <img class="img-circle" src="Images/innovation.jpg" alt="thumb01" width="140" height="140" />
                            <h2>Innovation</h2>
                            <p>Workplace creativity concerns the cognitive and behavioral processes applied when attempting to generate novel ideas. Workplace innovation concerns the processes applied when attempting to implement new ideas. Specifically, innovation involves some combination of problem/opportunity identification, the introduction, adoption or modification of new ideas germane to organizational needs, the promotion of these ideas, and the practical implementation of these ideas.</p>
                            <p><a class="btn btn-default" href="#" role="button">View &raquo</a></p>
                        </div>
                        <div class="col-lg-4">
                            <img class="img-circle" src="Images/work.jpg" alt="thumb01" width="140" height="140" />
                            <h2>Work</h2>
                            <p>There is always the danger that we may just do the work for the sake of the work. This is where the respect and the love and the devotion come in - that we do it to God, to Christ, and that's why we try to do it as beautifully as possible.</p>
                            <p><a class="btn btn-default" href="#" role="button">View &raquo</a></p>
                        </div>
                        <div class="col-lg-4">
                            <img class="img-circle" src="Images/talent.jpg" alt="thumb01" width="140" height="140" />
                            <h2>Talent</h2>
                            <p>Talent—when I use the word, I mean it as the rate at which you get better with effort. The rate at which you get better at soccer is your soccer talent. The rate at which you get better at math is your math talent. You know, given that you are putting forth a certain amount of effort. And I absolutely believe—and not everyone does, but I think most people do—that there are differences in talent among us: that we are not all equally talented” (Duckworth, 2016)</p>
                            <p><a class="btn btn-default" href="#" role="button">View &raquo</a></p>
                        </div>
                    </div>
                </div>
             <!--Middle-content -->
            <hr/>
          <!--Footer -->
            <footer>
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
