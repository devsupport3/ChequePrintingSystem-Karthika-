<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Layout</title>
<link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
	
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
    <div class="container mt-4" ng-controller="ViewLayoutController">
    <h3 class="mb-4"><i class="fas fa-list"></i> All Cheque Layouts</h3>

	<div  class="mb-4">
	<a href="${pageContext.request.contextPath}/layout/add" class="btn btn-light btn-sm">
                        <i class="fas fa-plus-circle"></i> Add Cheque  Layout
                    </a>
</div>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Layout Name</th>
                <th>Bank</th>
              <th>Layout JSON </th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="layout in layouts">
                <td>{{ layout.layoutId }}</td>
                <td>{{ layout.name }}</td>
                <td>{{ layout.bankId }}</td>
               <td>{{ layout.layoutJson }}</td>
                <td>
                    <a class="btn btn-sm btn-info" href="${pageContext.request.contextPath}/layout/preview?id={{layout.layoutId}}">
                        <i class="fas fa-eye"></i> Preview
                    </a>
                    <a class="btn btn-sm btn-warning" href="editLayout.jsp?id={{layout.layoutId}}">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                    <button class="btn btn-sm btn-danger" ng-click="deleteLayout(layout.layoutId)">
                        <i class="fas fa-trash"></i> Delete
                    </button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
    
    
    
    
</div>

</body>
</html>