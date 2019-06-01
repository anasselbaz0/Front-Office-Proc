package api_front_back.metier;

public class Processus {

	private int id;
	private String nom;
	private int employes_id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public int getEmployes_id() {
		return employes_id;
	}

	public void setEmployes_id(int employes_id) {
		this.employes_id = employes_id;
	}

	public Processus(int id, String nom, int employes_id) {
		super();
		this.id = id;
		this.nom = nom;
		this.employes_id = employes_id;
	}

	public Processus() {
		super();
	}

}
