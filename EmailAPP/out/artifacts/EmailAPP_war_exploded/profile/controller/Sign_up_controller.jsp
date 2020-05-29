<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        String adresa = request.getParameter("adresa");
        String telefon = request.getParameter("telefon");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/email", "root", "");
            Statement stUser = con.createStatement();
            int i = stUser.executeUpdate("insert into users(username,password) values ('"+username+"',MD5('"+password+"'))");
            Statement stUserDetails = con.createStatement();
            int j = stUserDetails.executeUpdate("insert into user_details(nume,prenume,adresa,telefon) values ('"+nume+"', '"+prenume+"', NULLIF('"+adresa+"', ''), NULLIF('"+telefon+"', ''))");
            %>
            <script type="text/javascript">
                window.location.href="http://localhost:8080/intro";
            </script>
            <%
        }
        catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    %>
</body>
</html>
