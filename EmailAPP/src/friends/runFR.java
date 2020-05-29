package friends;

import randStuff.dbConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "runFR", urlPatterns = {"/runFR"})
public class runFR extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dbConnection obj_dbConn = new dbConnection();
        Connection conn = obj_dbConn.getConnection();
        String username = request.getParameter("username");
        String friend = request.getParameter("friend");
        try {
            String query1 = "select id from users where username=?";
            String query2 = "select id from users where username=?";
            PreparedStatement ps1 = conn.prepareStatement(query1);
            ps1.setString(1,username);
            PreparedStatement ps2 = conn.prepareStatement(query2);
            ps2.setString(1,friend); // friend
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next())
                username = rs1.getString(1);
            ResultSet rs2 = ps2.executeQuery();
            if(rs2.next())
                friend = rs2.getString(1);
            System.out.println(username);
            System.out.println(friend);
            String query = "insert into friends(friend_one,friend_two,status) values ('"+friend+"','"+username+"','1')";
            Statement st = conn.createStatement();
            int i = st.executeUpdate(query);
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
