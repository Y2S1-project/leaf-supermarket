package model;

public class Cart extends Product{
	private int quantity;
		
	public Cart() {
		
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
