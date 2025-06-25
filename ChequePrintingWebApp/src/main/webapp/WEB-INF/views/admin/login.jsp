<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<!-- Style css -->
<link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	

 <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            background: linear-gradient(to right, #2c3e50, #34495e);
            font-family: 'Roboto', sans-serif;
            color: white;
        }

        .login-page {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 90vh;
        }

        .form {
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
            color: #2c3e50;
            max-width: 400px;
            width: 100%;
        }

        .form h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #007bff;
        }

        .form .form-group {
            margin-bottom: 20px;
        }

        .form .form-control {
            padding-left: 40px;
        }

        .form i {
            position: absolute;
            top: 12px;
            left: 12px;
            color: #007bff;
        }

        .input-icon {
            position: relative;
        }

        .btn-login {
            background: #007bff;
            color: white;
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border: none;
            border-radius: 5px;
        }

        .btn-login:hover {
            background: #0056b3;
        }

        .error {
            margin-top: 10px;
            color: red;
            text-align: center;
        }

        @media (max-width: 576px) {
            .form {
                padding: 30px 20px;
            }
        }
    </style>

</head>
 	
<body style="background-color: black;">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>

<jsp:include page="header.jsp" />

<!-- Login Section -->
<section>
    <div class="login-page"   data-ng-app="chequeApp" data-ng-controller="LoginController">
        <div class="form">
            <h2><i class="fas fa-user-lock"></i> Secure Login</h2>
            <form name="loginForm" class="login-form" data-ng-submit="login()" novalidate>
                
                <div class="form-group input-icon">
                    <i class="fas fa-user"></i>
                    <input type="text" class="form-control" id="username" data-ng-model="username" required placeholder="Username">
                </div>
                
                <div class="form-group input-icon">
                    <i class="fas fa-lock"></i>
                    <input type="password" class="form-control" id="password" data-ng-model="password" required placeholder="Password">
                </div>

                <button type="submit" class="btn-login" data-ng-click="login()">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>

                <div class="error" id="error" data-ng-bind="errorMessage"></div>
            </form>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />

</body>
</html>