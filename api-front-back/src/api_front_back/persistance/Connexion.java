package api_front_back.persistance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connexion {

	private Connection con;
	
	public Connexion() {
		super();
		con = getConnexion();
	}
	
	public Connection getConnexion() {
		try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver charged.");
            String url = "jdbc:mysql://localhost:3306/db_processus";
            Connection con = DriverManager.getConnection(url,"root","");
            System.out.println("Connected.");
            return con;
        } catch (ClassNotFoundException ex) {
            System.out.println("ClassNotFoundException....");
            return null;
        } catch (SQLException ex) {
            System.out.println("SQLException....");
            return null;
        }
	}
	
	public ResultSet executeQ(String q) {
    	try {
			if (con != null) {
				Statement st;
				st = con.createStatement();
				ResultSet rs = st.executeQuery(q);
				return rs;
			}
			else
				return null;
		} catch (SQLException e) {
			System.out.println("msg : ResultSet=null");
			return null;
		}	
    }

}
