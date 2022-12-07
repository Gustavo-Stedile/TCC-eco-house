package eco_house.controller;

import java.io.IOException;

import eco_house.model.Domicilio;
import eco_house.model.Usuario;
import eco_house.model.UsuarioDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/home/settings")
public class AlterarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDAO dao;
	
	public void init() throws ServletException {
		dao = new UsuarioDAO();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			session = req.getSession(true);
			session.setAttribute("errorMessage", "você deve se logar");
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}	

		String email = (String) session.getAttribute("email");
		Usuario usuario = dao.retrieve(email);
		
		RequestDispatcher disp = req.getRequestDispatcher("/alterar_usuario.jsp");
		req.removeAttribute("usuario");
		req.setAttribute("usuario", usuario);
		disp.forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			session = req.getSession(true);
			session.setAttribute("errorMessage", "você deve se logar");
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}	
		
		String cep = req.getParameter("cep");
		String cidade = req.getParameter("cidade");
		String bairro = req.getParameter("bairro");
		String rua = req.getParameter("rua");
		String numero = req.getParameter("numero");
		
		
		dao.updateDomicilioFrom((String) session.getAttribute("email"), new Domicilio(cep, cidade, bairro, rua, numero));
		
		res.sendRedirect(req.getContextPath() + "/home");
	}

}
