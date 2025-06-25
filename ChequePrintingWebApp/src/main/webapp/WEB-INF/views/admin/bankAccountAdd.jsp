<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <title>Add Bank Account</title>
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
	
	
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
<body   data-ng-app="chequeApp" data-ng-controller="AddBankAccountController">
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

    <!-- Content -->
    <div class="container-fluid py-4">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 mb-3">
                <jsp:include page="leftNav.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col-md-9">
                <div class="card shadow border-0">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0"><i class="fas fa-building-columns me-2"></i> Add Bank Account</h4>
                    </div>

                    <div class="card-body px-4">
                        <!-- Success Message -->
                        <div class="alert alert-success text-center" data-ng-show="successMessage">
                            {{ successMessage }}
                        </div>

                        <!-- Add Form -->
                        <form name="addbankAccountForm" novalidate>
                            <div class="form-section-title"><i class="fas fa-id-card me-1"></i> Bank Account Details</div>

                            <div class="row g-3">

                                <div class="col-md-6">
                                    <label class="form-label">Account Number *</label>
                                    <input type="text" class="form-control" name="accountNumber" data-ng-model="bankAccount.accountNumber" required>
                                    <div class="text-danger" ng-show="addbankAccountForm.accountNumber.$touched && addbankAccountForm.accountNumber.$invalid">
                                        Account Number is required.
                                    </div>
                                </div>



									<div class="col-md-6">
    							<label class="form-label">Account Holder Name *</label>
    						<input type="text" class="form-control" name="accountHolderName" data-ng-model="bankAccount.accountHolderName" required>
   									 <div class="text-danger" ng-show="addbankAccountForm.accountHolderName.$touched && addbankAccountForm.accountHolderName.$invalid">
  							      Account Holder Name is required.
  									  </div>
									</div>

                                <div class="col-md-6">
                                    <label class="form-label">Bank Name *</label>
                                    <select class="form-select" data-ng-model="bankAccount.bankId"
                                            data-ng-options="bank.bankId as bank.bankName for bank in bankList" required>
                                        <option value="">-- Select Bank --</option>
                                    </select>
                                    <div class="text-danger" ng-show="addbankAccountForm.bankId.$touched && addbankAccountForm.bankId.$invalid">
                                        Bank Name is required.
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Branch Name *</label>
                                    <input type="text" class="form-control" data-ng-model="bankAccount.branchName" required>
                                    <div class="text-danger" ng-show="addbankAccountForm.branchName.$touched && addbankAccountForm.branchName.$invalid">
                                        Branch Name is required.
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">IFSC Code *</label>
                                    <input type="text" class="form-control" data-ng-model="bankAccount.ifscCode" required>
                                    <div class="text-danger" ng-show="addbankAccountForm.ifscCode.$touched && addbankAccountForm.ifscCode.$invalid">
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

                            <div class="mt-4 text-center">
                                <button type="submit" class="btn btn-success px-5" data-ng-click="addBankAccount($event)">
                                    <i class="fas fa-save me-1"></i> Save Account
                                </button>
                            </div>
                        </form>
                    </div> <!-- /card-body -->
                </div> <!-- /card -->
            </div> <!-- /col -->
        </div> <!-- /row -->
    </div> <!-- /container -->
</div> <!-- /layout-wrapper -->
<jsp:include page="footer.jsp"/>
</body>
</html>
