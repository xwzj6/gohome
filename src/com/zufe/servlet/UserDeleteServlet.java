package com.zufe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zufe.bean.User;
import com.zufe.dao.UserDao;

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserDeleteServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		User user = new User();
		UserDao dao = new UserDao();
		user.setUserId(request.getParameter("id"));
		user.setTeamId(Integer.valueOf(request.getParameter("teamId")));
		if (dao.deleteUser(user) == true) {
			out.println("<script type='text/javascript'>");
			out.println("alert('ɾ���ɹ���');");
			out.println("window.location='manage/user_list.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('ɾ��ʧ�ܣ�');");
			out.println("window.location='manage/user_list.jsp';");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
