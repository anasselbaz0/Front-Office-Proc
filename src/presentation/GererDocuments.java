package presentation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.ManagerDemande;

@WebServlet("/gererdocuments")
public class GererDocuments extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private ManagerDemande md;   
	
    public GererDocuments() {
        super();
        md = new ManagerDemande();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("ordre")!=null && request.getParameter("action")!=null && request.getParameter("jeton")!=null) {
			int ordre = Integer.parseInt(request.getParameter("ordre"));
			String action = request.getParameter("action");
			String jeton = request.getParameter("jeton");
			switch(action) {
				case "supprimer": {
					if(md.supprimerDocument(jeton, ordre)) {
						request.setAttribute("jeton", jeton);
						request.setAttribute("submit_recherche_jeton", "Rechercher");
						request.getRequestDispatcher("/suividemande").forward(request, response);
					} else
						request.getRequestDispatcher("/citoyen/citoyenFail.jsp").forward(request, response);
					break;
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
