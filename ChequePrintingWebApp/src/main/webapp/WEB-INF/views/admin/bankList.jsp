<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank List </title>
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

        </style>
</head>
<body data-ng-app="chequeApp" data-ng-controller="BankController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
	
	<jsp:include page="header.jsp" />

<div class="d-flex flex-column flex-md-row" style="min-height: 100vh;">
    <!-- Sidebar -->
    <div class="bg-white border-end p-2" style="min-width: 240px;">
        <jsp:include page="leftNav.jsp" />
    </div>

    <!-- Main Content -->
    <div class="flex-grow-1 content-wrapper overflow-auto">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0"><i class="fas fa-university"></i> Bank List</h4>
                <a href="${pageContext.request.contextPath}/banks/add" class="btn btn-light btn-sm">
                    <i class="fas fa-plus-circle"></i> Add Bank
                </a>
            </div>

            <div class="card-body p-4">
                <!-- No Records -->
                <div data-ng-if="banks.length === 0" class="alert alert-warning text-center">
                    <i class="fas fa-exclamation-circle me-2"></i> No banks found.
                </div>

                <!-- Bank Table -->
                <div class="table-responsive" data-ng-if="banks.length > 0">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Bank Name</th>
                                <th>Short Form</th>
                                <th>Active</th>
                                <th>Deleted</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="bank in banks">
                                <td>{{bank.bankId}}</td>
                                <td>{{bank.bankName}}</td>
                                <td>{{bank.shortForm}}</td>
                                <td>
                                    <div class="form-check form-switch d-flex justify-content-center">
                                        <input class="form-check-input" type="checkbox"
                                               data-ng-model="bank.active"
                                               data-ng-change="toggleActive(bank)">
                                    </div>
                                </td>
                                <td>
                                    <div class="form-check form-switch d-flex justify-content-center">
                                        <input class="form-check-input" type="checkbox"
                                               data-ng-model="bank.deleteFlag"
                                               data-ng-change="toggleDelete(bank)">
                                    </div>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/banks/edit?id={{bank.bankId}}"
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
</div> <!-- /container -->

<jsp:include page="footer.jsp" />
	
	
</body>
</html>