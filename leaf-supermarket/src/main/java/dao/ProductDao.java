package dao;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.*;
import java.sql.Connection;

public class ProductDao {
	Connection con ;
	
	public ProductDao(Connection con) {
	        this.con = con;
	}
	
	public boolean saveProduct(Product product){
        boolean set = false;
        try{
           String query = "insert into product(product_name,quantity,unit_price,increment_unit,discount_rate,category) values(?,?,?,?,?,?)";
           
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
	
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		try {
			String query="select * from product";
			PreparedStatement pt = this.con.prepareStatement(query);
			ResultSet rs=pt.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("product_id"));
				row.setName(rs.getString("product_name"));
				row.setQuantity(rs.getDouble("quantity"));
				row.setUnitPrice(rs.getDouble("unit_price"));
				row.setIncrementUnit(rs.getDouble("increment_unit"));
				row.setDiscount(rs.getDouble("discount_rate"));
				row.setCategory(rs.getString("category"));
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public Product getSingleProduct(int id) {
		Product p  = null;
		try {
			String query = "select * from product where product_id=?";
			PreparedStatement pt = this.con.prepareStatement(query);
			pt=this.con.prepareStatement(query);
			pt.setInt(1, id);
			ResultSet rs=pt.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("product_id");
				String name = rs.getString("product_name");
				double quantity = rs.getDouble("quantity");
				double unitPrice = rs.getDouble("unit_price");
				double incrementUnit = rs.getDouble("increment_unit");
				double discount = rs.getDouble("discount_rate");
				String category = rs.getString("category");
				p = new Product(pid,name,quantity,unitPrice,incrementUnit,discount,category);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public List<Product> getCategoryProducts(int id){
		List<Product> products = new ArrayList<Product>();
		String query = null;
		try {
			if(id == 1) {
				query="select * from product where category = 'Vegetable'";
			}
			if(id == 2) {
				query="select * from product where category = 'Fruit'";
			}
			if(id == 3) {
				query="select * from product where category = 'Bakery'";
			}
			if(id == 4) {
				query="select * from product where category = 'Frozen Food'";
			}
			if(id == 5) {
				query="select * from product where category = 'Beverages'";
			}
			if(id == 6) {
				query="select * from product where category = 'Dairy'";
			}
			if(id == 7) {
				query="select * from product where category = 'Pharmacy'";
			}
			if(id == 8) {
				query="select * from product where category = 'Baby Products'";
			}
			if(id == 9) {
				query="select * from product where category = 'Food Cupboard'";
			}
			PreparedStatement pt = this.con.prepareStatement(query);
			ResultSet rs=pt.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("product_id"));
				row.setName(rs.getString("product_name"));
				row.setQuantity(rs.getDouble("quantity"));
				row.setUnitPrice(rs.getDouble("unit_price"));
				row.setIncrementUnit(rs.getDouble("increment_unit"));
				row.setDiscount(rs.getDouble("discount_rate"));
				row.setCategory(rs.getString("category"));
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public boolean editProductInfo(Product p) {
		boolean test = false;
		try {
			String query = "update product set product_name=?,quantity=?,unit_price=?,increment_unit=?,discount_rate=?,category=? where product_id=?";
			PreparedStatement pt = this.con.prepareStatement(query);
			pt=this.con.prepareStatement(query);
			pt.setString(1,p.getName());
			pt.setDouble(2,p.getQuantity());
			pt.setDouble(3,p.getUnitPrice());
			pt.setDouble(4,p.getIncrementUnit());
			pt.setDouble(5,p.getDiscount());
			pt.setString(6,p.getCategory());
			pt.setInt(7,p.getId());
			pt.executeUpdate();
			test = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return test;
	}
	
	public void deleteProduct(int id) {
		try {
			String query = "delete from product where product_id=?";
			PreparedStatement pt = this.con.prepareStatement(query);
			pt=this.con.prepareStatement(query);
			pt.setInt(1, id);
			pt.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}