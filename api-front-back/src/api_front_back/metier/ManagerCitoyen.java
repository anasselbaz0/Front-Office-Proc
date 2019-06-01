package api_front_back.metier;

import api_front_back.persistance.DAOCitoyen;

public class ManagerCitoyen {

	private DAOCitoyen dao;
	
	public ManagerCitoyen() {
		super();
		this.dao = new DAOCitoyen();
	}

	public boolean addCitoyen(Citoyen cito) {
		if(dao.addCitoyen(cito)) return true;
		else return false;
	}

}