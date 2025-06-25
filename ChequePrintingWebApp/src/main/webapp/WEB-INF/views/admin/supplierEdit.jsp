<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >

<head>
    <title>Edit Supplier</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	 <style>
         .form-label {
            font-weight: 500;
        }

        .card-header h4 {
            font-size: 1.4rem;
        }

        .form-control, .form-select {
            font-size: 0.95rem;
        }

        @media (max-width: 768px) {
            .p-4 {
                padding: 1rem !important;
            }
        }
    </style>
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-app="chequeApp" data-ng-controller="EditSupplierController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
	
	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular-route.min.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
<jsp:include page="header.jsp" />


<!-- Main Page Area -->
  <div class="d-flex flex-column flex-md-row" style="min-height: 100vh;">
        <!-- Sidebar -->
        <div class="bg-light border-end" style="min-width: 240px;">
            <jsp:include page="leftNav.jsp" />
        </div>

        <!-- Main Content -->
        <div class="flex-grow-1 p-4 bg-white">
            <div class="container">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-primary text-white text-center">
                        <h4><i class="fas fa-user-edit me-2"></i>Edit Supplier</h4>
                    </div>

                    <div class="card-body px-4">
                        <!-- Success/Error Messages -->
                   <!--      <div class="alert alert-success" data-ng-show="successMessage">
                            <i class="fas fa-check-circle me-2"></i>{{ successMessage }}
                        </div>
                        <div class="alert alert-danger" data-ng-show="errorMessage">
                            <i class="fas fa-exclamation-circle me-2"></i>{{ errorMessage }}
                        </div> -->

                        <!-- Edit Supplier Form -->
                        <form name="editsupplierForm" novalidate>
                            <input type="hidden" data-ng-model="supplier.supplierId" />

                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">First Name *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.firstName">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Last Name *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.lastName">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Company Name *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.companyName">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Contact Person *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.contactPersonName">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Email *</label>
                                    <input type="email" class="form-control" data-ng-model="supplier.email">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Mobile No *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.mobile_no">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Address Line 1 *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.addressLine1">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Address Line 2</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.addressLine2">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Address Line 3</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.addressLine3">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">City *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.city">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">State *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.state">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Zip Code *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.zipCode">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Country *</label>
                                    <input type="text" class="form-control" data-ng-model="supplier.country">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Status</label>
                                    <select class="form-select" data-ng-model="supplier.active">
                                        <option value="true">Active</option>
                                        <option value="false">Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Submit -->
                            <div class="mt-4 text-center">
                                <button type="submit" class="btn btn-primary btn-lg px-5"
                                        data-ng-click="updateSupplier($event)">
                                    <i class="fas fa-save me-2"></i>Update Supplier
                                </button>
                            </div>
                        </form>
                    </div> <!-- /.card-body -->
                </div> <!-- /.card -->
            </div> <!-- /.container -->
        </div> <!-- /.main content -->
    </div> <!-- /.wrapper -->

</body>

</html>
