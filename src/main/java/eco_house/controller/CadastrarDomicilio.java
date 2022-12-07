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

@WebServlet("/home/domicilio/cadastrar")
public class CadastrarDomicilio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDAO dao;
	
	public void init() throws ServletException {
		dao = new UsuarioDAO();
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
		
		Domicilio domicilio = new Domicilio(cep, cidade, bairro, rua, numero);
		
		String email = (String) req.getSession(false).getAttribute("email");
		boolean funcionou = dao.addDomicilioInto(email, domicilio);
		
		if (!funcionou) {
			RequestDispatcher disp = req.getRequestDispatcher("/status.jsp");
			req.setAttribute("isError", true);
			req.setAttribute("message", "domicílio não pode ser cadastrado");
			disp.forward(req, res);
			return;
		}
		RequestDispatcher disp = req.getRequestDispatcher("/status.jsp");
		req.setAttribute("message", "domicílio cadastrado com sucesso!");
		req.setAttribute("where", req.getContextPath() + "/home");
		disp.forward(req, res);
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/form_domicilio.jsp").forward(req, res);
	}

}
