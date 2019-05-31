package presentation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import persistance.DAODemande;

@WebServlet("/chef")
public class ChefDeDivision extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAODemande dao;
	
    public ChefDeDivision() {
        super();
        dao = new DAODemande();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		if((boolean) session.getAttribute("isConnected")) {
			if(request.getParameter("accept") != null) {
				String jeton = request.getParameter("jeton");
				switch(request.getParameter("action")) {
					case "accepter": {
						if(dao.accepter(jeton))
							request.getRequestDispatcher("/chef").forward(request, response);
						else
							request.getRequestDispatcher("/chef/chefFail.jsp").forward(request, response);
						break;
					}
					case "archiver": {
						if(dao.archiver(jeton))
							request.getRequestDispatcher("/chef").forward(request, response);
						else
							request.getRequestDispatcher("/chef/chefFail.jsp").forward(request, response);
						break;
					}
				}
			}
			else request.getRequestDispatcher("/chef/chefDeDivision.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/login").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
