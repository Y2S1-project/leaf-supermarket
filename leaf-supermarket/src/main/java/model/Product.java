package model;

public class Product implements Message{
	private int id;
	private String name;
	private double quantity;
	private double unitPrice;
	private double incrementUnit;
	private double discount;
	private String category;
	private String image;
	
	public Product() {
		
	}
	public Product(int id, String name, double quantity, double unitPrice, double incrementUnit, double discount, String category, String image) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.incrementUnit = incrementUnit;
		this.discount = discount;
		this.category = category;
		this.image = image;
	}
	public Product(String name, double quantity, double unitPrice, double incrementUnit, double discount, String category, String image) {
		super();
		this.name = name;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.incrementUnit = incrementUnit;
		this.discount = discount;
		this.category = category;
		this.image = image;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getIncrementUnit() {
		return incrementUnit;
	}
	public void setIncrementUnit(double incrementUnit) {
		this.incrementUnit = incrementUnit;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public void DisplaySuccessMessage(){
		System.out.println("Success for the product");
	}
	public void DisplayFailedMessage() {
		System.out.println("Failed for the product");
	}
}
