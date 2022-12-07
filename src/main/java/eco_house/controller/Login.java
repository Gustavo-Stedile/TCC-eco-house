package eco_house.controller;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import eco_house.model.Usuario;
import eco_house.model.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuarioDAO dao;
	
	public void init() throws ServletException {
		dao = new UsuarioDAO();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {			
		RequestDispatcher disp = req.getRequestDispatcher("/login.jsp");
		
		req.setAttribute("errorMessage", (String) req.getSession(false).getAttribute("errorMessage"));
		req.getSession(false).invalidate();
		disp.forward(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Usuario usuario = dao.retrieve(req.getParameter("email"));
		
		if (usuario == null || !usuario.getSenha().equals(req.getParameter("senha"))) {
			HttpSession session = req.getSession(true);
			session.setAttribute("errorMessage", "email ou senha incorretos");
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		HttpSession session = req.getSession(true);
		session.setAttribute("email", usuario.getEmail());
		res.sendRedirect(req.getContextPath() + "/home");
	}
}