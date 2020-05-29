<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="#">
    <meta charset="ISO-8859-1">
    <title>Proiect EAP - SignUp</title>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Sen&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../SignUp/signup.css">
</head>
<body>
<a class="btn btn-danger" href="../intro" role="button" style="margin: 10px;">Inapoi</a>
<div class="container h-100 sign-up">
    <div class="row h-100 justify-content-center align-items-center">
        <form class="col-12" action="../profile/controller/Sign_up_controller.jsp" method="post" id="signup">
            <h1>Inregistrare</h1>
            <hr>
            <div class="form-group">
                <label for="nume">Nume</label>
                <input required type="text" class="form-control" id="nume" placeholder="Nume" name="nume">
            </div>
            <div class="form-group">
                <label for="prenume">Prenume</label>
                <input required type="text" class="form-control" id="prenume" placeholder="Prenume" name="prenume">
            </div>
            <div class="form-group">
                <label for="adresa">Adresa</label>
                <input type="text" class="form-control" id="adresa" placeholder="Adresa" name="adresa">
            </div>
            <div class="form-group">
                <label for="telefon">Telefon</label>
                <input type="text" class="form-control" id="telefon" placeholder="Nr. Telefon" name="telefon">
            </div>
            <hr>
            <div class="form-group">
                <label for="username">Username</label>
                <div style="display: flex;">
                    <input required type="text" minlength="4" class="form-control" id="username" placeholder="Username" name="username">
                    <div id="loading"></div>
                </div>
                <div id="status"></div>
            </div>
            <div class="form-group">
                <label for="parola">Parola</label>
                <input required type="password" minlength="4" class="form-control" id="parola" placeholder="Parola" name="password">
            </div>
            <div class="col text-center">
                <input class="btn btn-primary" type="submit" value="Submit" style="margin-top: 10px;">
            </div>
        </form>

    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('#username').keyup(function() {
        var username = $('#username').val();
        $('#loading').html('<img src="https://gifimage.net/wp-content/uploads/2017/09/ajax-loading-gif-transparent-background-2.gif" style="width: 25px;">');
        if (username != '') {
            $.post('/checkAvailability', {username: username}, function (data) {
                $('#loading').html('');
                $('#status').html(data);
            });
        }
        else {
            $('#loading').html('');
            $('#status').html('');
        }
    });
</script>
</body>
</html>