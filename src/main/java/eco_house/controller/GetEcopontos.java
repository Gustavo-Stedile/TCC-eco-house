package eco_house.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;

import eco_house.model.DomicilioJSON;
import eco_house.model.EcopontoDAO;
import eco_house.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ecopontos")
public class GetEcopontos extends HttpServlet {
	
	private EcopontoDAO dao;
	
	public void init() throws ServletException {
		dao = new EcopontoDAO();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String str = new Gson().toJson(dao.retrieve());
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(str);
	}
}
