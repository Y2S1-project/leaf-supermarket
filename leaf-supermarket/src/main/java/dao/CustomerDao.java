package dao;
import model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	
	public CustomerDao(Connection con) {
	
		this.con = con;
		
	}
	
	


	
	public Customer getSingleUser(int id) {
		Customer p  = null;
		try {
		String query = "select * from reg_user where user_id=?";
		PreparedStatement pt = this.con.prepareStatement(query);
		pt=this.con.prepareStatement(query);
		pt.setInt(1, id);
		ResultSet rs=pt.executeQuery();
		while(rs.next()) {
			int pid = rs.getInt("user_id");
			String name = rs.getString("user_name");
			String password = rs.getString("password");
			String email = rs.getString("email");
			int phone = rs.getInt("telephone");
			String address = rs.getString("address");
			
			
			p = new Customer(pid,name,email,password, phone, address);
			
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}
	public boolean editUserInfo(Customer p) {
		boolean test = false;
		try {
			String query = "update reg_user set user_name=?,email=?, password=MD5(?) where user_id=?";
			PreparedStatement pt = this.con.prepareStatement(query);
			pt=this.con.prepareStatement(query);
			pt.setString(1,p.getName());
			pt.setString(2,p.getEmail());
			pt.setString(3,p.getPassword());
			pt.setInt(4,p.getId());
			pt.executeUpdate();
			test = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return test;
	}
	public void deleteUser(int id) {
		try {
			String query = "delete from reg_user where user_id=?";
			PreparedStatement pt = this.con.prepareStatement(query);
			pt=this.con.prepareStatement(query);
			pt.setInt(1, id);
			pt.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
