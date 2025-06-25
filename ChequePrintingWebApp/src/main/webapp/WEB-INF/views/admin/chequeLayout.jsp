<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cheque Layout</title>
<link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
	
	 <style>
       #layoutArea {
            width: 800px;
            height: 350px;
            border: 1px dashed #ccc;
            background-color: #f9f9f9;
            position: relative;
            margin: 20px auto;
        }

        .field {
            position: absolute;
            background: #ffffffaa;
            border: 1px solid #007bff;
            padding: 4px 8px;
            cursor: move;
            font-size: 14px;
        }

        .form-section {
            max-width: 800px;
            margin: 30px auto;
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

   <div class="container form-section" ng-controller="LayoutController">
    <h3 class="mb-4"><i class="fas fa-pencil-ruler"></i> Design Cheque Layout</h3>

    <!-- Input Fields -->
    <div class="row mb-3">
        <div class="col-md-4">
            <label>Layout Name:</label>
            <input type="text" class="form-control" ng-model="layout.layoutName">
        </div>
        <div class="col-md-4">
            <label>Bank Name:</label>
           <select class="form-control"
        ng-model="layout.bankId"
        ng-options="bank.bankId as bank.bankName for bank in banks"
        ng-change="loadAccounts(layout.bankId)">
    <option value="">-- Select Bank --</option>
</select>
        </div>
        
        
       <!--  <div class="col-md-4">
            <label>Account ID:</label>
           <select class="form-control"
        ng-model="layout.accountId"
        ng-options="acc.bankAccountId as acc.accountNumber for acc in accounts">
    <option value="">-- Select Account --</option>
</select>
        </div> -->
    </div>

    <!-- Design Area -->
    <!-- Layout Design Area -->
        <div id="layoutArea">
            <div ng-repeat="field in layout.fields"
                 class="field"
                 ng-style="field.style"
                 ng-bind="field.label"
                 id="field-{{$index}}"
                 draggable-resizable>
            </div>
        </div>

    <!-- Buttons -->
    <div class="text-center">
        <button class="btn btn-outline-primary me-2" ng-click="addField()">+ Add Field</button>
        <button class="btn btn-success" ng-click="saveLayout()">Save Layout</button>
    </div>
</div>
</div>
</body>
</html>