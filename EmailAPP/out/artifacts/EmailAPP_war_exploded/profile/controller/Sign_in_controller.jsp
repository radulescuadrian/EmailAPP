<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import = "model.getDataFromDB"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.loginModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj_loginBean" class="bean.loginBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_loginBean"/>
	
	<%
		String username = obj_loginBean.getUsername();
		System.out.println(username);
		System.out.println(obj_loginBean.getPassword());
		
		loginModel obj_loginModel = new loginModel();
		boolean flag = obj_loginModel.check_username(obj_loginBean);
		getDataFromDB obj_getDataFromDB = new getDataFromDB();
		String prenume = obj_getDataFromDB.getPrenume(username);
		String nume = obj_getDataFromDB.getNume(username);
		if(flag) {
			session.setAttribute("user_session", obj_loginBean);
			session.setAttribute("user",username);
			session.setAttribute("prenume",prenume);
			session.setAttribute("nume",nume);
	%>
			<script type="text/javascript">
				window.location.href="http://localhost:8080/mailuri";
			</script>
	<%	
		} else {
			session.setAttribute("login_message", "Username sau parola gresita!");
	%>
			<script type="text/javascript">
				window.location.href="http://localhost:8080/login";
			</script>
	<%		
	  }
	%>
	
</body>
</html>