<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-ng-app="chequeApp" data-ng-controller="HomeController">
<head>
    <meta charset="UTF-8">
    <title>Cheque Printing System</title>

   <!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
 -->

<!-- Style css -->
<link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
	   .hero-section {
            text-align: center;
            padding: 60px 20px;
        }

        .hero-section h1 {
            font-size: 2.5rem;
        }

        .features-section ul {
            font-size: 1.1rem;
            line-height: 2rem;
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 60px;
        }

        @media (min-width: 1200px) {
            .hero-section h1 {
                font-size: 3.5rem;
            }
        }

        .cheque-image {
            max-width: 100%;
            height: auto;
            margin-top: 30px;
        }

        .btn-lg {
            padding: 12px 30px;
            font-size: 1.2rem;
        }

        .features-section li i {
            color: green;
            margin-right: 10px;
        }
	</style>
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
	

	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
 <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }
        .hero-section {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: white;
        }

        .hero-section h1 {
            font-size: 2.5rem;
        }

        .features-section ul {
            font-size: 1.1rem;
            line-height: 2rem;
            padding-left: 0;
        }

        .features-section li {
            margin-bottom: 15px;
        }

        footer {
            background-color: grey;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 60px;
        }

        @media (min-width: 1200px) {
            .hero-section h1 {
                font-size: 3.5rem;
            }
        }

        .btn-lg {
            padding: 12px 30px;
            font-size: 1.2rem;
        }

        .features-section li i {
            color: #007bff;
            margin-right: 10px;
        }

        .feature-icons {
            font-size: 1.4rem;
        }
    </style>
</head>
<body>
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
	
	<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/home.js"></script>
	
	


<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-money-check-alt"></i> Cheque Printing System
        </a>
    </div>
</nav>

<!-- Hero Section -->
<div class="container-fluid hero-section">
    <div class="container">
        <h1 class="display-5 fw-bold">
            <i class="fas fa-print"></i> Welcome to Cheque Printing
        </h1>
        <p class="lead mt-3">
            <i class="fas fa-bolt feature-icons"></i> Print cheques, manage banks, payees, and stay audit-ready
        </p>
        <button class="btn btn-light btn-lg mt-3" data-ng-click="goToLogin()">
            <i class="fas fa-right-to-bracket"></i> Login Now
        </button>
    </div>
</div>

<!-- Features Section -->
<div class="container features-section mt-5">
    <h3 class="mb-4 text-center"><i class="fas fa-star text-warning"></i> Key Features</h3>
    <div class="row">
        <div class="col-md-6">
            <ul class="list-unstyled">
                <li><i class="fas fa-user-shield"></i> Role-based login for Admin, Accountant, Signatory</li>
                <li><i class="fas fa-university"></i> Manage banks and multiple accounts securely</li>
                <li><i class="fas fa-user-friends"></i> Manage suppliers/payees with full details</li>
            </ul>
        </div>
        <div class="col-md-6">
            <ul class="list-unstyled">
                <li><i class="fas fa-file-invoice-dollar"></i> Create and track cheque records easily</li>
                <li><i class="fas fa-file-pdf"></i> Generate printable PDF cheques with signature</li>
                <li><i class="fas fa-chart-line"></i> Dashboard with cheque status and insights</li>
            </ul>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    &copy; 2025 Cheque Printing Application. All rights reserved.
</footer>


</body>
</html>
