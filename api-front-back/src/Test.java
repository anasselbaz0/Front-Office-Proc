import api_front_back.metier.Employe;
import api_front_back.metier.ManagerEmploye;

public class Test {

	public static void main(String[] args) {

		ManagerEmploye me = new ManagerEmploye();
		Employe emp = me.getEmploye("jira");
		System.out.println(emp.getPassword());
		
	}

}
