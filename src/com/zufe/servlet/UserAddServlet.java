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

@WebServlet("/UserAddServlet")
public class UserAddServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserAddServlet() {
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
		UserDao userDao = new UserDao();
		int minId=0, maxId=0;
		System.out.println(1);
		int userNum = Integer.valueOf(request.getParameter("userNum"));
		user.setTeamId(Integer.valueOf(request.getParameter("teamId")));
		user.setUserState(request.getParameter("userState"));
		user.setUserPass("123456");
		System.out.println(2);
		for (int i = 1; i <= userNum; i++) {
			user = userDao.addUser(user);
			if (i == 1)
				minId = user.getUserId2();
			if (i == userNum)
				maxId = user.getUserId2();
		}
		out.println("<script type='text/javascript'>");
		out.println("alert('创建成功！Id编号为" + minId + "到" + maxId
				+ ",密码为123456');");
		out.println("window.location='manage/user_list.jsp';");
		out.println("</script>");
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
