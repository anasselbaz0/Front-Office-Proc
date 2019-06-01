package api_front_back.persistance;

import java.sql.ResultSet;
import java.sql.SQLException;

import api_front_back.metier.Employe;

public class DAOEmploye {

	private Connexion con;

	public DAOEmploye() {
		super();
		this.con = new Connexion();
	}

	public Employe getEmploye(String username) {
		String req = "select * from employes where username='"+username+"'";
		try {
			ResultSet rs = con.executeQ(req);
			while(rs.next()) {
				Employe emp = new Employe(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4)
				);
				return emp;
			}
		} catch (NullPointerException e) {
			System.out.println("msg: Exeption DAO emp -> getEmp : null");
		} catch (SQLException e) {
			System.out.println("msg: Exeption DAO emp -> getEmp : sql");
		}
		return new Employe();
	}

	public String getProcFromIdEmp(int id) {
		ResultSet rs = con.executeQ("select nom from processus where employes_id="+String.valueOf(id));
		try {
			while(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("err daoEmp");
		}
		return null;
	}
	
	public String getProcFromIdEmpNormale(int id) {
		ResultSet rs = con.executeQ("select processus_id from etapes where employes_id="+String.valueOf(id));
		try {
			while(rs.next()) {
				int procId =  rs.getInt(1);
				ResultSet rs1 = con.executeQ("select nom from processus where id="+String.valueOf(procId));
				try {
					while(rs1.next()) {
						return  rs1.getString(1);
					}
				} catch (SQLException e) {
					System.out.println("err daoEmp");
				}
				return null;
			}
		} catch (SQLException e) {
			System.out.println("err daoEmp");
		}
		return null;
	}

	public boolean login(String username, String password) {
		String sql = "select * from employes where username='"+username+"' and password='"+password+"'";
		ResultSet rs = con.executeQ(sql);
		try {
			while(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("err daoEmp");
			return false;
		}
		return false;
	}

	public int getIdFromUsername(String username) {
		ResultSet rs = con.executeQ("select id from employes where username='"+username+"'");
		try {
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("err daoEmp");
		}
		return 0;
	}

	public int getNumeroEtape(int id) {
		ResultSet rs = con.executeQ("select numero from etapes where employes_id="+String.valueOf(id));
		try {
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("err daoEmp");
		}
		return 0;
	}
	
	
	
}
