<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cheque List </title>
 <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body  data-ng-app="chequeApp" data-ng-controller="ListChequeController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
	
	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular-route.min.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
<jsp:include page="header.jsp" />

<div class="content-wrapper">
    <div class="sidebar">
        <jsp:include page="leftNav.jsp" />
    </div>

    <div class="content-area">
        <h3 class="text-center mb-4">Cheque Management</h3>
        <div class="mb-3 text-end">
            <a href="${pageContext.request.contextPath}/cheques/add" class="btn btn-success">Add New Cheque</a>
        </div>

        <!-- Table of cheques -->
         <div data-ng-if="cheques.length === 0" class="alert alert-warning">No cheques found.</div>
  <table class="table table-bordered table-hover" data-ng-if="cheques.length > 0">
               <thead class="table-dark">
         	<tr>
                <th>Cheque ID</th>
                <th>Payee Name</th>
                <th>Amount in Figs</th>
                <th>Amount in Words</th>
                <th>Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr data-ng-repeat="cheque in cheques">
                <td>{{ cheque.chequeId }}</td>
                <td>{{ cheque.supplierName }}</td>
                <td>{{ cheque.amount }}</td>
                <td>{{ cheque.amountwords }}</td>
                <td>{{ cheque.chequeDate }}</td>
                <td>{{cheque.status}}</td>
                <td>
                    <a href="chequeEdit.jsp?id={{ cheque.chequeId }}">Edit</a> |
                    <a href="printCheque.jsp?id={{ cheque.chequeId }}" target="_blank">Print</a>
                </td>
            </tr>
        </tbody>
        </table>
        
</div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>