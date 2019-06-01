package api_front_back.metier;

public class Citoyen {

	private int id;
	private String cin;
	
	public Citoyen(int id, String cin) {
		super();
		this.id = id;
		this.cin = cin;
	}
	
	public Citoyen() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}
	
	
	
	
}
