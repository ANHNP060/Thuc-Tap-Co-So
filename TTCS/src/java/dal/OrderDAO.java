/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext{
    public void addOrder(User u,Cart cart){
        //ngay hien thoi
        LocalDate userDate = java.time.LocalDate.now();
        String date = userDate.toString();
        try {
            String sql = "insert into Orders values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,date);
            st.setInt(2, u.getUserId());
            st.setInt(3, cart.getTotalMoney());
            st.executeUpdate();
            
            // Lấy ra id của order vừa add
            String sql1 = "select top 1 OrderId from Orders order by OrderId desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            
            
            // Thêm vào bảng OrderLine
            if(rs.next()){
                int OrderId = rs.getInt(1);
                for(Item i:cart.getItems()){
                    String sql2 = "insert into OrderLine values (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, OrderId);
                    st2.setInt(2, i.getProduct().getProId());
                    st2.setInt(3,i.getQuantity());
                    st2.setInt(4,i.getPrice());
                    st2.executeUpdate();
                }
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
