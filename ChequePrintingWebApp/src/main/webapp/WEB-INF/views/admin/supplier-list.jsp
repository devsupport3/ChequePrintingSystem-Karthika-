<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-ng-app="chequeApp">
<head>
    <title>Supplier List</title>
    <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
	<style>
         
        .table-responsive {
            max-height: 70vh;
            overflow-y: auto;
        }

        th, td {
            vertical-align: middle !important;
        }

        .form-check-input {
            cursor: pointer;
        }

        .btn i {
            margin-right: 5px;
        }
        
        
        
        .card-body p {
    margin-bottom: 0.5rem;
}
    </style>
    
</head>
<body data-ng-controller="SupplierController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
	
	<!-- Main Content  -->
    <jsp:include page="header.jsp" />

    <div class="d-flex flex-column flex-md-row" style="min-height: 100vh;">
        <!-- Sidebar -->
        <div class="bg-white border-end p-2" style="min-width: 240px;">
            <jsp:include page="leftNav.jsp" />
        </div>

        <!-- Main Content -->
        <div class="flex-grow-1 content-wrapper overflow-auto">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h4 class="mb-0"><i class="fas fa-users"></i> Supplier List</h4>
                    <a href="${pageContext.request.contextPath}/suppliers/add" class="btn btn-light btn-sm">
                        <i class="fas fa-plus-circle"></i> Add Supplier
                    </a>
                </div>

                <div class="card-body p-4">
                    <!-- No Records -->
                    <div data-ng-if="suppliers.length === 0" class="alert alert-warning text-center">
                        <i class="fas fa-exclamation-circle me-2"></i> No suppliers found.
                    </div>

                    <!-- Supplier Table -->
                 <%--    <div class="table-responsive" data-ng-if="suppliers.length > 0">
                        <table class="table table-bordered table-hover align-middle text-center">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>First</th>
                                    <th>Last</th>
                                    <th>Company</th>
                                    <th>Contact</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Address 1</th>
                                    <th>Line 2</th>
                                    <th>Line 3</th>
                                    <th>City</th>
                                    <th>State</th>
                                    <th>Zip</th>
                                    <th>Country</th>
                                    <th>Active</th>
                                    <th>Deleted</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-ng-repeat="supplier in suppliers">
                                    <td>{{supplier.supplierId}}</td>
                                    <td>{{supplier.firstName}}</td>
                                    <td>{{supplier.lastName}}</td>
                                    <td>{{supplier.companyName}}</td>
                                    <td>{{supplier.contactPersonName}}</td>
                                    <td>{{supplier.email}}</td>
                                    <td>{{supplier.mobile_no}}</td>
                                    <td>{{supplier.addressLine1}}</td>
                                    <td>{{supplier.addressLine2}}</td>
                                    <td>{{supplier.addressLine3}}</td>
                                    <td>{{supplier.city}}</td>
                                    <td>{{supplier.state}}</td>
                                    <td>{{supplier.zipCode}}</td>
                                    <td>{{supplier.country}}</td>
                                    <td>
                                        <div class="form-check form-switch d-flex justify-content-center">
                                            <input class="form-check-input" type="checkbox"
                                                   data-ng-model="supplier.active"
                                                   data-ng-change="toggleSupplierActive(supplier)">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-check form-switch d-flex justify-content-center">
                                            <input class="form-check-input" type="checkbox"
                                                   data-ng-model="supplier.isdeleted"
                                                   data-ng-change="toggleSupplierDeleted(supplier)">
                                        </div>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/suppliers/edit?id={{supplier.supplierId}}"
                                           class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div> <!-- /table --> --%>
                    
                    <!-- Supplier Card View -->
<div class="row g-4" data-ng-if="suppliers.length > 0">
    <div class="col-md-6 col-lg-4" data-ng-repeat="supplier in suppliers">
        <div class="card shadow-sm border border-primary">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">
                    <i class="fas fa-user"></i> {{supplier.firstName}} {{supplier.lastName}}
                </h5>
            </div>
            <div class="card-body">
                <p><strong>ID:</strong> {{supplier.supplierId}}</p>
                <p><strong>Company:</strong> {{supplier.companyName}}</p>
                <p><strong>Contact:</strong> {{supplier.contactPersonName}}</p>
                <p><strong>Email:</strong> {{supplier.email}}</p>
                <p><strong>Mobile:</strong> {{supplier.mobile_no}}</p>
                <p><strong>Address:</strong>
                    {{supplier.addressLine1}}, {{supplier.addressLine2}}, {{supplier.addressLine3}},
                    {{supplier.city}}, {{supplier.state}} - {{supplier.zipCode}}, {{supplier.country}}
                </p>

               <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap gap-3">

    <div class="form-check form-switch d-flex align-items-center me-3">
        <label class="form-check-label me-2" for="activeToggle{{$index}}">Active</label>
        <input class="form-check-input" type="checkbox"
               id="activeToggle{{$index}}"
               data-ng-model="supplier.active"
               data-ng-change="toggleSupplierActive(supplier)">
    </div>

    <div class="form-check form-switch d-flex align-items-center me-3">
        <label class="form-check-label me-2" for="deleteToggle{{$index}}">Delete</label>
        <input class="form-check-input" type="checkbox"
               id="deleteToggle{{$index}}"
               data-ng-model="supplier.isdeleted"
               data-ng-change="toggleSupplierDeleted(supplier)">
    </div>

    <a href="${pageContext.request.contextPath}/suppliers/edit?id={{supplier.supplierId}}"
       class="btn btn-outline-primary btn-sm mt-1">
        <i class="fas fa-edit"></i> Edit
    </a>

</div>
            </div>
        </div>
    </div>
</div>
                    
                    
                    
                </div> <!-- /card-body -->
            </div> <!-- /card -->
        </div> <!-- /main content -->
    </div> <!-- /container -->



<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>