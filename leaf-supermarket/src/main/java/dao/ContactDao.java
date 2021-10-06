package dao;
import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactDao {
	Connection con ;
	
	public ContactDao(Connection con) {
	    this.con = con;
	}
	
	public boolean saveContact(Contact contact){
        boolean set = false;
        try{
           String query = "insert into contact_us(name,email,type,telephone,message) values(?,?,?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, contact.getName());
           pt.setString(2, contact.getEmail());
           pt.setString(3, contact.getType());
           pt.setInt(4, contact.getTelepehone());
           pt.setString(5, contact.getMessage());
           pt.executeUpdate();
           set = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
}
