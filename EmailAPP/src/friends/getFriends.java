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

@WebServlet(name = "getFriends", urlPatterns = {"/getFriends"})
public class getFriends extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        dbConnection obj_dbconn = new dbConnection();
        Connection conn = obj_dbconn.getConnection();
        ResultSet rs = null;
        PrintWriter out = response.getWriter();
        try {
            String query = "select id from users where username=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,username);
            rs = ps.executeQuery();
            if(rs.next()) {
                String query2 = "select users.username from users join friends where users.id=friends.friend_two and friends.friend_one=? and friends.status='2'";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                ps2.setString(1,rs.getString(1));
                ResultSet rs2 = ps2.executeQuery();
                while(rs2.next()) {
                    out.println("<tr>");
                    out.println("<td class=\"FR\"><p style=\"padding: 10px 0px; margin-bottom: 0px;\">"+rs2.getString(1)+"</p></td>");
                    out.println("</tr>");
                }
            }
        }
        catch (Exception ex) {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
