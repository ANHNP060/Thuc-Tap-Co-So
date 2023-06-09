
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;


public class UserDAO extends DBContext{
    public User getAcountUser(String user , String pass){
        String sql = "select * from Users where Username=? and Password=?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new User(rs.getInt(1), rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public List<User> getAllUser(){
		List <User> list = new ArrayList<>();
		String sql = "select * from Users";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				User u = new User();
				u.setUserId(rs.getInt("UserId"));
				u.setUsername(rs.getString("Username"));
				u.setEmail(rs.getString("Email"));
				u.setPhone_number(rs.getString("Phone_number"));
				u.setAddress(rs.getString("Address"));
				u.setPassword(rs.getString("Pasword"));
				list.add(u);
				
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}
	public  User userlogin(String email, String password) {
		User u = null;
		try {
			String sqlLogin = "select * from Users where Email=? and Password = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlLogin);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				u = new User();
				u.setUserId(resultSet.getInt("UserId"));
				u.setUsername(resultSet.getString("Username"));
				u.setEmail(resultSet.getString("Email"));
				u.setPhone_number(resultSet.getString("Phone_number"));
				u.setAddress(resultSet.getString("Address"));
				u.setPassword(resultSet.getString("Pasword"));
				
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return u;
	}
	
	public void signup(User u) {
		try {
			String sqlInsert = "INSERT INTO Users (UserId, Username, Email, Phone_number,"
					+ " Address, Password) "
					+ "VALUES(?,?,?,?,?,?)";
			PreparedStatement st = connection.prepareStatement(sqlInsert);
			
				st.setInt(1, u.getUserId());
				st.setString(2, u.getUsername());
				st.setString(3, u.getEmail());
				st.setString(4, u.getPhone_number());
				st.setString(5, u.getAddress());
				st.setString(6, u.getPassword());
				
				st.executeUpdate();

				st.close();
				connection.close();
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public boolean checkUser(String Email) {
		boolean result = false;
		try {
			String sqlSelectByEmail = "select * from Users where Email=?";
			PreparedStatement st = connection.prepareStatement(sqlSelectByEmail);
			st.setString(1, Email);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				result = true;
			}
			st.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return result;
	}
	public static void main(String[] args) {
		UserDAO uDao = new UserDAO();
		System.out.println(uDao.userlogin("anh9195358@gmail.com", "phuthuytocdo24522"));
	}
    
}
