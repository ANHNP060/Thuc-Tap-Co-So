package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import model.Category;
import model.Describe;
import model.Product;

@MultipartConfig
@WebServlet(name = "Servlet_themvasua", urlPatterns = {"/Servlet_themvasua"})
public class Servlet_themvasua extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String NamePro = request.getParameter("NamePro");
        String CateId_raw = request.getParameter("CateId");
        String Price_raw = request.getParameter("Price");
        String Quantity_raw = request.getParameter("Quantity");

        String MauSac = request.getParameter("MauSac");
        String ChatLieu = request.getParameter("ChatLieu");
        String KichThuoc = request.getParameter("KichThuoc");
        String NoiSanXuat = request.getParameter("NoiSanXuat");

        String DacDiemNoiBat_raw = request.getParameter("DacDiemNoiBat");

        String ProId_raw = request.getParameter("ProId");

        Part part = request.getPart("ImagePro");

        ProductDAO dao = new ProductDAO();

        int ProId;

        if (NamePro == null || NamePro == "" || CateId_raw == null || CateId_raw == "" || Price_raw == null || Price_raw == "" || Quantity_raw == null || Quantity_raw == ""
                || MauSac == null || MauSac == "" || KichThuoc == null || KichThuoc == "" || ChatLieu == null || ChatLieu == "" || NoiSanXuat == null || NoiSanXuat == ""
                || DacDiemNoiBat_raw == null || DacDiemNoiBat_raw == "") {
            request.setAttribute("error", "Thiếu thông tin!");
            List<Category> listCate = dao.getAllCategory();
            request.setAttribute("cate", listCate);
            if (ProId_raw == null || ProId_raw == "") {
                request.getRequestDispatcher("qlsp_themsp.jsp").forward(request, response);
            } else {
                ProId = Integer.parseInt(ProId_raw);
                Product p = dao.getProductByProId(ProId);
                Describe d = dao.getDescribeByDesId(ProId);
                request.setAttribute("pro", p);
                request.setAttribute("des", d);
                request.getRequestDispatcher("qlsp_suasp.jsp").forward(request, response);
            }
        } else if ((ProId_raw == null || ProId_raw == "") && dao.checkProductByNamePro(NamePro) == true) {
            request.setAttribute("error", "Tên sản phẩm đã tồn tại!");
            List<Category> listCate = dao.getAllCategory();
            request.setAttribute("cate", listCate);
            request.getRequestDispatcher("qlsp_themsp.jsp").forward(request, response);
        } else {
            if (ProId_raw == null || ProId_raw == "") {
                if (part != null && part.getSize() > 0) {
                    String realPath = request.getServletContext().getRealPath("img/product");
                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                    String[] NamePro_1 = NamePro.split(" ");
                    String imgName = "";
                    for (String i : NamePro_1) {
                        imgName += i;
                    }

                    String extension = filename.substring(filename.lastIndexOf("."));
                    String newfilename = imgName + extension;

                    String newFilePath = realPath + "/" + newfilename;
                    Files.copy(part.getInputStream(), Paths.get(newFilePath), StandardCopyOption.REPLACE_EXISTING);

                    int CateId = Integer.parseInt(CateId_raw);
                    Category catePro = dao.getCategoryByCateId(CateId);

                    try {
                        Product product = new Product(CateId, NamePro, newfilename, Integer.parseInt(Price_raw), Integer.parseInt(Quantity_raw), catePro, null);
                        Describe describe = new Describe();
                        describe.setMauSac(MauSac);
                        describe.setKichThuoc(KichThuoc);
                        describe.setChatLieu(ChatLieu);
                        describe.setNoiSanXuat(NoiSanXuat);

                        String[] DacDiemNoiBat = DacDiemNoiBat_raw.split("\\r?\\n");
                        describe.setDacDiemNoiBat(DacDiemNoiBat);

                        dao.insertProduct(product, describe);

                        HttpSession session = request.getSession();
                        session.setAttribute("success", "Thêm sản phẩm thành công!");
                        response.sendRedirect("qlsp");
                    } catch (NumberFormatException e) {
                        System.out.println(e);
                    }

                } else {
                    request.setAttribute("error", "Thiếu hình ảnh!");
                    List<Category> listCate = dao.getAllCategory();
                    request.setAttribute("cate", listCate);
                    request.getRequestDispatcher("qlsp_themsp.jsp").forward(request, response);
                }

            } else if (ProId_raw != null && ProId_raw != "") {
                try {
                    ProId = Integer.parseInt(ProId_raw);

                    Describe describe = new Describe();
                    describe.setDesId(ProId);
                    describe.setMauSac(MauSac);
                    describe.setKichThuoc(KichThuoc);
                    describe.setChatLieu(ChatLieu);
                    describe.setNoiSanXuat(NoiSanXuat);

                    String[] DacDiemNoiBat = DacDiemNoiBat_raw.split("\\r?\\n");
                    describe.setDacDiemNoiBat(DacDiemNoiBat);

                    Product product = new Product();
                    product.setProId(ProId);
                    product.setNamePro(NamePro);
                    product.setPrice(Integer.parseInt(Price_raw));
                    product.setQuantity(Integer.parseInt(Quantity_raw));
                    product.setCateId(dao.getCategoryByCateId(Integer.parseInt(CateId_raw)));
                    product.setDesId(describe);

                    Product p = dao.getProductByProId(ProId);
                    if (part != null && part.getSize() > 0) {
                        String realPath = request.getServletContext().getRealPath("img/product");
                        String newFilePath_old = realPath + "/" + p.getImagePro();
                        File imgFile = new File(newFilePath_old);

                        if (imgFile.exists()) {
                            imgFile.delete();
                        }

                        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                        String imgName = p.getImagePro().substring(0, p.getImagePro().lastIndexOf("."));

                        String extension = filename.substring(filename.lastIndexOf("."));
                        String newfilename = imgName + extension;

                        String newFilePath = realPath + "/" + newfilename;
                        Files.copy(part.getInputStream(), Paths.get(newFilePath), StandardCopyOption.REPLACE_EXISTING);
                        product.setImagePro(newfilename);
                    } else {
                        product.setImagePro(p.getImagePro());
                    }

                    dao.updateProduct(product, describe);
                    HttpSession session = request.getSession();
                    session.setAttribute("success", "Sửa sản phẩm thành công!");
                    response.sendRedirect("qlsp");
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }

            }
        }

    }

}
