package model;

public class Contact implements Message{
		String type;
		String name;
		String email;
		int telepehone;
		String message;
		
		public Contact(String type, String name, String email, int telepehone, String message) {
			super();
			this.type = type;
			this.name = name;
			this.email = email;
			this.telepehone = telepehone;
			this.message = message;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getTelepehone() {
			return telepehone;
		}
		public void setTelepehone(int telepehone) {
			this.telepehone = telepehone;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public void DisplaySuccessMessage(){
			System.out.println("Success for the contact us form");
		}
		public void DisplayFailedMessage() {
			System.out.println("Failed for the contact us form");
		}

}
