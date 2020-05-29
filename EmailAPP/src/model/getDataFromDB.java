package model;

import randStuff.dbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class getDataFromDB {

    public String getPrenume(String user) {
        String prenume = "";
        dbConnection obj_dbConnection = new dbConnection();
        Connection con = obj_dbConnection.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select user_details.prenume from user_details join users on users.id=user_details.id where users.username=?";
            ps = con.prepareStatement(query);
            ps.setString(1,user);
            rs = ps.executeQuery();
            rs.next();
            prenume = rs.getString(1);
        }
        catch (Exception ex) {
            System.out.println(ex);
        }
        return prenume;
    }
    public String getNume(String user) {
        String nume = "";
        dbConnection obj_dbConnection = new dbConnection();
        Connection con = obj_dbConnection.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select user_details.nume from user_details join users on users.id=user_details.id where users.username=?";
            ps = con.prepareStatement(query);
            ps.setString(1,user);
            rs = ps.executeQuery();
            rs.next();
            nume = rs.getString(1);
        }
        catch (Exception ex) {
            System.out.println(ex);
        }
        return nume;
    }
}
