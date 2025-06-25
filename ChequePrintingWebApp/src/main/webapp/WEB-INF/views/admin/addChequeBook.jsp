<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Cheque Book</title>
  <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
	<style>
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body ng-app="chequeApp">
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
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4><i class="fas fa-book"></i> Add Cheque Book</h4>
        </div>
        <div class="card-body"    ng-controller="AddChequeBookController">
            <form name="chequeBookForm" novalidate >

                <!-- Bank Dropdown -->
                <div class="form-group">
                    <label class="form-label"><i class="fas fa-university"></i> Select Bank</label>
                    <select data-ng-model="book.bankId" data-ng-options="bank.bankId as bank.bankName for bank in banks"
        data-ng-change="loadAccountsByBank(book.bankId)" class="form-control">
     <option value="">-- Select Bank --</option>
		</select> 
		</div>
          
   

<div class="form-group">
    <label class="form-label">
        <i class="fas fa-credit-card"></i> Bank Account
    </label>
    <select data-ng-model="book.bankAccountId"
            data-ng-options="account.bankaccountId as account.accountNumber for account in bankAccounts"
            class="form-control">
        <option value="">-- Select Account --</option>
    </select>
</div>
                <!-- Book Name -->
                <div class="form-group">
                    <label class="form-label"><i class="fas fa-book-open"></i> Book Name</label>
                    <input type="text" class="form-control" data-ng-model="book.bookName" required/>
                </div>

                <!-- Series Start -->
                <div class="form-group">
                    <label class="form-label"><i class="fas fa-play"></i> Series Start</label>
                    <input type="text" class="form-control" data-ng-model="book.seriesStart" required/>
                </div>

                <!-- Series End -->
                <div class="form-group">
                    <label class="form-label"><i class="fas fa-stop"></i> Series End</label>
                    <input type="text" class="form-control" data-ng-model="book.seriesEnd" required/>
                </div>

                <!-- Issue Date -->
                <div class="form-group">
                    <label class="form-label"><i class="fas fa-calendar-alt"></i> Issue Date</label>
                    <input type="date" class="form-control" data-ng-model="book.issueDate" required/>
                </div>

<div class="form-group">
    <label class="form-label"><i class="fas fa-info-circle"></i> Status</label>
    <select class="form-control" data-ng-model="book.status" required>
        <option value="">-- Select Status --</option>
        <option value="active">Active</option>
        <option value="used">Used</option>
        <option value="lost">Lost</option>
        <option value="cancelled">Cancelled</option>
    </select>
</div>
                <!-- Submit Button -->
                <button type="submit" class="btn btn-success" ng-click="addChequeBook($event)">
                    <i class="fas fa-plus-circle"></i> Add Cheque Book
                </button>
            </form>
        </div>
    </div>
</div>
</div>    
    
    
   
</body>
</html>