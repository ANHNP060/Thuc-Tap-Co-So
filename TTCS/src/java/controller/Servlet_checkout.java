package controller;



import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Order;
import model.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dal.DBContext;
import dal.OrderDAO;

@WebServlet("/checkout")
public class Servlet_checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(PrintWriter out = resp.getWriter()){

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            ArrayList<Cart> cart_list = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
            user auth = (user) req.getSession().getAttribute("user");

            if(cart_list != null && auth!=null) {
                for(Cart c:cart_list) {
                    Order order = new Order();
                    order.setProId(c.getProId());
                    order.setUid(auth.getUserId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(formatter.format(date));

                    OrderDAO oDao = new OrderDAO();
                    boolean result = oDao.insertOrder(order);
                    if(!result) break;
                }
                cart_list.clear();
                resp.sendRedirect("order.jsp");
            }else {
                if(auth==null) {
                    resp.sendRedirect("login.jsp");
                }else resp.sendRedirect("cart.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}