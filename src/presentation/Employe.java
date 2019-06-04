package presentation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import persistance.DAODemande;

@WebServlet("/employe")
public class Employe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DAODemande dao;
	
    public Employe() {
        super();
        dao = new DAODemande();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((boolean) session.getAttribute("isConnected")) {
			if(request.getParameter("accept") != null) {
				String jeton = request.getParameter("jeton");
				switch(request.getParameter("action")) {
					case "traiter": {
						if(dao.traiter(jeton))
							request.getRequestDispatcher("/employe/employe.jsp").forward(request, response);
						else
							request.getRequestDispatcher("/chef/employeFail.jsp").forward(request, response);
						break;
					}
				}
			}
			else request.getRequestDispatcher("/employe/employe.jsp").forward(request, response);
		}
			
		else
			request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	

}
