<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sidebar</title>
   <style>
        .nav-link {
            padding: 10px 15px;
            color: #ffffff;
            transition: background-color 0.3s;
        }
        .nav-link:hover {
            background-color: #343a40;
            color: #ffffff;
            text-decoration: none;
        }
        .me-2 {
            margin-right: 0.5rem;
        }
    </style>
    
     <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
  </head>
<body data-ng-app="chequeApp" data-ng-controller="MainController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>  --%>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>

<%
    String role = (String) session.getAttribute("role");
%>

<aside style="width: 220px; height: calc(100vh - 60px); margin-top: 60px; position: fixed; top: 0; left: 0; background-color: #212529; color: white;">
    <nav class="nav flex-column" style="padding: 10px;">
        
        <a href="${pageContext.request.contextPath}/users/list" class="nav-link text-white">
            <i class="fas fa-users-cog me-2"></i> Users
        </a>

        <a href="${pageContext.request.contextPath}/suppliers/list" class="nav-link text-white">
            <i class="fas fa-user-tie me-2"></i> Suppliers
        </a>

        <a href="${pageContext.request.contextPath}/banks/list" class="nav-link text-white">
            <i class="fas fa-building-columns me-2"></i> Banks
        </a>

        <a href="${pageContext.request.contextPath}/bankAccounts/list" class="nav-link text-white">
            <i class="fas fa-credit-card me-2"></i> Bank Accounts
        </a>

    
        <a href="${pageContext.request.contextPath}/chequeBooks/list" class="nav-link text-white">
            <i class="fas fa-book me-2"></i> Cheque Books
        </a>
        
             <a href="${pageContext.request.contextPath}/layout/view" class="nav-link text-white">
            <i class="fas fa-money-check-alt me-2"></i> Cheque Layout
           
        </a>
        
      <!-- Cheque Submenu -->
        <div class="nav-item">
            <a class="nav-link text-white" data-bs-toggle="collapse" href="#chequeSubmenu" role="button" aria-expanded="false">
                <i class="fas fa-money-check-alt me-2"></i> Cheque
            </a>
            <div class="collapse ps-4" id="chequeSubmenu">
                <a href="${pageContext.request.contextPath}/cheque/issue" class="nav-link text-white">Issue Cheque</a>
                <a href="${pageContext.request.contextPath}/cheque/preview" class="nav-link text-white">Preview Cheque</a>
                <a href="${pageContext.request.contextPath}/cheque/print" class="nav-link text-white">Print Cheque</a>
            </div>
        </div>


        <a href="javascript:void(0);" class="nav-link text-danger mt-3" data-ng-click="logout()">
            <i class="fas fa-sign-out-alt me-2"></i> Logout
        </a>
    </nav>
</aside>

<!-- <div id="footer" style="margin-left: 220px; padding: 10px;">
    <hr>
    <p style="text-align: center;">&copy; 2025 Cheque Printing App. All rights reserved.</p>
</div> -->

</body>
</html>
