<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-ng-app="chequeApp">
<head>
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	  <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-controller="UserController" class="bg-light">
	<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
	
	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular-route.min.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>

 <jsp:include page="header.jsp" />

    <div class="container-fluid my-4 px-3">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 mb-3">
                <jsp:include page="leftNav.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col-md-9">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center flex-wrap">
                        <h5 class="mb-2 mb-md-0">
                            <i class="fas fa-users-cog me-2"></i> User Management
                        </h5>
                        <a href="${pageContext.request.contextPath}/users/add" class="btn btn-light btn-sm">
                            <i class="fas fa-user-plus"></i> Add User
                        </a>
                    </div>

                    <div class="card-body">
                        <div data-ng-if="users.length === 0" class="alert alert-warning text-center">
                            <i class="fas fa-exclamation-circle me-2"></i> No users found.
                        </div>

                        <div class="table-responsive" data-ng-if="users.length > 0">
                            <table class="table table-striped table-bordered text-center align-middle">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Role ID</th>
                                        <th>Role</th>
                                        <th>Active</th>
                                        <th>Deleted</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-ng-repeat="user in users">
                                        <td>{{user.userId}}</td>
                                        <td>{{user.username}}</td>
                                        <td>{{user.password}}</td>
                                        <td>{{user.roleId}}</td>
                                        <td>{{user.role}}</td>
                                        <td>
                                            <input type="checkbox" data-ng-model="user.active" data-ng-change="toggleUserActive(user)">
                                        </td>
                                        <td>
                                            <input type="checkbox" data-ng-model="user.isDeleted" data-ng-change="toggleUserDeleted(user)">
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/users/edit?id={{user.userId}}" class="btn btn-outline-primary btn-sm">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> <!-- /card -->
            </div> <!-- /col-md-9 -->
        </div> <!-- /row -->
    </div> <!-- /container-fluid -->

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>