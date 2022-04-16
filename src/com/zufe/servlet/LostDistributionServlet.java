package com.zufe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zufe.bean.LostTeam;
import com.zufe.bean.People;
import com.zufe.bean.Record;
import com.zufe.dao.LostDao;
import com.zufe.dao.LostTeamDao;
import com.zufe.dao.PeopleDao;
import com.zufe.dao.RecordDao;
import com.zufe.dao.UserDao;

@WebServlet("/LostDistributionServlet")
public class LostDistributionServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LostDistributionServlet() {
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
		String type=request.getParameter("type");
		if(type.equals("team")){
			LostTeam LT = new LostTeam();
			LostTeamDao LTDao = new LostTeamDao();
			LT.setLostId(Integer.valueOf(request.getParameter("lostId")));
			LT.setTeamId(Integer.valueOf(request.getParameter("teamId")));
			LTDao.addLostTeam(LT);
			response.sendRedirect("check/admin_distribution.jsp");
		}
		else{
			UserDao userDao=new UserDao();
			LostDao lostDao=new LostDao();
			RecordDao recordDao=new RecordDao();
			Record record=new Record();
			String str=request.getParameter("ADDOrSUB");
			if(str.equals("ADD")){
				int lostId=Integer.valueOf(request.getParameter("lostId"));
				String userId=request.getParameter("userId");
				record.setUser(userDao.getUserById(userId));
				record.setLost(lostDao.getLostByLostId(lostId));
				recordDao.addRecord(record);
			}
			else{
				int recordId=Integer.valueOf(request.getParameter("recordId"));
				record.setRecordId(recordId);
				recordDao.deleteRecord(record);
			}
			response.sendRedirect("check/leader_distribution.jsp");
		}
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
