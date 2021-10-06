package dao;
import model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDao(Connection con) {
		this.con = con;
		
	}
	
	public boolean saveUser(User user){
        boolean set = false;
        try{
           String query = "insert into reg_user(user_name,email,password) values(?,?,MD5(?))";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, user.getName());
           pt.setString(2, user.getEmail());
           pt.setString(3, user.getPassword());
           pt.executeUpdate();
           set = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
	
	public User userLogin(String email, String password) {
		User user=null;
		try {
			query="select * from reg_user where email=? and password=MD5(?) ";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs=pst.executeQuery();
			if (rs.next()) {
				user=new User ();
				user.setId(rs.getInt("user_id"));
				user.setName(rs.getString("user_name"));
				user.setEmail(rs.getString("email"));	
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}
	
	public User adminLogin(String email, String password) {
		User user=null;
		try {
			query="select * from admin where email=? and password=MD5(?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs=pst.executeQuery();
			if (rs.next()) {
				user=new User ();
				user.setId(rs.getInt("user_id"));
				user.setName(rs.getString("user_name"));
				user.setEmail(rs.getString("email"));	
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}
		
}
