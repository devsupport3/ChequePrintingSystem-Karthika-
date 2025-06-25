<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html data-ng-app="chequeApp">
<head>
    <title>Add Bank</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/admin/css/style.css" rel="stylesheet">

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
</head>
<body data-ng-controller="AddBankController">

<!-- Scripts -->
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>

<div class="layout-wrapper">

    <!-- Header -->
    <jsp:include page="header.jsp" />

    <!-- Content -->
    <div class="container-fluid py-4">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 mb-3">
                <jsp:include page="leftNav.jsp" />
            </div>

            <!-- Main Form Area -->
            <div class="col-md-9">
                <div class="card shadow border-0">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0"><i class="fas fa-university me-2"></i> Add New Bank</h4>
                    </div>

                    <div class="card-body px-4">
                        <!-- Alert Messages -->
                        <!--
                        <div class="alert alert-success" data-ng-show="successMessage">{{ successMessage }}</div>
                        <div class="alert alert-danger" data-ng-show="errorMessage">{{ errorMessage }}</div>
                        -->

                        <!-- Add Bank Form -->
                        <form name="addBankForm" novalidate>
                            <div class="form-section-title"><i class="fas fa-building me-1"></i> Bank Details</div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Bank Name *</label>
                                    <input type="text" class="form-control" name="bankName" data-ng-model="newBank.bankName" required>
                                    <div class="text-danger" ng-show="addBankForm.bankName.$touched && addBankForm.bankName.$invalid">Bank name is required.</div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Short Form *</label>
                                    <input type="text" class="form-control" name="shortForm" data-ng-model="newBank.shortForm" required>
                                    <div class="text-danger" ng-show="addBankForm.shortForm.$touched && addBankForm.shortForm.$invalid">Short form is required.</div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Status *</label>
                                    <select class="form-select" name="active" data-ng-model="newBank.active" required>
                                        <option value="">-- Select Status --</option>
                                        <option value="true">Active</option>
                                        <option value="false">Inactive</option>
                                    </select>
                                    <div class="text-danger" ng-show="addBankForm.active.$touched && addBankForm.active.$invalid">Status is required.</div>
                                </div>
                            </div>

                            <!-- Submit -->
                            <div class="mt-4 text-center">
                                <button type="submit" class="btn btn-success px-5" data-ng-click="addBank($event)">
                                    <i class="fas fa-plus-circle me-1"></i> Add Bank
                                </button>
                            </div>
                        </form>

                    </div> <!-- /card-body -->
                </div> <!-- /card -->
            </div> <!-- /col -->
        </div> <!-- /row -->
    </div> <!-- /container -->
</div>

</body>
</html>
