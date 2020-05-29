package randStuff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "checkAvailability", urlPatterns = {"/checkAvailability"})
public class checkAvailability extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if(username != null && username.trim().length() > 0) {
            Connection conn = null;
            String sql = "select * from users where username=?";
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/email","root","");
                PreparedStatement st = conn.prepareStatement(sql);
                st.setString(1, username);
                rs = st.executeQuery();
                if(rs.next()) {
                    out.println("<span style=\"color: red;\">username-ul este deja folosit</span>");
                }
                else {
                    out.println("<span style=\"color: green;\">username-ul este valabil</span>");
                }
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}