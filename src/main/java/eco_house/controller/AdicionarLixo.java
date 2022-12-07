package eco_house.controller;

import java.io.IOException;
import java.time.LocalDate;

import eco_house.model.Lixo;
import eco_house.model.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/home/rejeitos/adicionar")
public class AdicionarLixo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDAO dao;
	
	public void init() throws ServletException {
		dao = new UsuarioDAO();
	}
	
    public AdicionarLixo() {
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			session = req.getSession(true);
			session.setAttribute("errorMessage", "você deve se logar");
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}	
		
		String tipo = req.getParameter("tipo");
		String nome = req.getParameter("nome");
		int qtd = Integer.parseInt(req.getParameter("qtd"));
		LocalDate dataProducao = LocalDate.parse(req.getParameter("data-producao"));
		
		
		boolean funcionou = dao.addLixoInto((String) session.getAttribute("email"), new Lixo(tipo, nome, dataProducao, qtd));
		
		req.setAttribute("where", req.getContextPath() + "/home");
		RequestDispatcher disp = req.getRequestDispatcher("/status.jsp");
		if (!funcionou) {
			req.setAttribute("isError", true);
			req.setAttribute("message", "lixo não pôde ser adicionado");
			disp.forward(req, res);
			return;
		}
//		req.setAttribute("isError", false);
//		req.setAttribute("message", "lixo adicionado com sucesso");
//		disp.forward(req, res);
		res.sendRedirect(req.getContextPath() + "/home");
	}

}
