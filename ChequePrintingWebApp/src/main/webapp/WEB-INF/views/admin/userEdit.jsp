<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <title>Edit User</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	<!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-app="chequeApp" data-ng-controller="EditUserController" class="bg-light">


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

            <!-- Edit Form -->
            <div class="col-md-9">
                <div class="card shadow-sm mx-auto" style="max-width: 600px;">
                        <div class="card-header bg-primary text-white text-center">
                    <h4><i class="fas fa-user-edit me-2"></i>Edit User</h4>
                </div>
                    <div class="card-body">
                        <!-- <div class="alert alert-success" data-ng-show="successMessage">
                            <i class="fas fa-check-circle me-1"></i> {{ successMessage }}
                        </div> -->

                        <form name="edituserForm" novalidate>
                            <input type="hidden" name="userId" data-ng-model="user.userId" />

                            <!-- Username -->
                            <div class="mb-3">
                                <label class="form-label">Username *</label>
                                <input type="text" name="username" class="form-control" data-ng-model="user.username" placeholder="Enter Username" required>
                            <!--     <div class="text-danger" ng-show="edituserForm.username.$touched && edituserForm.username.$invalid">
                                    Username is required.
                                </div> -->
                            </div>

                            <!-- Password -->
                            <div class="mb-3">
                                <label class="form-label">Password *</label>
                                <input type="password" name="password" class="form-control" data-ng-model="user.password" placeholder="Enter Password" required>
                               <!--  <div class="text-danger" ng-show="edituserForm.password.$touched && edituserForm.password.$invalid">
                                    Password is required.
                                </div> -->
                            </div>

                            <!-- Role -->
                            <div class="mb-3">
                                <label class="form-label">Role *</label>
                                <select name="roleId" class="form-select" data-ng-model="user.roleId" data-ng-options="role.roleId as role.roleName for role in roles" required>
                                    <option value="">-- Select Role --</option>
                                </select>
                                <!-- <div class="text-danger" ng-show="edituserForm.roleId.$touched && edituserForm.roleId.$invalid">
                                    Role is required.
                                </div> -->
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label class="form-label">Status *</label>
                                <select name="active" class="form-select" data-ng-model="user.active" required>
                                    <option value="">-- Select Status --</option>
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                                <!-- <div class="text-danger" ng-show="edituserForm.active.$touched && edituserForm.active.$invalid">
                                    Status is required.
                                </div> -->
                            </div>

                            <!-- Submit -->
                            <button type="submit" class="btn btn-primary w-100" data-ng-click="updateUser($event)">
                                <i class="fas fa-save me-1"></i> Update User
                            </button>
                        </form>
                    </div>
                </div>
            </div> <!-- /col -->
        </div> <!-- /row -->
    </div> <!-- /container -->


<jsp:include page="footer.jsp" />
</body>
</html>