package metier;

import java.util.ArrayList;
import org.bson.Document;
import com.mongodb.client.FindIterable;
import persistance.DAODemande;

public class ManagerDemande {

	private DAODemande dao;
	
	public ManagerDemande() {
		super();
		dao = new DAODemande();
	}
	
	public boolean deposer(String cin, String processus, ArrayList<String> documents, String jeton) {
		return dao.deposer(cin, processus, documents, jeton);
	}

	public FindIterable<Document> getSomeByCIN(String cin) {
		return dao.getSomeByCIN(cin);
	}
	
	public FindIterable<Document> getSomeByProc(String proc) {
		return dao.getSomeByProc(proc);
	}

	public Document getDemande(String jeton) {
		return dao.getDemande(jeton);
	}

	/*
	 * suppression d un document existant dans la demande avec ce jeton
	 * **/
	public boolean supprimerDocument(String jeton, int ordre) {
		return dao.supprimerDocument(jeton, ordre);
	}

}
