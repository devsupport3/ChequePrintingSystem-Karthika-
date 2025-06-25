<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html  data-ng-app="chequeApp" >
<head>
    <title>Bank Accounts List</title>
       <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
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
</style>
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-controller="BankAccountController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
	
	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular-route.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>

	
	
<jsp:include page="header.jsp"/>
<div class="d-flex flex-column flex-md-row" style="min-height: 100vh;">
    <!-- Sidebar -->
    <div class="bg-white border-end p-2" style="min-width: 240px;">
        <jsp:include page="leftNav.jsp" />
    </div>

    <!-- Main Content -->
    <div class="flex-grow-1 content-wrapper overflow-auto">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0"><i class="fas fa-piggy-bank"></i> Bank Account List</h4>
                <a href="${pageContext.request.contextPath}/bankAccounts/add" class="btn btn-light btn-sm">
                    <i class="fas fa-plus-circle"></i> Add Account
                </a>
            </div>

            <div class="card-body p-4">
                <!-- No Records -->
                <div data-ng-if="bankAccounts.length === 0" class="alert alert-warning text-center">
                    <i class="fas fa-exclamation-circle me-2"></i> No bank accounts found.
                </div>

                <!-- Bank Account Table -->
                <div class="table-responsive" data-ng-if="bankAccounts.length > 0">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead class="table-dark">
                            <tr>
                            	<th>BankAccountId</th>
                                <th>Account No</th>
                                <th>Account Holder</th>
                                <th>Bank Name </th>
                                <th>Branch</th>
                                <th>IFSC</th>
                                <th>Active </th>
                              	<th>Delete Flag</th> 
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="account in bankAccounts">
                            	<td>{{account.bankaccountId}}</td>
                                <td>{{account.accountNumber}}</td>
                                <td>{{account.accountHolderName}}</td>
                                <td>{{account.bankName}}</td>
                                <td>{{account.branchName}}</td>
                                <td>{{account.ifscCode}}</td>
                                  <td>
                                    <div class="form-check form-switch d-flex justify-content-center">
                                        <input type="checkbox" class="form-check-input"
                                               data-ng-model="account.active"
                                               data-ng-change="toggleActive(account)">
                                    </div>
                                </td>
                                
                                <td>
                                
                                    <div class="form-check form-switch d-flex justify-content-center">
                                        <input type="checkbox" class="form-check-input"
                                               data-ng-model="account.deleteFlag"
                                               data-ng-change="toggleDelete(account)">
                                    </div>
                                </td>
                                
                                <td>
                                    <a href="${pageContext.request.contextPath}/bankAccounts/edit?id={{account.bankaccountId}}"
                                       class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                </td>
                                
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- /table -->
            </div> <!-- /card-body -->
        </div> <!-- /card -->
    </div> <!-- /main content -->
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
