<%@ page import="bean.loginBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proiect EAP</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Sen&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Intro/intro.css">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="pointer-events: none; cursor: default;">Proiect EAP</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <%
                    loginBean obj_loginBean = (loginBean) session.getAttribute("user_session");
                    if (obj_loginBean==null) {
                %>
                        <li><a href="../signup">Inregistrare <i class="fa fa-user-plus"></i></i></a></li>
                        <li><a href="../login">Login <i class="fa fa-user"></i></a></li>
                <%
                    }
                    else {
                %>
                        <li><a href="/mailuri">Enter Site <i class="fa fa-user"></i></a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div id="content">
                <h1>Aplicatie de email-uri</h1>
                <hr>
            </div>
            <h2 style="text-align: center;">Radulescu Adrian</h2>
            <h3 style="text-align: center;">Grupa 253</h3>
            <hr>
            <div style="padding-top: 20px; text-align: center;">
                <h3>creare cont si logare <input type="checkbox" checked style="pointer-events: none; cursor: default;"></h3>
                <h3>imprietenirea intre useri <input type="checkbox" checked style="pointer-events: none; cursor: default;"></h3>
                <h3>trimitere/stergere mailuri <input type="checkbox"  style="pointer-events: none; cursor: default;"></h3>
                <h3>forward email-uri la prieteni <input type="checkbox"  style="pointer-events: none; cursor: default;"></h3>
                <h3>RAPOARTE: cui i-ai dat cele mai multe mail-uri, ziua cea mai aglomerata etc. <input type="checkbox"  style="pointer-events: none; cursor: default;"></h3>
                <h3>adaugarea de mai multe email-uri in cont si schimbarea intre acestea <input type="checkbox"  style="pointer-events: none; cursor: default;"></h3>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
