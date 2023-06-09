/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author ADMIN
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginDAO dao = new LoginDAO();
        try {
            if (username == null || username == "" || password == null || password == "") {
                request.setAttribute("error", "Thiếu thông tin!!!");
            } else {
                User u = dao.checkLoginUser(username, password);
                if (u != null) {
                    if (u.getUsername().equals("Admin") && u.getPassword().equals("12345")) {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("account", u);
                        response.sendRedirect("qlsp");
                    } else {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("account", u);
                        response.sendRedirect("home");
                    }
                } else {
                    request.setAttribute("error", "Sai thông tin!");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
