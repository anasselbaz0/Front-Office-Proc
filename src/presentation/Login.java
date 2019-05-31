package presentation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import api_front_back.metier.Employe;
import api_front_back.metier.Citoyen;
import api_front_back.metier.ManagerCitoyen;
import api_front_back.metier.ManagerEmploye;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String cin;
	
    public Login() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.setAttribute("isConnected", false);
		if (request.getParameter("submit_employe") == null && request.getParameter("submit_citoyen") == null) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		if (request.getParameter("submit_employe") != null) {
			username = request.getParameter("username");
			password = request.getParameter("password");
			if(username == null) username = "";
			if(password == null) password = "";
			ManagerEmploye me = new ManagerEmploye();
			Employe emp = me.getEmploye(username);
			if(me.login(username, password)) {
				session.setAttribute("isConnected", true);
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				switch(emp.getRole()) {
					case "EMPLOYE": {
						request.getRequestDispatcher("/employe").forward(request, response);
						break;
					}
					case "CHEF": {
						request.getRequestDispatcher("/chef").forward(request, response);
						break;
					}
				}
			}
			else request.getRequestDispatcher("/login").forward(request, response);
		}
		if (request.getParameter("submit_citoyen") != null) {
			cin = request.getParameter("cin");
			if(cin == null) cin = "";
			ManagerCitoyen mc = new ManagerCitoyen();
			if(!cin.equals("")) {
				Citoyen cito = new Citoyen();
				cito.setCin(cin);
				if(mc.addCitoyen(cito)) {
					session.setAttribute("isConnected", true);
					session.setAttribute("cin", cito.getCin());
					request.getRequestDispatcher("/citoyen").forward(request, response);
				}
			}
			else request.getRequestDispatcher("/login").forward(request, response);
		}

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
