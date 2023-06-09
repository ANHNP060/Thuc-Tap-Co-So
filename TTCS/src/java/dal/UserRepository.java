/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

/**
 *
 * @author ADMIN
 */
public class UserRepository extends DBContext{
    public void create(String Username, 
			String Email,
			String Password,
			String Phone_number,
			String Address,
			HttpServletRequest req,
			HttpServletResponse resp) throws SQLException, ServletException, IOException {
		
		String getUserByName = "SELECT * FROM Users WHERE Email = ?;";
		PreparedStatement st = connection.prepareStatement(getUserByName);
		st.setString(1, Email);
		ResultSet userGetByName = st.executeQuery();
		String usernameInDb = null;
		while( userGetByName.next() ) {
			usernameInDb = userGetByName.getString("Username");
		}
		
		if( Objects.nonNull(usernameInDb) ) {
			req.setAttribute("message", "Tai khoan hoac mat khau da ton tai");
			RequestDispatcher requestDispatcher =	req.getRequestDispatcher("signup.jsp");
			requestDispatcher.include(req, resp);
		}
		else {
			String registerSql = "INSERT INTO DatabaseTTCS.Users (Username, Email, Phone_number, Address, Pasword) VALUES (?, ?, ?, ?, ?);";
			st = connection.prepareStatement(registerSql);
			st.setString(1, Username);
			st.setString(2, Email);
			st.setString(3, Password);
			st.setString(4, Phone_number);
			st.setString(5, Address);
			//preparedStatement.executeUpdate();
			
			
			req.setAttribute("message", "Dang ki thanh cong");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("home");
			requestDispatcher.forward(req, resp);
		}
		
	}
}
