<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<style>
.tales {
  width: 100%;
}
.carousel-inner{
  width:100%;
  max-height: 600px;
}
.carousel-caption {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
}

</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
  
    <title>Title</title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class ="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class ="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx"><span><img alt="LogoErrLoad" src="Images/logo3.jpg" height="30" /></span>MyTitle</a>
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
                            <li><a href="#">Register</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

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
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Join Us Today</a></p>
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
