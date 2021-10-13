package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Payment;
import model.User;

public class PaymentDao {
	private Connection con;
	
	public PaymentDao(Connection con) {
		this.con = con;
	}
	
	public boolean savePayment(Payment payment){
        boolean set = false;
        try{
           String query = "insert into payment(user_id,total) values(?,?)";
           PreparedStatement pst = this.con.prepareStatement(query);
           pst.setInt(1, payment.getUser_id());
           pst.setDouble(2, payment.getTotal());         
           pst.executeUpdate();
           set = true;
           deleteCartItems(payment.getUser_id());
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
	
	public void deleteCartItems(int id) {
		try {
			String query = "delete from cart where user_id=?";
			PreparedStatement pt = this.con.prepareStatement(query);
			pt=this.con.prepareStatement(query);
			pt.setInt(1, id);
			pt.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
