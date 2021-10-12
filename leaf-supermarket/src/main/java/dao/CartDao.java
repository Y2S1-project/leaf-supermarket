package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Product;

public class CartDao {
	Connection con;
	private String query=null;
	
	public CartDao(Connection con) {
        this.con = con;
	}
	
	public boolean insertProducts(Product product){
        boolean set = false;
        try{
        	String query = "insert into cart() values(?,?,?,?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, product.getName());
           pt.setDouble(2, product.getQuantity());
           pt.setDouble(3, product.getUnitPrice());
           pt.setDouble(4, product.getIncrementUnit());
           pt.setDouble(5, product.getDiscount());
           pt.setString(6, product.getCategory());
           pt.executeUpdate();
           set = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
}
