package eco_house.controller;

import java.io.IOException;

import eco_house.model.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/home/rejeitos/remover")
public class RemoverLixo extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDAO dao;

	public void init() throws ServletException {
		dao = new UsuarioDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			session = req.getSession(true);
			session.setAttribute("errorMessage", "você deve se logar");
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}	
				
		
		String email = (String) session.getAttribute("email");
		int id = Integer.parseInt(req.getParameter("id"));
		boolean funcionou = dao.removerLixoFrom(email, id);
		
		if (!funcionou) {
			RequestDispatcher disp = req.getRequestDispatcher("/status.jsp");
			req.setAttribute("isError", true);
			req.setAttribute("message", "lixo não pôde ser removido");
			disp.forward(req, res);
			return;
		}
//		RequestDispatcher disp = req.getRequestDispatcher("/removido_com_sucesso.jsp");
//		req.setAttribute("isError", false);
//		req.setAttribute("message", "lixo removido com sucesso");
//		req.setAttribute("where", req.getContextPath() + "/home");
//		disp.forward(req, res);
		res.sendRedirect(req.getContextPath() + "/home");
	
	}

}
