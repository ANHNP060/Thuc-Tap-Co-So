/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class Servlet_home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String ProId_raw = request.getParameter("ProId");
        String CateId_raw = request.getParameter("CateId");
        int ProId, CateId;
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
        HttpSession session = request.getSession(true);
        List<Item> list1 = cart.getItems();
        session.setAttribute("size", list1.size());
        session.setAttribute("cart", cart); 
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

}
