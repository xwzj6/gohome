package com.zufe.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.zufe.bean.User;
import com.zufe.bean.Video;
import com.zufe.dao.UserDao;
import com.zufe.dao.VideoDao;

@WebServlet("/AddVideoServlet")
public class AddVideoServlet extends HttpServlet {

	/**
	  Constructor of the object.
	 */
	public AddVideoServlet() {
		super();
	}

	/**
	  Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	  The doGet method of the servlet. <br>
	  
	  This method is called when a form has its tag value method equals to get.
	  
	  @param request
	            the request send by the client to the server
	  @param response
	             the response send by the server to the client
	  @throws ServletException
	              if an error occurred
	  @throws IOException
	              if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	  The doPost method of the servlet. <br>
	  
	  This method is called when a form has its tag value method equals to
	  post.
	  
	  @param request
	             the request send by the client to the server
	  @param response
	             the response send by the server to the client
	  @throws ServletException
	              if an error occurred
	  @throws IOException
	              if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		 PrintWriter out1 = response.getWriter();
		// System.out.print(request.getParameter("upload"));
		// System.out.print(request.getAttribute("upload"));
		Video video=new Video();
		VideoDao videoDao=new VideoDao();
		video.setUserId(request.getParameter("userId"));
		try {

			// 1銆佸垱寤虹鐩樻枃浠堕」宸ュ巶
			// 浣滅敤锛氳缃紦瀛樻枃浠剁殑澶у皬 璁剧疆涓存椂鏂囦欢瀛樺偍鐨勪綅缃�
			String path_temp = this.getServletContext().getRealPath("temp");
			// DiskFileItemFactory factory = new DiskFileItemFactory(1024*1024,
			// new File(path_temp));
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 1024*300);
			factory.setRepository(new File(path_temp));
			// 2銆佸垱寤烘枃浠朵笂浼犵殑鏍稿績绫�
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 璁剧疆涓婁紶鏂囦欢鐨勫悕绉扮殑缂栫爜
			upload.setHeaderEncoding("UTF-8");
			// ServletFileUpload鐨凙PI
			boolean multipartContent = upload.isMultipartContent(request);// 鍒ゆ柇琛ㄥ崟鏄惁鏄枃浠朵笂浼犵殑琛ㄥ崟
			if (multipartContent) {
				// 鏄枃浠朵笂浼犵殑琛ㄥ崟
				// ***瑙ｆ瀽request鑾峰緱鏂囦欢椤归泦鍚�
				List<FileItem> parseRequest = upload.parseRequest(request);
				if (parseRequest != null) {
					for (FileItem item : parseRequest) {
						// 鍒ゆ柇鏄笉鏄竴涓櫘閫氳〃鍗曢」
						System.out.println(item);
						boolean formField = item.isFormField();
						if (formField) {
							
							
							String fieldName = item.getFieldName();
							String fieldValue = item.getString("UTF-8");// 瀵规櫘閫氳〃鍗曢」鐨勫唴瀹硅繘琛岀紪鐮�

							System.out.println(fieldName + "----" + fieldValue);
							
							
							if(fieldName.equals("videoName")) video.setVideoName(fieldValue);
							// 褰撹〃鍗曟槸enctype="multipart/form-data"鏃�
							// request.getParameter鐩稿叧鐨勬柟娉�
							// String parameter =
							// request.getParameter("username");

						} else {
							// 鏂囦欢涓婁紶椤�
							// 鏂囦欢鐨勫悕
							String fileName = item.getName();
							// 鑾峰緱涓婁紶鏂囦欢鐨勫唴瀹�
							InputStream in = item.getInputStream();
							String path_store=null;
							if(item.getFieldName().equals("upload")){ 
								video.setVideoAddr(fileName);
								path_store = this.getServletContext()
										.getRealPath("videos");
							}
							if(item.getFieldName().equals("pic")){ 
								video.setVideoPic(fileName);
								path_store = this.getServletContext()
										.getRealPath("videos/pic");
							}
							
							OutputStream out = new FileOutputStream(path_store
									+ "/" + fileName);
							IOUtils.copy(in, out);
							in.close();
							out.close();

							// 鍒犻櫎涓存椂鏂囦欢
							item.delete();
							
							
						}
					}
					videoDao.addVideo(video);
				}

			} else {
				// 涓嶆槸鏂囦欢涓婁紶琛ㄥ崟
				// 浣跨敤鍘熷鐨勮〃鍗曟暟鎹殑鑾峰緱鏂瑰紡 request.getParameter();
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		//Video video=new Video();
		//VideoDao videoDao=new VideoDao();
		//video
		// 杩涜閿欒鎻愮ず
		 out1.println("<script type='text/javascript'>");
		 out1.println("alert('上传成功');");
		 out1.println("window.location='video/video_list.jsp';");
		 out1.println("</script>");

	}

	/**
	  61 * 鏍规嵁璇锋眰澶磋В鏋愬嚭鏂囦欢鍚�62 * 璇锋眰澶寸殑鏍煎紡锛氱伀鐙愬拰google娴忚鍣ㄤ笅锛歠orm-data; name="file";
	  filename="snmp4j--api.zip" 63 * IE娴忚鍣ㄤ笅锛歠orm-data; name="file";
	  filename="E:\snmp4j--api.zip" 64 * @param header 璇锋眰澶�65 * @return 鏂囦欢鍚�66
	 */

}
