package serviceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;

public class RegisterServlet extends HttpServlet { 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 this.doPost(request, response);
	} 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		 request.setCharacterEncoding("utf-8");
		 String username = request.getParameter("username");
		 String phone = request.getParameter("phone");
		 String password = request.getParameter("password");
		 String type = request.getParameter("type");
		 User user = new User();
		 user.setUsername(username);	 
		 user.setPhone(phone);	 
		 user.setPassword(password);
		 UserService userService = new UserService();
		 if(userService.add(user)){
			 request.setAttribute("RegisterResult", "ע��ɹ�,3s����ת����ҳ");
			 response.setHeader("refresh", "3;url='/fileManagement/index.jsp'");
			 request.getRequestDispatcher("/register.jsp").forward(request, response);
			 
		 }else{
			 response.setHeader("refresh", "3;url='/fileManagement/index.jsp'");
			 request.setAttribute("RegisterResult", "�Բ���ע��ʧ�ܣ���������Ŭ����������");
			 request.getRequestDispatcher("/register.jsp").forward(request, response);
			
		 }
	}

}
