package api_front_back.metier;

import java.util.ArrayList;

import api_front_back.persistance.DAOProcessus;

public class ManagerProcessus {

	private DAOProcessus dao;
	
	public ManagerProcessus() {
		super();
		dao = new DAOProcessus();
	}
	
	public ArrayList<Processus> getAll() {
		return dao.getAll();
	}

}
