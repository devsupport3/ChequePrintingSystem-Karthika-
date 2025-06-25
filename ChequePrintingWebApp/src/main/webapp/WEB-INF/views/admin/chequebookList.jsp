<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChequeBook List</title>
 <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng="chequeApp" data-ng-controller="ChequeBookController" ng-init="loadchequebooks()">
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
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2><i class="fas fa-book"></i> Cheque Book List</h2>
        <a href="${pageContext.request.contextPath}/chequeBooks/add" class="btn btn-primary">
            <i class="fas fa-plus-circle"></i> Add New Cheque Book
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="thead-dark">
                <tr>
                    <th><i class="fas fa-hashtag"></i> ID</th>
                    <th><i class="fas fa-university"></i> Bank Account ID</th>
                    <th><i class="fas fa-book"></i> Book Name</th>
                    <th><i class="fas fa-list-ol"></i> Series</th>
                    <th><i class="fas fa-sort-numeric-up"></i> Total Cheques</th>
                    <th><i class="fas fa-calendar-day"></i> Issue Date</th>
                    <th><i class="fas fa-info-circle"></i> Status</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="book in chequeBooks">
                    <td>{{ book.chequeBookId }}</td>
                    <td>{{ book.bankAccountId }}</td>
                    <td>{{ book.bookName }}</td>
                    <td>{{ book.seriesStart }} - {{ book.seriesEnd }}</td>
                    <td>{{ book.totalCheques }}</td>
                    <td>{{ book.issueDate | date:'yyyy-MM-dd' }}</td>
                    <td>
                        <span class="badge"
                              ng-class="{
                                  'badge-success': book.status == 'active',
                                  'badge-primary': book.status == 'used',
                                  'badge-warning': book.status == 'lost',
                                  'badge-danger': book.status == 'cancelled',
                                  'badge-secondary': !book.status
                              }">
                            {{ book.status }}
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>