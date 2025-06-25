
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <title>Add New User</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	 <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light" data-ng-app="chequeApp" data-ng-controller="AddUserController">

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

            <!-- Add User Form -->
            <div class="col-md-9">
                <div class="card shadow-sm mx-auto" style="max-width: 600px;">
                    <div class="card-header bg-success text-white text-center">
                        <h4><i class="fas fa-user-plus me-2"></i>Add New User</h4>
                    </div>

                    <div class="card-body">
                        <div class="alert alert-success" data-ng-show="successMessage">
                            <i class="fas fa-check-circle me-1"></i> {{ successMessage }}
                        </div>

                        <form name="adduserForm" novalidate>
                            <input type="hidden" name="action" value="create" />

                            <div class="mb-3">
                                <label class="form-label">Username *</label>
                                <input type="text" class="form-control"  name="username"   data-ng-model="user.username" placeholder="Enter Username" required="required">
                             <div class="text-danger" ng-show="adduserForm.username.$touched && adduserForm.username.$invalid">
                                    Username is required.
                                </div>
                            
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password *</label>
                                <input type="password" class="form-control" name="password" data-ng-model="user.password" placeholder="Enter Password" required="required">
                             <div class="text-danger" ng-show="adduserForm.password.$touched && adduserForm.password.$invalid">
                                    Password is required.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Role *</label>
                                <select class="form-select"   name="roleId"  data-ng-model="user.roleId" data-ng-options="role.roleId as role.roleName for role in roles" required>
                                    <option value="">-- Select Role --</option>
                                </select>
                                 <div class="text-danger" ng-show="adduserForm.roleId.$touched && adduserForm.roleId.$invalid">
                                    Role is required.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Status *</label>
                                <select class="form-select"   name="active" data-ng-model="user.active" required="required">
                                    <option value="">-- Select Status --</option>
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                                  <div class="text-danger" ng-show="adduserForm.active.$touched && adduserForm.active.$invalid">
                                    Status is required.
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100" data-ng-click="addUser($event)">
                                <i class="fas fa-plus-circle me-1"></i> Add User
                            </button>
                        </form>
                    </div>
                </div> <!-- /card -->
            </div> <!-- /col-md-9 -->
        </div> <!-- /row -->
    </div> <!-- /container -->

  
</body>
</html>
