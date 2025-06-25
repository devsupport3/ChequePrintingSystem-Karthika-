<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Issue Cheque </title>

<link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
	<style>
        #chequePreview {
            width: 800px;
            height: 350px;
            border: 1px dashed #ccc;
            position: relative;
            background-color: #fdfdfd;
            margin: auto;
        }

        .cheque-field {
            position: absolute;
            font-size: 14px;
            color: #000;
        }

        .label {
            font-weight: bold;
        }
    </style>
	
	
</head>
<body data-ng-app="chequeApp"  >
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
<!-- <!-- jQuery UI (must be AFTER jQuery) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<jsp:include page="header.jsp" />
<div class="d-flex flex-column flex-md-row" style="min-height: 100vh;">
    <div class="bg-white border-end p-2" style="min-width: 240px;">
        <jsp:include page="leftNav.jsp" />
    </div>
    
 <div class="container mt-4" ng-controller="IssueChequeController">
    <h3>Issue Cheque</h3>
    <form ng-submit="issueCheque()">

        <!-- Payee -->
        <div class="mb-3">
            <label>Payee Name:</label>
            <select class="form-control" ng-model="cheque.supplierId"
                    ng-options="s.supplierId as s.supplierName for s in suppliers" required>
                <option value="">-- Select Payee --</option>
            </select>
        </div>

        <!-- Bank -->
        <div class="mb-3">
            <label>Bank:</label>
            <select class="form-control" ng-model="selectedBankId"
                    ng-change="fetchChequeBooks()" 
                    ng-options="b.bankId as b.bankName for b in banks" required>
                <option value="">-- Select Bank --</option>
            </select>
        </div>

        <!-- Cheque Book -->
        <div class="mb-3">
            <label>Cheque Book:</label>
            <select class="form-control" ng-model="cheque.chequeBookId"
                    ng-options="c.bookId as c.bookName for c in chequeBooks" required>
                <option value="">-- Select Cheque Book --</option>
            </select>
        </div>

        <!-- Amount -->
        <div class="mb-3">
            <label>Amount (₹):</label>
            <input type="number" class="form-control" ng-model="cheque.amountNumeric"
                   ng-change="convertToWords()" required>
        </div>

        <!-- Amount Words -->
        <div class="mb-3">
            <label>Amount in Words:</label>
            <input type="text" class="form-control" ng-model="cheque.amountWords" readonly>
        </div>

        <!-- Date -->
        <div class="mb-3">
            <label>Cheque Date:</label>
            <input type="date" class="form-control" ng-model="cheque.chequeDate" required>
        </div>

        <!-- Submit -->
        <button type="submit" class="btn btn-primary">Issue Cheque</button>
    </form>
</div>
</div>

</body>
</html>