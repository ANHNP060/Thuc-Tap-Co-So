package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.user;

import java.io.IOException;
import java.util.List;

import dal.ProductDAO;
import dal.UserDAO;

@WebServlet("/userShopping")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hanhDong = request.getParameter("hanhDong");
		if (hanhDong.equals("login")) {
			Login(request, response);
		} else if (hanhDong.equals("logout")) {
			Logout(request, response);
		} else if (hanhDong.equals("signup")) {
			Signup(request, response);
		}
		else if(hanhDong.equals("search")) {
			Search(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void Search(HttpServletRequest request, HttpServletResponse response) {
		try {
			ProductDAO proDao = new ProductDAO();
			String input = request.getParameter("key");
			if(input == null || input.equals("")) {
				request.setAttribute("error", "Không có kết quả bạn cần tìm");
				request.getRequestDispatcher("home.jsp").forward(request, response);
				System.out.println("Search method called");
			}
			 else {
		            List<Product> list = proDao.search(input);
		            request.setAttribute("products", list);
		            request.getRequestDispatcher("home.jsp").forward(request, response); 
		            
		        }
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void Login(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("Hihihiiiiiiiiii");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			String error = "";
			UserDAO userDao = new UserDAO();
			user user = userDao.userlogin(email, password);
			
			if(user != null) {
				if(user.getEmail().equals("anh@gmail.com") && user.getPassword().equals("12345")) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					response.sendRedirect("qlsp");
				}
				else {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("home");
			}
			}
			else {
				error += "Bạn đã nhập sai email hoặc mật khẩu <br/>";
				request.setAttribute("error", error);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	private void Logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			// Huy bo session
			session.removeAttribute("user");;
			response.sendRedirect("home");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void Signup(HttpServletRequest request, HttpServletResponse response) {
		try {
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phoneNumber = request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			request.setAttribute("fullname", fullname);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("phoneNumber", phoneNumber);
			request.setAttribute("address",address);
			
			String error = "";
			UserDAO userDAO = new UserDAO();
			if(userDAO.checkUser(email)) {
				error += "Email đã tồn tại, vui lòng nhập email khác. <br/>";
			}
			request.setAttribute("error", error);
			if(error.length()>0) {
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			else {
				user user = new user();
				user.setFullname(fullname);
			    user.setEmail(email);
			    user.setPassword(password);
			    user.setPhoneNumber(phoneNumber);
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
