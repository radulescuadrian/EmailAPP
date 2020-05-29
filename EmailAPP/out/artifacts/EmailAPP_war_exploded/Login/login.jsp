<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Proiect EAP - LOGIN</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Sen&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Login/login.css">
</head>
<body>
	<a class="btn btn-danger" href="../intro" role="button" style="margin: 10px;">Inapoi</a>
    <div class="container h-100 sign-up">
        <div class="row h-100 justify-content-center align-items-center">
            <form class="col-12" action="../profile/controller/Sign_in_controller.jsp" method="post">
                <h1>Logare</h1>
                <hr>
                <div class="form-group">
                    <label for="formGroupExampleInput">Username</label>
                    <input required type="text" class="form-control" id="formGroupExampleInput" placeholder="Username" name="username">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Parola</label>
                    <input required type="password" class="form-control" id="formGroupExampleInput2" placeholder="Parola" name="password">
                </div>
                <%
	            	String message = (String)session.getAttribute("login_message");
	            	if(message!=null){ %>
	            		<p style="text-align: center; color: red;"><% out.println(message); %> </p>
	            	<%  session.removeAttribute("login_message");
	            	}
            	%>
                <div class="col text-center">
                    <input class="btn btn-primary" type="submit" value="Submit" style="margin-top: 10px;">
                </div>
            </form>
            
        </div>
        </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>