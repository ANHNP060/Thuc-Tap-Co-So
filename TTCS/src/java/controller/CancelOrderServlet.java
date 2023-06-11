package controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import dal.DBContext;
import dal.OrderDAO;

@WebServlet("/cancel-order")
public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(PrintWriter out = resp.getWriter()) {
            String id = req.getParameter("id");
            if(id != null) {
                OrderDAO orderDao = new OrderDAO();
                orderDao.cancelOrder(Integer.parseInt(id));
            }
            resp.sendRedirect("order.jsp");
        }
    }
}
