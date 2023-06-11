<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="css/styleSignup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/access/themify-icons-font/themify-icons/themify-icons.css">

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
	<jsp:include page="header.jsp"></jsp:include>

	<%
	String error = request.getAttribute("error") + "";
	error = (error.equals("null") ? "" : error);

	String fullname = request.getAttribute("fullname") + "";
	fullname = (fullname.equals("null") ? "" : fullname);

	String email = request.getAttribute("email") + "";
	email = (email.equals("null") ? "" : email);

	String phoneNumber = request.getAttribute("phoneNumber") + "";
	phoneNumber = (phoneNumber.equals("null") ? "" : phoneNumber);

	String address = request.getAttribute("address") + "";
	address = (address.equals("null") ? "" : address);
	%>
	<script type="text/javascript">
    var fullname = document.querySelector('#name')
// trả về thẻ có id = "name"
var email = document.querySelector('#email')
var phone_number = document.querySelector('#mobie')
var button = document.querySelector('#signUp')
var password = document.querySelector('#matKhau')
var confirm_password = document.querySelector('#matKhauNhapLai')
function showError(input, message){
    let parent = input.parentElement;
    // trả về thẻ input
    let small = parent.querySelector('small')
    parent.classList.add('error')
    // thêm class error vào classList
    small.innerText = message
}
    function kiemTraMatKhau(){
		matKhau = document.getElementById("matKhau").value;
		matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
		if(matKhau!=matKhauNhapLai){
			document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
			return false;
		}else{
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}

function showSuccess(input){
    let parent = input.parentElement;
    let small = parent.querySelector('small')
    parent.classList.remove('error')
    small.innerText =''
}

function checkEmptyError(listInput){
    listInput.forEach(input => {
        input.value = input.value.trim()
        if(input.value ==""){
            isEmptyError = true;
            showError(input, 'Vui lòng điền thông tin')
        }
        else{
            showSuccess(input)
        }
        
        
    });
    
}
function checkEmail(input){
    var regEmail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if(!input.value.match(regEmail) && input.value.length > 0 ){
        showError(input, 'Vui nhap lai email')
    }
    else if(input.value.match(regEmail) && input.value.length ){
        showSuccess(input)
    }
    
}
function checkSDT(input){
    var regSDT = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    if(!input.value.match(regSDT) && input.value.length > 0){
        showError(input, 'vui long nhap lai SDT')
        
    }
    else if(input.value.match(regSDT) && input.value.length ){
        showSuccess(input)
    }
}
function checkLenghtdError(input, min, max){
    input.value = input.value.trim();
    console.log(input.value);
    if(input.value.length < min){
        showSuccess(input, `Phải có ít nhất ${min} ký tự`);
        return true;
    }
    if(input.value.length > max){
        showError(input, `Không vượt quá ${max} ký tự`);
        return true;
    }
    showSuccess(input);
    return false;
}

function checkPassword(passwordInput, confirm_passwordInput){
    if(passwordInput.value !== confirm_passwordInput.value){
        showError(confirm_passwordInput, 'MK khong trung khop')
        return true
    }
    return false
}
button.addEventListener('click',function(e){
    e.preventDefault()
    checkEmptyError([fullname,email,phone_number,password,confirm_password])
    checkEmail(email)
    checkSDT(phone_number)
    checkLenghtdError(password, 8, 12)
    checkPassword(password, confirm_password)
})

</script>
	<div id="signup-container">

		<div class="text-center navbar-container">
			<div>
				<a href="${pageContext.request.contextPath}/Servlet_home"><i
					class="arrow_left ti-arrow-left"></i></a>
			</div>

			<div class="navbar_title">Đăng ký tài khoản</div>

		</div>

		<div class="login-form">
			<div class="text-center login-form__tille">Đăng ký tài khoản
				BBmember</div>

			<form class="form" action="${pageContext.request.contextPath}/userShopping" method="get">
				<input type="hidden" name="hanhDong" value="signup" />

				<div class="form-group">

					<div class="form-group__item">
						<input type="text" class="form-group__item-button"
							placeholder="Vui lòng nhập số điện thoại(bắt buộc)" id="mobie"
							name="phoneNumber" required="required" value="<%=phoneNumber%>">
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
							placeholder="Vui lòng nhập họ và tên" id="name" name="fullname"
							value="<%=fullname%>"> <small></small> <span></span>
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



					<div class="items-center">
						Bạn đã có tài khoản ? <a
							href="login.jsp">Đăng
							nhập ngay</a>
					</div>



				</div>
				<button id="signUp" type="submit" class="form-submit-btn"
					name="submit" onclick="">Đăng kí</button>
			</form>


		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>


</html>