<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="chequeApp" >
<head>
<meta charset="UTF-8">
<title>Add Cheque Details </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-controller="AddChequeController">
<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
	
	
	<%-- <script src="<%=request.getContextPath()%>/resources/admin/js/angular-route.min.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>




<jsp:include page="header.jsp"/>
<div class="content-wrapper">
    <div class="sidebar">
        <jsp:include page="leftNav.jsp" />
    </div>
<div class="container mt-5" style="max-width: 600px;">
    <h3 class="mb-4 text-center">Add New Cheque Detail</h3>
  <div class="alert alert-success" data-ng-show="successMessage">{{ successMessage }}</div>
    
         <form name="addChequeForm" novalidate data-ng-submit="saveCheque()">
          

        <div class="mb-3">
            <label for="Supplier" class="form-label">Select Supplier: *</label>
   			<select data-ng-model="cheque.supplierId" 
                data-ng-options="supplier.supplierId as supplier.supplierName for supplier in suppliers" 
                data-ng-change="setPayeeName()" required>
            <option value="">-- Select Supplier --</option>
        </select>      </div>

		<!-- Auto Filled Payee Name -->
        <div class="mb-3">
            <label for="payeeName" class="form-label">Payee Name: *</label>
	<input type="text" class="form-control" data-ng-model="cheque.payeeName" readonly />
        </div>

        <div class="mb-3">
            <label for="Amount" class="form-label">Amount: *</label>
            <input type="text" class="form-control" data-ng-model="cheque.amount" placeholder="Enter Cheque Amount in Figures" required="required">
        </div>

        <div class="mb-3">
            <label for="AmountInWords" class="form-label">Amount in Words: *</label>
            <input type="text" class="form-control" data-ng-model="cheque.amountWords" placeholder="Enter Amount in Words" required="required">
        </div>
        
          <div class="mb-3">
            <label for="chequeDate" class="form-label">Cheque Date: *</label>
            <input type="date" class="form-control" data-ng-model="cheque.chequeDate"  placeholder="Enter Cheque Series Start No" required="required">
        </div>
        
          <div class="mb-3">
            <label for="chsigns" class="form-label">Select Signatories: *</label>
            <div data-ng-repeat="sign in signatories">
            <input type="checkbox" data-ng-model="sign.selected" /> {{sign.signatoryName}}
        </div>    </div>

        <div class="mb-3">
            <label for="active" class="form-label">Status</label>
            <select class="form-select" id="status" data-ng-model="cheque.status" name="status">
                <option value="issued">Issued</option>
                <option value="cancelled">Cancelled</option>
                <option value="cleared">Cleared</option>
            </select>
        </div>
        
        

        <button type="submit"  class="btn btn-primary w-100">Save Cheque</button>
    </form>
      <!-- Success/Error Messages -->
    <p style="color:green;" data-ng-if="successMessage">{{successMessage}}</p>
    <p style="color:red;" data-ng-if="errorMessage">{{errorMessage}}</p>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>