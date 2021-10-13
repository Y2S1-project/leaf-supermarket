package model;

public class Payment implements Message {
	private int payment_id;
	private int user_id;
	private double total;
	private String payment_date;
	
	public Payment() {

	}

	public Payment(int payment_id, int user_id, double total, String payment_date) {
		this.payment_id = payment_id;
		this.user_id = user_id;
		this.total = total;
		this.payment_date = payment_date;
	}
	
	public Payment(int user_id, double total) {
		this.user_id = user_id;
		this.total = total;
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public void DisplaySuccessMessage() {
		System.out.println("Successfully made payment");	
	}

	@Override
	public void DisplayFailedMessage() {
		System.out.println("Payment failed");		
	}
}
