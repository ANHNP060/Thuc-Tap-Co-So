/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author ADMIN
 */
public class Servlet_checkout extends HttpServlet {
   
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProducts();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        
        List<Item> list1 = cart.getItems();
        request.setAttribute("items", list1);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProducts();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("account");
        if(u==null){
            response.sendRedirect("login");
        }
        else {
            OrderDAO dao2 = new OrderDAO();
            dao2.addOrder(u, cart);
            Cookie c = new Cookie("cart", "");
            c.setMaxAge(0);
            response.addCookie(c);
            request.getRequestDispatcher("confirm.jsp").forward(request, response);
        }
    }
    }

