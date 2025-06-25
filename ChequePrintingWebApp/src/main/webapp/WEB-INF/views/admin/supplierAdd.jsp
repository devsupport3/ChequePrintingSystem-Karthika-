
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <title>Add Supplier</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	<!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
 
        
    <style>
        .form-section-title {
            font-weight: bold;
            margin-top: 1.5rem;
            font-size: 1.1rem;
            border-bottom: 1px solid #ccc;
            padding-bottom: 0.3rem;
        }
        .text-danger {
            font-size: 0.875rem;
        }
    
    </style>
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-app="chequeApp" data-ng-controller="AddSupplierController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
	
	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular-route.min.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
	
	
	
<div class="layout-wrapper">

    <!-- Header -->
    <jsp:include page="header.jsp" />

    <!-- Main Content Area -->
    <div class="container-fluid py-4">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 mb-3">
            <jsp:include page="leftNav.jsp" />
        </div>

        <!-- Main Form Area -->
        <div class="col-md-9">
            <div class="card shadow border-0">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0"><i class="fas fa-user-plus me-2"></i> Add New Supplier</h4>
                </div>

                <div class="card-body px-4">
                    <!-- Messages -->
              <!--       <div class="alert alert-success" data-ng-show="successMessage">{{ successMessage }}</div>
                    <div class="alert alert-danger" data-ng-show="errorMessage">{{ errorMessage }}</div>
 -->
                    <!-- Supplier Form -->
                    <form name="addsupplierForm" novalidate>
                        <!-- Personal Details -->
                        <div class="form-section-title"><i class="fas fa-id-badge me-1"></i> Personal Details</div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">First Name *</label>
                                <input type="text" class="form-control" name="firstName" data-ng-model="supplier.firstName" required>
                                <div class="text-danger" ng-show="addsupplierForm.firstName.$touched && addsupplierForm.firstName.$invalid">First name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Last Name *</label>
                                <input type="text" class="form-control" name="lastName" data-ng-model="supplier.lastName" required>
                                <div class="text-danger" ng-show="addsupplierForm.lastName.$touched && addsupplierForm.lastName.$invalid">Last name is required.</div>
                            </div>
                        </div>

                        <!-- Company Details -->
                        <div class="form-section-title"><i class="fas fa-building me-1"></i> Company Details</div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Company Name *</label>
                                <input type="text" class="form-control" name="companyName" data-ng-model="supplier.companyName" required>
                                <div class="text-danger" ng-show="addsupplierForm.companyName.$touched && addsupplierForm.companyName.$invalid">Company name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Contact Person Name *</label>
                                <input type="text" class="form-control" name="contactPersonName" data-ng-model="supplier.contactPersonName" required>
                                <div class="text-danger" ng-show="addsupplierForm.contactPersonName.$touched && addsupplierForm.contactPersonName.$invalid">Contact person name is required.</div>
                            </div>
                        </div>

                        <!-- Contact -->
                        <div class="form-section-title"><i class="fas fa-envelope me-1"></i> Contact Details</div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Email *</label>
                                <input type="email" class="form-control" name="email" data-ng-model="supplier.email" required>
                                <div class="text-danger" ng-show="addsupplierForm.email.$touched && addsupplierForm.email.$invalid">Valid email is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Mobile No *</label>
                                <input type="text" class="form-control" name="mobile_no" data-ng-model="supplier.mobile_no" required>
                                <div class="text-danger" ng-show="addsupplierForm.mobile_no.$touched && addsupplierForm.mobile_no.$invalid">Mobile number is required.</div>
                            </div>
                        </div>

                        <!-- Address -->
                        <div class="form-section-title"><i class="fas fa-map-marker-alt me-1"></i> Address</div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Address Line 1 *</label>
                                <input type="text" class="form-control" name="addressLine1" data-ng-model="supplier.addressLine1" required>
                                <div class="text-danger" ng-show="addsupplierForm.addressLine1.$touched && addsupplierForm.addressLine1.$invalid">Address is required.</div>
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
                                <input type="text" class="form-control" name="city" data-ng-model="supplier.city" required>
                                <div class="text-danger" ng-show="addsupplierForm.city.$touched && addsupplierForm.city.$invalid">City is required.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">State *</label>
                                <input type="text" class="form-control" name="state" data-ng-model="supplier.state" required>
                                <div class="text-danger" ng-show="addsupplierForm.state.$touched && addsupplierForm.state.$invalid">State is required.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Zip Code *</label>
                                <input type="text" class="form-control" name="zipCode" data-ng-model="supplier.zipCode" required>
                                <div class="text-danger" ng-show="addsupplierForm.zipCode.$touched && addsupplierForm.zipCode.$invalid">Zip Code is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Country *</label>
                                <input type="text" class="form-control" name="country" data-ng-model="supplier.country" required>
                                <div class="text-danger" ng-show="addsupplierForm.country.$touched && addsupplierForm.country.$invalid">Country is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Status *</label>
                                <select class="form-select" name="active" data-ng-model="supplier.active" required>
                                    <option value="">-- Select Status --</option>
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                                <div class="text-danger" ng-show="addsupplierForm.active.$touched && addsupplierForm.active.$invalid">Status is required.</div>
                            </div>
                        </div>

                        <!-- Submit -->
                        <div class="mt-4 text-center">
                            <button type="submit" class="btn btn-primary px-5" data-ng-click="addSupplier($event)">
                                <i class="fas fa-plus-circle me-1"></i> Add Supplier
                            </button>
                        </div>
                    </form>

                </div> <!-- /card-body -->
            </div> <!-- /card -->
        </div> <!-- /col -->
    </div> <!-- /row -->
</div> <!-- /container -->

    <%-- <!-- Sticky Footer -->
    <footer>
        <jsp:include page="footer.jsp" />
    </footer> --%>
</div>
</body>

</html>
