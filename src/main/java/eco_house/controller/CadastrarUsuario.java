package eco_house.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import eco_house.model.Usuario;
import eco_house.model.UsuarioDAO;


@MultipartConfig
@WebServlet("/signin")
public class CadastrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuarioDAO dao;
	
	public void init() throws ServletException {
		dao = new UsuarioDAO();
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String nome = req.getParameter("nome");
		String telefone = req.getParameter("telefone");
		String senha = req.getParameter("senha");
		String confirmarSenha = req.getParameter("confirmar-senha");
		
		if (!senha.equals(confirmarSenha)) {
			RequestDispatcher disp = req.getRequestDispatcher("/status.jsp");
			req.setAttribute("isError", true);
			req.setAttribute("where", req.getContextPath() + "/");
			req.setAttribute("message", "senhas não conferem");
			disp.forward(req, res);
			return;
		}
		
		byte[] image = req.getPart("foto-perfil").getInputStream().readAllBytes();
		if (image.length == 0) image = null;
		
		Usuario usuario = new Usuario(email, nome, telefone, senha, image);
		if (!dao.save(usuario)) {
			RequestDispatcher disp = req.getRequestDispatcher("/form_usuario.jsp");
			req.setAttribute("errorMessage", "usuário já existe");
			disp.forward(req, res);
			return;
		}
		
		HttpSession session = req.getSession(true);
		session.setAttribute("email", email);
		
		res.sendRedirect(req.getContextPath() + "/home");
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/form_usuario.jsp").forward(req, res);
	}
}
