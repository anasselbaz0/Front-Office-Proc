package presentation;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.ManagerDemande;

@WebServlet("/deposerdemande")
public class DeposerDemande extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ManagerDemande managerDemande;
	
    public DeposerDemande() {
        super();
        managerDemande = new ManagerDemande();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("submit_deposer") != null) {
			int nbrDocuments = Integer.parseInt(request.getParameter("nbrDocuments"));
			request.setAttribute("nbrDoc", nbrDocuments);
			request.getRequestDispatcher("/citoyen/deposerDemande.jsp").forward(request, response);
		}
		if(request.getParameter("submit_deposer_finale") != null) {
			String cin = (String)request.getSession().getAttribute("cin");
			int nbrDocuments = Integer.parseInt(request.getParameter("nbrDocuments"));
			ArrayList<String> documents = new ArrayList<>();
			for(int i=1; i<=nbrDocuments; i++) {
				documents.add(request.getParameter("document"+String.valueOf(i)));
			}
			String processus = request.getParameter("processus");
			String jeton = generateJeton(cin, processus);
			request.getSession().setAttribute("jeton", jeton);
			if(managerDemande.deposer(cin, processus, documents, jeton)) {
				request.getRequestDispatcher("/citoyen/citoyenSuccess.jsp").forward(request, response);
			} else
				request.getRequestDispatcher("/citoyen/citoyenFail.jsp").forward(request, response);
		}
		
	}
	
	private String generateJeton(String cin, String processus) {
		String s1 = cin.substring(0, 4);
		String s2 = processus.substring(0, 4).toUpperCase().replaceAll("A", "zz");
		String s3 = processus.substring(processus.length()-4, processus.length()).toLowerCase().replaceAll("e", "NS");
		String mot = generateRandomString(3)+s2+generateRandomString(3)+s1+generateRandomString(3)+s3+generateRandomString(3);
        String jeton = "";
        for(int i = mot.length() - 1; i >= 0; i--)
        {
            jeton = jeton + mot.charAt(i);
        }
		return jeton;
	}
	
	private String generateRandomString(int length) {
		    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		    String pass = "";
		    for(int x=0;x<length;x++) {
		       int i = (int)Math.floor(Math.random() * 62);
		       pass += chars.charAt(i);
		    }
		    return pass;
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
