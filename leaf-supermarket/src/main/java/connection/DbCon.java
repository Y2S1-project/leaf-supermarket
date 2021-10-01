package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection=null;

	private DbCon() {
	
	}
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(connection==null) {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/leaf_db","root","");
			System.out.println("Connected");
		}
		return connection;
	}
}
