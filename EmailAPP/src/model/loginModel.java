package model;

import bean.loginBean;
import randStuff.dbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginModel {
	
	public boolean check_username(loginBean obj_loginBean) {
		boolean flag = false;
		dbConnection obj_dbConnection = new dbConnection();
		Connection con = obj_dbConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String query = "select * from users where username=? and password=MD5(?)";
			ps = con.prepareStatement(query);
			ps.setString(1, obj_loginBean.getUsername());
			ps.setString(2, obj_loginBean.getPassword());
			rs=ps.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return flag;
	}
	
}
