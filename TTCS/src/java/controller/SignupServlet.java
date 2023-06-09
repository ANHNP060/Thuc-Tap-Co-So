/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ADMIN
 */
public class SignupServlet extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String hanhDong = request.getParameter("hanhDong");
        if(hanhDong.equals("signup")){
            Signup(request,response);
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request,response);
	}

private void Signup(HttpServletRequest request, HttpServletResponse response) {
    try {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phonenumber = request.getParameter("phonenumber");
			String address = request.getParameter("address");
			request.setAttribute("username", username);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("phonenumber", phonenumber);
			request.setAttribute("address",address);
			
			String error = "";
			UserDAO userDAO = new UserDAO();
			if(userDAO.checkUser(email)) {
				error += "Email đã tồn tại, vui lòng chọn tên đăng nhập khác. <br/>";
			}
			request.setAttribute("error", error);
			if(error.length()>0) {
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			else {
				User user = new User();
				user.setUsername(username);
			    user.setEmail(email);
			    user.setPassword(password);
			    user.setPhone_number(phonenumber);
			    user.setAddress(address);   
				userDAO.signup(user);
				response.sendRedirect("home");
				System.out.println("1213");
			}
			
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
}
}

