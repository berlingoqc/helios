/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.wquintal.helios.api;

import ca.wquintal.helios.api.BaseServlet;
import ca.wquintal.helios.AccountDB;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author wq
 */
public class account extends BaseServlet {

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doDelete(req, resp); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		String psw = request.getParameter("password");
		String old = request.getParameter("old");

		
	}
	private static final long serialVersionUID = 1L;
	
	private AccountDB db = null;
	
	public account() {
		super();
		try {
			db = AccountDB.getAccountDBInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		// Get le token d'un utilisateur doit passer username et password
		String psw = request.getParameter("password");
		String user = request.getParameter("username");
		PrintWriter out = response.getWriter();
		try {
			db.OpenIfClose();
			String tk = db.LoginUser(user, psw);
			db.Close();
			request.getSession().setAttribute("identity", tk);
			response.setStatus(200);
		} catch(AccountDB.BadPasswordException e) {
			response.setStatus(400);
			out.write("password");
		} catch(AccountDB.AccountDontExistsException e) {
			response.setStatus(400);
			out.write("username");
		} catch(Exception e) {
			response.setStatus(400);
			// envoie vers la page d'erreur
		
		}
	}


	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
