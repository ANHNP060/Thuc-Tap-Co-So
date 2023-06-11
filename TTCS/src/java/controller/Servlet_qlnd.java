package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.user;

import java.io.IOException;
import java.util.List;

import dal.ProductDAO;
import dal.UserDAO;

/**
 * Servlet implementation class Servlet_qlnd
 */
@WebServlet(name="Servlet_qlnd", urlPatterns={"/qlnd"})
public class Servlet_qlnd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	UserDAO dao = new UserDAO();
    	List<user> list = dao.getAllUser();
    	request.setAttribute("dsnd", list);
        request.getRequestDispatcher("qlnd.jsp").forward(request, response); 
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	String seach = request.getParameter("seach");
    	UserDAO dao = new UserDAO();
        if(seach==null || seach==""){
            response.sendRedirect("qlnd");
        }
        else {
            List<user> list = dao.getAllUserBySearch(seach);
            request.setAttribute("dsnd", list);
            request.getRequestDispatcher("qlnd.jsp").forward(request, response); 
        }
    }

}