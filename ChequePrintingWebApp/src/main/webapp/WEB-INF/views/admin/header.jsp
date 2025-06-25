<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cheque Printing System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <!-- Responsive Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body data-ng-app="chequeApp" data-ng-controller="MainController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>

<!-- Header Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="<%= request.getContextPath() %>/index.jsp">
            <i class="fas fa-print me-2"></i>Cheque Printing System
        </a>

        <!-- Toggle for mobile nav -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader"
                aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Optional right-aligned content -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarHeader">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <%-- Optional Search Form --%>
                <%-- 
                <li class="nav-item me-3">
                    <form class="d-flex" action="<%= request.getContextPath() %>/search" method="get">
                        <input class="form-control form-control-sm me-2" type="search" name="query" placeholder="Search..." aria-label="Search">
                        <button class="btn btn-outline-light btn-sm" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </li>
                --%>

                <li class="nav-item me-3">
                    <a class="nav-link text-white" href="#">
                        <i class="fas fa-language me-1"></i> English
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link text-white" href="#">
                        <i class="fas fa-money-bill-wave me-1"></i> ₹ INR
                    </a>
                </li>
             <!--    <li class="nav-item me-3">
                    <a class="nav-link text-white" href="#">
                        <i class="fas fa-user-circle me-1"></i> Bhargav Bhatt
                    </a>
                </li> -->
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-light" href="javascript:void(0);"       data-ng-click="logout()">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>