<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >

<head>
    <title>Edit Bank Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
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
        .text-danger {
            font-size: 0.875rem;
        }
        @media (max-width: 768px) {
            .p-4 {
                padding: 1rem !important;
            }
        }
    </style>
</head>
<body  data-ng-app="chequeApp" data-ng-controller="EditBankAccountController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
	
	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular-route.min.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
<jsp:include page="header.jsp"/>




<!-- Main Layout -->
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
                    <h4><i class="fas fa-building-columns me-2"></i> Edit Bank Account</h4>
                </div>

                <div class="card-body px-4">
                    <div class="alert alert-success text-center" data-ng-show="successMessage">{{ successMessage }}</div>

                    <form name="editbankAccountForm" novalidate>
                        <input type="hidden" data-ng-model="bankAccount.bankaccountId" />

                        <div class="row g-3">

                            <div class="col-md-6">
                                <label class="form-label">Account Number *</label>
                                <input type="text" class="form-control" data-ng-model="bankAccount.accountNumber" name="accountNumber" required>
                                <div class="text-danger" ng-show="editbankAccountForm.accountNumber.$touched && editbankAccountForm.accountNumber.$invalid">
                                    Account Number is required.
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Account Holder Name *</label>
                                <input type="text" class="form-control" data-ng-model="bankAccount.accountHolderName" name="accountHolderName" required>
                                <div class="text-danger" ng-show="editbankAccountForm.accountHolderName.$touched && editbankAccountForm.accountHolderName.$invalid">
                                    Account Holder Name is required.
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Bank Name *</label>
                                <select class="form-select" data-ng-model="bankAccount.bankId"
                                        data-ng-options="bank.bankId as bank.bankName for bank in bankList" required>
                                    <option value="">-- Select Bank --</option>
                                </select>
                                <div class="text-danger" ng-show="editbankAccountForm.bankId.$touched && editbankAccountForm.bankId.$invalid">
                                    Bank selection is required.
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Branch Name *</label>
                                <input type="text" class="form-control" data-ng-model="bankAccount.branchName" name="branchName" required>
                                <div class="text-danger" ng-show="editbankAccountForm.branchName.$touched && editbankAccountForm.branchName.$invalid">
                                    Branch Name is required.
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">IFSC Code *</label>
                                <input type="text" class="form-control" data-ng-model="bankAccount.ifscCode" name="ifscCode" required>
                                <div class="text-danger" ng-show="editbankAccountForm.ifscCode.$touched && editbankAccountForm.ifscCode.$invalid">
                                    IFSC Code is required.
                                </div>
                            </div>

                           
                            <div class="col-md-6">
                                <label class="form-label">Status</label>
                                <select class="form-select" data-ng-model="bankAccount.active">
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="mt-4 text-center">
                            <button type="submit" class="btn btn-primary btn-lg px-5" data-ng-click="updateBankAccount($event)">
                                <i class="fas fa-save me-2"></i> Update Account
                            </button>
                        </div>
                    </form>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /.container -->
    </div> <!-- /.main content -->
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
