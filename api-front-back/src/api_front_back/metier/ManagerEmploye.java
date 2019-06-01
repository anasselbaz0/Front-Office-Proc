package api_front_back.metier;

import api_front_back.persistance.DAOEmploye;

public class ManagerEmploye {
	
	private static DAOEmploye dao;
	
	public ManagerEmploye() {
		super();
		dao = new DAOEmploye();
	}
	
	public boolean login(String username, String password) {
		return dao.login(username, password);
	}
	
	public Employe getEmploye(String username) {
		return dao.getEmploye(username);
	}
	
	public String getProcFromIdEmp(int id) {
		return dao.getProcFromIdEmp(id);
	}
	
	public String getProcFromIdEmpNormale(int id) {
		return dao.getProcFromIdEmpNormale(id);
	}

	public int getNumeroEtape(int id) {
		return dao.getNumeroEtape(id);
	}
	
	public int getIdFromUsername(String username) {
		return dao.getIdFromUsername(username);
	}
	
	
	
}
