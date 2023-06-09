<%@ page contentType="text/html"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/signup.css">

<title>Signup</title>
</head>

<style>
.form-group__item small {
	color: red;
}

.form-submit-btn {
	width: 100%;
}
</style>

<body>
	<%@include file="header.jsp" %>

	<%
	String error = request.getAttribute("error") + "";
	error = (error.equals("null") ? "" : error);

	String username = request.getAttribute("username") + "";
	username = (username.equals("null") ? "" : username);

	String email = request.getAttribute("email") + "";
	email = (email.equals("null") ? "" : email);

	String phonenumber = request.getAttribute("phonenumber") + "";
	phonenumber = (phonenumber.equals("null") ? "" : phonenumber);

	String address = request.getAttribute("address") + "";
	address = (address.equals("null") ? "" : address);
	%>
	<div id="signup-container">

		<div class="text-center navbar-container">
			<div>
				<a href="home"><i
					class="arrow_left ti-arrow-left"></i></a>
			</div>

			<div class="navbar_title">Đăng ký tài khoản</div>

		</div>

		<div class="login-form">
			<div class="text-center login-form__tille">Đăng ký tài khoản
				BBmember</div>

			<form class="form" action="signup" method="get">
                            <input type="hidden" name="hanhDong" value="signup" />

				<div class="form-group">

					<div class="form-group__item">
						<input type="text" class="form-group__item-button"
							placeholder="Vui lòng nhập số điện thoại(bắt buộc)" id="mobie"
							name="phonenumber" required="required" value="<%=phonenumber%>">
						<small></small> <span></span>
					</div>

					<div class="form-group__item">
						<input type="email" class="form-group__item-button"
							placeholder="Vui lòng nhập địa chỉ email(bắt buộc)" id="email"
							name="email" required="required" value="<%=email%>"> <small
							id="error"><%=error%></small> <span></span>
					</div>

					<div class="form-group__item">
						<input type="text" class="form-group__item-button"
							placeholder="Vui lòng nhập họ và tên" id="name" name="username"
							value="<%=username%>"> <small></small> <span></span>
					</div>
					<div class="form-group__item">
						<input type="text" class="form-group__item-button"
							placeholder="Vui lòng nhập địa chỉ nhận hàng" id="diaChi"
							name="address" value="<%=address%>"> <small></small> <span></span>
					</div>

					<div class="form-group__item">
						<input type="password" class="form-group__item-button"
							placeholder="Vui lòng nhập mật khẩu" id="matKhau" name="password"
							required="required" onkeyup="kiemTraMatKhau()"> <small
							id="msg"></small> <span id="msg"></span>
					</div>

					<div class="form-group__item">
						<input type="password" class="form-group__item-button"
							placeholder="Vui lòng xác nhận nhật khẩu" id="matKhauNhapLai"
							name="passwordRS" required="required" onkeyup="kiemTraMatKhau()">
						<small id="msg"></small> <span id="msg"></span>
					</div>

					<div class="group__option">
						<input type="checkbox" id="dongYDieuKhoan" name="dongYDieuKhoan"
							required="required"> <label>Tôi đồng ý với các
							điều khoản bảo mật cá nhân</label>

					</div>

					<div class="group__option">
						<input type="checkbox" id="dongYNhanMail" name="dongYNhanMail">
						<label>Đăng ký nhận bản tin khuyến mãi qua email</label>

					</div>


					<div class="items-center">
						Bạn đã có tài khoản ? <a
							href="Login.jsp">Đăng
							nhập ngay</a>
					</div>



				</div>
				<button id="signUp" type="submit" class="form-submit-btn"
					name="submit" onclick="">Đăng kí</button>
			</form>


		</div>

	</div>
	<%@include file="footer.jsp"%>
                  
</body>
</html>