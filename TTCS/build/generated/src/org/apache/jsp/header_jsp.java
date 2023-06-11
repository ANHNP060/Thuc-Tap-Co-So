package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Product;
import java.util.List;
import dal.ProductDAO;
import dal.DBContext;
import model.Cart;
import java.util.ArrayList;
import model.user;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"description\" content=\"Male_Fashion Template\">\n");
      out.write("        <meta name=\"keywords\" content=\"Male_Fashion, unica, creative, html\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("\n");
      out.write("        <!-- Css Styles -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/font-awesome.min.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/elegant-icons.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/magnific-popup.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/nice-select.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/slicknav.min.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\">\n");
      out.write("    </head>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        document.addEventListener('DOMContentLoaded', function () {\n");
      out.write("            document.getElementById('info-name').addEventListener('click',\n");
      out.write("                    function () {\n");
      out.write("                        var logoutDiv = document.getElementById('logout');\n");
      out.write("                        if (logoutDiv.style.display === 'none') {\n");
      out.write("                            logoutDiv.style.display = 'block';\n");
      out.write("                        } else {\n");
      out.write("                            logoutDiv.style.display = 'none';\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("        });\n");
      out.write("\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("    <body>\n");
      out.write("        ");

        String error = request.getAttribute("error") + "";
        error = (error.equals("null") ? "" : error);
        
      out.write("\n");
      out.write("        <!-- Page Preloder -->\n");
      out.write("        <div id=\"preloder\">\n");
      out.write("            <div class=\"loader\"></div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Offcanvas Menu Begin -->\n");
      out.write("        <div class=\"offcanvas-menu-overlay\"></div>\n");
      out.write("        <div class=\"offcanvas-menu-wrapper\">\n");
      out.write("            <div class=\"offcanvas__option\">\n");
      out.write("                <div class=\"offcanvas__links\">\n");
      out.write("                    <a href=\"#\">Sign in</a>\n");
      out.write("                    <a href=\"#\">FAQs</a>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"offcanvas__nav__option\">\n");
      out.write("                <a href=\"home\" class=\"search-switch\"><img src=\"img/icon/search.png\" alt=\"\"></a>\n");
      out.write("                <a href=\"#\"><img src=\"img/icon/heart.png\" alt=\"\"></a>\n");
      out.write("                <a href=\"#\"><img src=\"img/icon/cart.png\" alt=\"\"> <span>0</span></a>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"mobile-menu-wrap\"></div>\n");
      out.write("            <div class=\"offcanvas__text\">\n");
      out.write("                <p>Free shipping, 30-day return or refund guarantee.</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Offcanvas Menu End -->\n");
      out.write("\n");
      out.write("        <!-- Header Section Begin -->\n");
      out.write("        <header class=\"header\">\n");
      out.write("            <div class=\"header__top\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-lg-6 col-md-7\">\n");
      out.write("                            <div class=\"header__top__left\">\n");
      out.write("                                <p>Free shipping, 30-day return or refund guarantee.</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        ");

                Object object = session.getAttribute("user");
                user user = null;
                if (object != null) {
                        user = (user) object;
                }
                if (user == null) {
                        
      out.write("\n");
      out.write("                        <div class=\"col-lg-6 col-md-5\">\n");
      out.write("                            <div class=\"header__top__right\">\n");
      out.write("                                <div class=\"header__top__links\">\n");
      out.write("                                    <div id=\"login_item\" >\n");
      out.write("                                        <a href=\"login.jsp\">Sign in </a>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");

                                        } else {
                                    
      out.write("\n");
      out.write("                                    <div>\n");
      out.write("                                        <div class=\"account\">\n");
      out.write("                                            <button class=\"header_member info-name\" id=\"info-name\">\n");
      out.write("                                                <i style=\"color:white; font-size: 20px\" class=\"fa fa-user\"></i>\n");
      out.write("                                                <h5 style=\"color:white\"> ");
      out.print(user.getFullname());
      out.write("</h5>\n");
      out.write("                                            </button>\n");
      out.write("                                            <div class=\"logout\" id=\"logout\">\n");
      out.write("                                                <a style=\"color: black;\"\n");
      out.write("                                                   href=\"user?hanhDong=logout\"><i\n");
      out.write("                                                        class=\"fa-solid fa-right-from-bracket\"></i> Đăng xuất </a>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"cart box\" id=\"logout\">\n");
      out.write("                                            <a href=\"cart.jsp\">\n");
      out.write("                                                <i style=\"color:white\" class=\"fa fa-shopping-cart\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart_list.size()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</i>\n");
      out.write("                                            </a>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");

                                        }
                                    
      out.write("\n");
      out.write("                                    <!--                                    <a href=\"#\">FAQs</a>-->\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-3 col-md-3\">\n");
      out.write("                        <div class=\"header__logo\">\n");
      out.write("                            <a href=\"home\"><img src=\"img/logo.png\" alt=\"\"></a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-6 col-md-6\">\n");
      out.write("                        <nav class=\"header__menu mobile-menu\">\n");
      out.write("                            <ul>\n");
      out.write("                                <li class=\"active\"><a href=\"home\">Home</a></li>\n");
      out.write("                                <li><a href=\"shop\">Shop</a></li>\n");
      out.write("                                <li><a href=\"cart\">Cart</a></li>\n");
      out.write("                                <li><a href=\"checkout\">Check Out</a></li>\n");
      out.write("                                <li><a href=\"contact\">Contacts</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </nav>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-3 col-md-3\">\n");
      out.write("                        <div class=\"header__nav__option\">\n");
      out.write("                            <a href=\"#\" class=\"search-switch\"><img src=\"img/icon/search.png\" alt=\"\"></a>\n");
      out.write("                            <a href=\"#\"><img src=\"img/icon/heart.png\" alt=\"\"></a>\n");
      out.write("                            <a href=\"#\"><img src=\"img/icon/cart.png\" alt=\"\"> <span>0</span></a>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"canvas__open\"><i class=\"fa fa-bars\"></i></div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        <!-- Header Section End -->\n");
      out.write("        <!-- Search Begin -->\n");
      out.write("        <div class=\"search-model\">\n");
      out.write("            <div class=\"h-100 d-flex align-items-center justify-content-center\">\n");
      out.write("                <div class=\"search-close-switch\">+</div>\n");
      out.write("                <form class=\"search-model-form\">\n");
      out.write("                    <input type=\"text\" id=\"search-input\" placeholder=\"Search here.....\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Search End -->\n");
      out.write("        <!-- Js Plugins -->\n");
      out.write("        <script src=\"js/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.nice-select.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.nicescroll.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.magnific-popup.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.countdown.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.slicknav.js\"></script>\n");
      out.write("        <script src=\"js/mixitup.min.js\"></script>\n");
      out.write("        <script src=\"js/owl.carousel.min.js\"></script>\n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("        <script src=\"js/signin.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
