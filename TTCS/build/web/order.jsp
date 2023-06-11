<%@ page import="model.user" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.OrderDAO" %>
<%@ page import="dal.DBContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
    <title>order</title>
</head>

<style>
a{
text-decoration: none;
}
</style>
<body>
<%
    user auth = (user) request.getSession().getAttribute("user");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDAO orderDao  = new OrderDAO();
        orders = orderDao.userOrders(auth.getUserId());
    }else {
        response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="card-header my-3">All Orders</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Ngày đăt hàng</th>
            <th scope="col">Tên sản phẩm</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Giá tiền</th>
            <th scope="col">Hủy đơn hàng</th>
        </tr>
        </thead>
        <tbody>

        <%
            if(orders != null){
                for(Order o:orders){%>
        <tr>
            <td><%=o.getDate() %></td>
            <td><%=o.getNamePro() %></td>
            <td><%=o.getQuantity() %></td>
            <td>$<%=o.getPrice() %></td>
            <td><a class="btn btn-sm btn-danger" href="cancelorder?id=<%=o.getOrderId()%>">Hủy đặt hàng</a></td>
        </tr>
        <%}
        }
        %>

        </tbody>
    </table>
</div>
</body>

</html>