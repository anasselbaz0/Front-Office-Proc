package api_front_back.persistance;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import api_front_back.metier.Citoyen;

public class DAOCitoyen {

	public boolean addCitoyen(Citoyen cito) {
		Connexion con = new Connexion();
		Connection c = con.getConnexion();
		try {
			Statement st = c.createStatement();
			st.execute("insert into citoyens(cin) values('"+cito.getCin()+"')");
			return true;
		} catch (SQLException e) {
			System.out.println("Erreur ajout citoyen");
			return false;
		}
		
	}


}
