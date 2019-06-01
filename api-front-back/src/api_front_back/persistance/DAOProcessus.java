package api_front_back.persistance;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import api_front_back.metier.Processus;

public class DAOProcessus {

	private Connexion con;

	public DAOProcessus() {
		super();
		this.con = new Connexion();
	}

	public ArrayList<Processus> getAll() {
		ResultSet rs = con.executeQ("select * from processus");
		try {
			ArrayList<Processus> list = new ArrayList<>();
			while(rs.next()) {
				Processus p = new Processus(
					rs.getInt(1),
					rs.getString(2),
					rs.getInt(3)
				);
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ArrayList<Processus>();
	}

}
