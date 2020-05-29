<%@ page import="bean.loginBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Proiect EAP - Rapoarte</title>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Sen&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/Dashboard/rapoarte/rapoarte.css">
</head>
<body class="home">
<%
    loginBean objLoginBean = (loginBean)session.getAttribute("user_session");
    if(objLoginBean == null) {
        System.out.println(123);
%>
<script type = "text/javascript">
    window.location.href="../intro";
</script>
<%
    }
%>
<div class="container-fluid display-table">
    <div class="row display-table-row">
        <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
            <div class="logo">
                <h2 style="color: white;">EMAIL</h2>
            </div>
            <div class="navi">
                <ul>
                    <li><a href="../mailuri"><i class="fa fa-envelope" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Mail-uri</span></a></li>
                    <li><a href="../prieteni"><i class="fa fa-users" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Prieteni</span></a></li>
                    <li class="active"><a href="#"><i class="fa fa-flag" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Rapoarte</span></a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 col-sm-11 display-table-cell v-align">
            <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
            <div class="row">
                <header>
                    <div class="col-md-7">
                        <nav class="navbar-default pull-left">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                        </nav>
                    </div>
                    <div class="col-md-5">
                        <div class="header-rightside">
                            <ul class="list-inline header-top pull-right">
                                <li class="hidden-xs"><a href="../profile/controller/Sign_out_controller.jsp" class="signout">Sign Out</a></li>
                                <li class="hidden-xs"><a href="#" class="view btn-sm active">Profil</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <div style="display: flex;">
                                            <i class="fa fa-user"></i>
                                            <div style="display: flex;">
                                                <p style="margin: -2px 6px; font-weight: 700;"><%out.print(session.getAttribute("user"));%></p>
                                                <b class="caret" style="margin-top: 7px;"></b>
                                            </div>
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu" style="width: 191px; left: -100px;">
                                        <li>
                                            <div class="navbar-content">
                                                <span><%out.print(session.getAttribute("prenume"));out.print(" ");out.print(session.getAttribute("nume"));%></span>
                                                <p class="text-muted small"><%out.print(session.getAttribute("user"));%>@MAIL.com</p>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </header>
            </div>
            <div class="user-dashboard">
                <h1>Mail-uri</h1>
                <div class="row">
                    <div class="col-md-8 col-sm-6 col-xs-12 gutter">
                        <div class="reports-1">
                            CUI I-AI DAT CELE MAI MULTE MAILURI
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 gutter">
                        <div class="reports-1">
                            ZIUA CEA MAI PRODUCTIVA
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="offcanvas"]').click(function(){
            $("#navigation").toggleClass("hidden-xs");
        });
    });
</script>
</body>
</html>

