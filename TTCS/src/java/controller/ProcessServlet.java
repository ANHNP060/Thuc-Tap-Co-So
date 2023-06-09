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
public class ProcessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if(o != null){
            cart = (Cart)o;
        } else {
            cart = new Cart();
        }
        String tnum = request.getParameter("num").trim();
        String tid = request.getParameter("id");
        int id, num;
        try {
            id = Integer.parseInt(tid);
            num = Integer.parseInt(tnum);
            if(num==-1 && cart.getQuantityById(id)<=1){
                cart.removeItem(id);
            }
            else {
                ProductDAO dao = new ProductDAO();
                Product p = dao.getProductByProId(id);
                Item t = new Item(p, num, p.getPrice());
                cart.addItem(t);
            }
        } catch(NumberFormatException e){
            System.out.println(e);
        }
        
        List<Item> list = cart.getItems();
        String txt = "";
        for(Item i:list){
            int idx = i.getProduct().getProId();
            int quantity = i.getQuantity();
            txt += idx + ":" + quantity + "/";
        }
        Cookie[] arr = request.getCookies();
        if(arr != null){
            for(Cookie i:arr){
                if(i.getName().equals("cart")){
                    i.setMaxAge(0);
                    response.addCookie(i);
                }
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60*60*24*30);
        response.addCookie(c);
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        response.sendRedirect("cart");
    
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if(o != null){
            cart = (Cart)o;
        } else {
            cart = new Cart();
        }
        int id = Integer.parseInt(request.getParameter("id"));
        cart.removeItem(id);
        List<Item> list = cart.getItems();
        String txt = "";
        for(Item i:list){
            int idx = i.getProduct().getProId();
            int quantity = i.getQuantity();
            txt += idx + ":" + quantity + "/";
        }
        Cookie[] arr = request.getCookies();
        if(arr != null){
            for(Cookie i:arr){
                if(i.getName().equals("cart")){
                    i.setMaxAge(0);
                    response.addCookie(i);
                }
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60*60*24*30);
        response.addCookie(c);
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        response.sendRedirect("cart");
    
    }

}
