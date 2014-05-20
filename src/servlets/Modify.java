package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserInfo;

import database.DBconn;

public class Modify extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("userid"));
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		int classes = Integer.parseInt(request.getParameter("classes"));
		String email = request.getParameter("email");
		UserInfo info = new UserInfo();
		info.setId(id);
		info.setName(name);
		info.setMobile(mobile);
		info.setClasses(classes);
		info.setEmail(email);
		DBconn conn = new DBconn();
		conn.modify(info);
		request.getRequestDispatcher("/suess.jsp").forward(request, response);
	}

}