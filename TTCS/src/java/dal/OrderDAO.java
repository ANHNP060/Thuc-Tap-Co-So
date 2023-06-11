package dal;

import model.Order;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBContext{

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public OrderDAO() {
        super();
    }
    public List<Order> getAllOrderByUserId(int UserId){
		List<Order> list = new ArrayList<>();
		String sql = "select * from Orders where userId=?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, UserId);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setOrderId(rs.getInt(1));
				o.setProId(rs.getInt(2));
				ProductDAO proDAO = new ProductDAO();
				Product p = proDAO.getProductByProId(rs.getInt(2));
				o.setNamePro(p.getNamePro());
                o.setImagePro(p.getImagePro());
                o.setPrice(p.getPrice());
                o.setQuantity(p.getQuantity());
                o.setCateId(p.getCateId());
                o.setDesId(p.getDesId());
				o.setUid(rs.getInt(3));
				o.setQuantity(rs.getInt(4));
				o.setDate(rs.getString(5));
				list.add(o);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}

	
//    them mot san pham vao database orders
    public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into Orders (ProId, userId, oQuantity, oDate) values(?,?,?,?)";
            pst = connection.prepareStatement(query);
            pst.setInt(1, model.getProId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    //???
    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from Orders where userId=? order by Orders.oId desc";
            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDAO productDao = new ProductDAO();
                int pId = rs.getInt("ProId");
                Product product = productDao.getProductByProId(pId);
                order.setOrderId(rs.getInt("oId"));
                order.setProId(pId);
                order.setNamePro(product.getNamePro());
                order.setCateId(product.getCateId());
                order.setPrice(product.getPrice()*rs.getInt("oQuantity"));
                order.setQuantity(rs.getInt("oQuantity"));
                order.setDate(rs.getString("oDate"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from Orders where oId=?";
            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}