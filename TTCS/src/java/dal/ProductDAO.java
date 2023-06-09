/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Describe;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public Category getCategoryByCateId(int CateId) {
        String sql = "select * from Categories where CateId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CateId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCateId(rs.getInt("CateId"));
                c.setNameCate(rs.getString("NameCate"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllProductByCateId(int CateId) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where CateId=" + CateId + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProId(rs.getInt("ProId"));
                p.setNamePro(rs.getString("NamePro"));
                p.setImagePro(rs.getString("ImagePro"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                Category c = getCategoryByCateId(rs.getInt("CateId"));
                p.setCateId(c);
                Describe d = getDescribeByDesId(rs.getInt("DesId"));
                p.setDesId(d);
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Describe getDescribeByDesId(int DesId) {
        String sql = "select * from Describe where DesId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, DesId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Describe d = new Describe();
                d.setDesId(rs.getInt("DesId"));
                d.setMauSac(rs.getString("MauSac"));
                d.setKichThuoc(rs.getString("KichThuoc"));
                d.setChatLieu(rs.getString("ChatLieu"));
                d.setNoiSanXuat(rs.getString("NoiSanXuat"));
                String res1 = rs.getString("DacDiemNoiBat");
                String[] res1_kq = res1.split(".n@");
                d.setDacDiemNoiBat(res1_kq);
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductByProId(int ProId) {
        String sql = "select * from Products where ProId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ProId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setProId(rs.getInt("ProId"));
                p.setNamePro(rs.getString("NamePro"));
                p.setImagePro(rs.getString("ImagePro"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                Category c = getCategoryByCateId(rs.getInt("CateId"));
                Describe d = getDescribeByDesId(rs.getInt("DesId"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lay all ban ghi product
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProId(rs.getInt("ProId"));
                p.setNamePro(rs.getString("NamePro"));
                p.setImagePro(rs.getString("ImagePro"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                Category c = getCategoryByCateId(rs.getInt("CateId"));
                p.setCateId(c);
                Describe d = getDescribeByDesId(rs.getInt("DesId"));
                p.setDesId(d);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("CateId"), rs.getString("NameCate"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> search(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "select Products.ProId, Products.NamePro, Products.ImagePro, Products.Price, Products.Quantity, Products.CateId, Products.DesId\n"
                + "from Products, Categories where Products.CateId = Categories.CateId \n"
                + "and ((NameCate like ?) or (NamePro like ?))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, key);
            st.setString(2, key);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProId(rs.getInt("ProId"));
                p.setNamePro(rs.getString("NamePro"));
                p.setImagePro(rs.getString("ImagePro"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                Category c = getCategoryByCateId(rs.getInt("CateId"));
                p.setCateId(c);
                Describe d = getDescribeByDesId(rs.getInt("DesId"));
                p.setDesId(d);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public boolean checkProductByNamePro(String NamePro) {
        String sql = "select * from Products where NamePro=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, NamePro);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void insertProduct(Product p, Describe d) {
        try {
            String sql1 = "SELECT ProId FROM Products order by ProId desc LIMIT 1";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {
                int id = rs1.getInt(1) + 1;
                String sql2 = "insert Describes(DesId, MauSac=?, KichThuoc=?, "
                    + "ChatLieu=?, NoiSanXuat=?, DacDiemNoiBat=?"
                        + "values (?,?,?,?,?,?)";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, id);
                st1.setString(2, d.getMauSac());
                st1.setString(3, d.getKichThuoc());
                st1.setString(4, d.getChatLieu());
                st1.setString(5, d.getNoiSanXuat());
                String res = "";
                for (String i : d.getDacDiemNoiBat()) {
                    res += i + ".n@";
                }
                st1.setString(6, res);
                st2.executeUpdate();

                String sql3 = "insert Products(ProId, NamePro, ImagePro, Price, Quantity, CateId, DesId)"
                        + "values(?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement st3 = connection.prepareStatement(sql3);
                st3.setInt(1, id);
                st3.setString(2, p.getNamePro());
                st3.setString(3, p.getImagePro());
                st3.setInt(4, p.getPrice());
                st3.setInt(5, p.getQuantity());
                int CateId = p.getCateId().getCateId();
                st3.setInt(6, CateId);
                st3.setInt(7, id);
                st3.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int ProId) {
        try {
            String sql1 = "delete from Products where ProId=?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, ProId);
            st1.executeUpdate();

            String sql2 = "delete from Describes where DesId=?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, ProId);
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product p, Describe d) {
        try {
            String sql1 = "update Describes set MauSac=?, KichThuoc=?, "
                    + "ChatLieu=?, NoiSanXuat=?, DacDiemNoiBat=?, where DesId=?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, d.getMauSac());
            st1.setString(2, d.getKichThuoc());
            st1.setString(3, d.getChatLieu());
            st1.setString(4, d.getNoiSanXuat());
            String res = "";
            for (String i : d.getDacDiemNoiBat()) {
                res += i + ".n@";
            }
            st1.setString(5, res);
            st1.setInt(6, d.getDesId());
            st1.executeUpdate();

            String sql2 = "update Products set NamePro=?, ImagePro=?, Price=?, "
                    + "Quantity=?, CateId=? where ProId=?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setString(1, p.getNamePro());
            st2.setString(2, p.getImagePro());
            st2.setInt(3, p.getPrice());
            st2.setInt(4, p.getQuantity());
            int CateId = p.getCateId().getCateId();
            st2.setInt(5, CateId);
            st2.setInt(6, p.getProId());
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
