<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Preview Layout</title>
<link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
	
	<style>
        .layout-card {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 1px 1px 5px #ccc;
        }
        #layoutPreview {
            width: 800px;
            height: 350px;
            border: 1px dashed #aaa;
            position: relative;
            margin: 15px auto;
            background-color: #f9f9f9;
        }
        .field {
            position: absolute;
            background: #ffffffdd;
            border: 1px solid #007bff;
            padding: 4px 8px;
            font-size: 14px;
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

    <div class="container mt-4" ng-controller="PreviewLayoutController">
        <h3><i class="fas fa-eye"></i> Preview Cheque Layouts</h3>

        <!-- <div class="layout-card" ng-repeat="layout in layouts"> -->
        
         <div class="layout-card">
      
          <input type="hidden" name="layoutId" data-ng-model="layout.layoutId" />
        
            <div class="row">
                <div class="col-md-4">
                   <!--  <strong>Layout Name:</strong> {{ layout.layoutName }}<br>
                   -->  <strong>BankID:</strong> {{ layout.bankId }}<br>
                   <!--  <strong>Account ID:</strong> {{ layout.accountId }} -->
                </div>
                <div class="col-md-8 text-end">
                    <button class="btn btn-primary btn-sm me-2" ng-click="editLayout(layout.layoutId)">
                        <i class="fas fa-edit"></i> Edit
                    </button>
                    <button class="btn btn-danger btn-sm" ng-click="deleteLayout(layout.layoutId)">
                        <i class="fas fa-trash"></i> Delete
                    </button>
                </div>
            </div>

            <div id="layoutPreview">
                       <div class="field"
             ng-repeat="field in layout.fields"
             ng-style="field.style">
            {{field.label}}
        </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>