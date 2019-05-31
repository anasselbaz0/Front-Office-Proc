package presentation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import metier.ManagerDemande;

@WebServlet("/suividemande")
public class SuiviDemande extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ManagerDemande md;
	
    public SuiviDemande() {
        super();
        md = new ManagerDemande();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("submit_recherche_jeton") != null) {
			String jeton = request.getParameter("jeton");
			if(jeton == null)
				request.getRequestDispatcher("/citoyen").forward(request, response);
			Document doc = md.getDemande(jeton);
			ArrayList<Object> v = new ArrayList<>(doc.values());
			request.setAttribute("processus", (String) v.get(2));
			request.setAttribute("isAccepted", (String) String.valueOf(v.get(5)));
			request.setAttribute("documents", (Document) v.get(3));
			request.getRequestDispatcher("/citoyen/suiviDemande.jsp").forward(request, response);
		}
		else request.getRequestDispatcher("/citoyen").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
