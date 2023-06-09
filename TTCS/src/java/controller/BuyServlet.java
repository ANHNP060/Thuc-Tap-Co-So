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
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Admin
 */
public class BuyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("home");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        HttpSession session = request.getSession(true);
//        Cart cart = null;
//        Object o = session.getAttribute("cart");
//        if(o != null){
//            cart = (Cart)o;
//        } else {
//            cart = new Cart();
//        }
//        String num_raw = request.getParameter("num");
//        String ProId_raw = request.getParameter("ProId");
//        System.out.println(num_raw+" "+ProId_raw);
//        int number, ProId;
//        try {
//            number = Integer.parseInt(num_raw);
//            ProId = Integer.parseInt(ProId_raw);
//            ProductDAO dao = new ProductDAO();
//            Product p = dao.getProductByProId(ProId);
//            Item t = new Item(p, number, p.getPrice());
//            cart.addItem(t);
//        }catch(NumberFormatException e){
//            System.out.println(e);
//        }
//        List<Item> list = cart.getItems();
//        session.setAttribute("cart", cart);
//        session.setAttribute("size", list.size());
//        response.sendRedirect("describe?ProId="+ProId_raw);

        
        
        String num = request.getParameter("num");
        String id = request.getParameter("ProId");
        try {
            Cookie[] arr = request.getCookies();
            String txt = "";
            if(arr != null){
                for(Cookie o:arr){
                    if(o.getName().equals("cart")){
                        txt += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }
            if(id!=null && num!=null){
                if(txt.isEmpty()){
                    txt = id + ":" + num + "/";
                } else {
                    txt += id + ":" + num + "/";
                }
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60*60*24*30);
            response.addCookie(c);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
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
        response.sendRedirect("describe?ProId="+id);
    }

}
