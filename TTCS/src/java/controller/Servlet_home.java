/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Product;

@WebServlet(name = "Servlet_home", urlPatterns = { "home" })
public class Servlet_home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String ProId_raw = request.getParameter("ProId");
        String CateId_raw = request.getParameter("CateId");
        int ProId, CateId;
        ProductDAO dao = new ProductDAO();
        try {
            if((ProId_raw==null || ProId_raw=="") && (CateId_raw==null || CateId_raw=="")){
                List<Product> list = dao.getAllProducts();
                request.setAttribute("products", list);
            } else if((ProId_raw==null || ProId_raw=="") && (CateId_raw!=null || CateId_raw!="")){
                CateId = Integer.parseInt(CateId_raw);
                List<Product> list = dao.getAllProductByCateId(CateId);
                request.setAttribute("products", list);
            } else if((ProId_raw!=null || ProId_raw!="") && (CateId_raw==null || CateId_raw=="")){
                ProId = Integer.parseInt(ProId_raw);
                List<Product> list = new ArrayList<>();
                Product p = dao.getProductByProId(ProId);
                list.add(p);
                request.setAttribute("products", list);
            }
        } catch(NumberFormatException e){
            System.out.println(e);
        }
        
		 request.getRequestDispatcher("home.jsp").forward(request, response); 
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    }
    
}
