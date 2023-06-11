package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

import java.io.IOException;
import java.util.List;

import dal.DBContext;
import dal.OrderDAO;

/**
 * Servlet implementation class Servlet_xemnd
 */

@WebServlet(name="Servlet_xemnd", urlPatterns={"/xemnd"})
public class Servlet_xemnd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	int UserId = Integer.parseInt(request.getParameter("UserId"));
    	OrderDAO dao = new OrderDAO();
    	List<Order> list = dao.getAllOrderByUserId(UserId);
    	request.setAttribute("dsorder", list);
    	request.setAttribute("ten", request.getParameter("Name"));
        request.getRequestDispatcher("xemnd.jsp").forward(request, response); 
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}