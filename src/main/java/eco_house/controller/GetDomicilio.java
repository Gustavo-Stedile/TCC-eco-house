package eco_house.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;

import eco_house.model.DomicilioJSON;
import eco_house.model.Usuario;
import eco_house.model.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/home/domicilio")
public class GetDomicilio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuarioDAO dao;
	
	public void init() throws ServletException {
		dao = new UsuarioDAO();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			return;
		}
		
		
		Usuario usuario = dao.retrieve((String) session.getAttribute("email"));
		String str = new Gson().toJson(new DomicilioJSON(usuario.getDomicilio()));
		
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(str);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
