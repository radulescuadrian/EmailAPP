package friends;

import randStuff.dbConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "getFR", urlPatterns = {"/getFR"})
public class getFR extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dbConnection obj_dbConn = new dbConnection();
        Connection conn = obj_dbConn.getConnection();
        String username = request.getParameter("username");

        PrintWriter out = response.getWriter();
        try {
            String query = "select users.username from users join friends on users.id=friends.friend_two where friends.friend_one in (select id from users where username like ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            Boolean t=false;
            while (rs.next()) {
                String queryCheck = "select status from friends where friend_one like (select id from users where username=?) and friend_two like (select id from users where username=?)";
                PreparedStatement pscheck = conn.prepareStatement(queryCheck);
                pscheck.setString(1, username);
                pscheck.setString(2, rs.getString(1));
                ResultSet rscheck = pscheck.executeQuery();
                if(!rscheck.next() || !rscheck.getString(1).equals("2")){
                    out.println("<tr>");
                    out.println("<td><p style=\"padding: 10px 0px; margin-bottom: 0px;\">" + rs.getString(1) + "</p></td>");
                    //if
                    out.println("<td><button class=\"BUTONACC buttonn btn-success btn-sm\" style=\"margin: 0px 10px;\">accepta cererea</button></td>");
                    out.println("</tr>");
                    t = true;
                }
            }
            if(t==false) {
                out.println("<tr>");
                out.println("<td>Momentan nu este nici-o cerere</td>");
                out.println("</tr>");
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
