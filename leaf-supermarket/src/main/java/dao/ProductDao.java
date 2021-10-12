package dao;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.*;
import java.sql.Connection;

public class ProductDao {
	Connection con ;
	private String query;
	
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
			if(id == 10) {
				query="select * from product where category = 'Personal Care'";
			}
			if(id == 11) {
				query="select * from product where category = 'Housholed'";
			}
			if(id == 12) {
				query="select * from product where category = 'Personal Safty'";
			}
			PreparedStatement pt = this.con.prepareStatement(query);
			ResultSet rs=pt.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("product_id"));
				row.setName(rs.getString("product_name"));
				row.setQuantity(rs.getDouble("quantity"));
				row.setUnitPrice(rs.getDouble("unit_price"));
				row.setImage(rs.getString("image"));
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
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> products = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String query = "select * from product where product_id=?";
                    PreparedStatement pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("product_id"));
                        row.setName(rs.getString("product_name"));
                        row.setCategory(rs.getString("category"));
                        row.setUnitPrice(rs.getDouble("unit_price")*item.getQuantity());
                        row.setIncrementUnit(rs.getDouble("increment_unit"));
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select unit_price from product where product_id=?";
                    PreparedStatement pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("unit_price") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
	
	public boolean insertToCart(Product product){
        boolean set = false;
        try{
           String query = "insert into cart(user_id, product_id, total) values(?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, product.getUserId());
           pt.setInt(2, product.getId());
           pt.setDouble(3, product.getUnitPrice());
           pt.executeUpdate();
           set = true;
           
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
	
	public List<Product> displayCartProducts(){
		List<Product> products = new ArrayList<Product>();
		try {
			String query="select * from cart c, product p where c.product_id = p.product_id";
			PreparedStatement pt = this.con.prepareStatement(query);
			ResultSet rs=pt.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setName(rs.getString("product_name"));
				row.setCategory(rs.getString("category"));
				row.setUnitPrice(rs.getDouble("unit_price"));
				row.setIncrementUnit(rs.getDouble("increment_unit"));
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(((Product) products).getCategory());
		return products;
		
	}


	
}