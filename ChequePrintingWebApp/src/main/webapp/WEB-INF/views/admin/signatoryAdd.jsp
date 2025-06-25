<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="chequeApp">
<head>
<meta charset="UTF-8">
<title>Add Signatory</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-controller="AddSignatoryController">
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
 <div class="container mt-5">
        <div class="mx-auto" style="max-width: 600px;">
            <h3 class="text-center mb-4">Add New Signatory</h3>



   <form name="addSignatoryForm"  data-ng-submit="addSignatory($event)" novalidate >
              
                <div class="mb-3">
                    <label for="name" class="form-label">Signatory Name *</label>
                        <input type="text" class="form-control" data-ng-model="signatory.name" placeholder="Enter  Name" required="required">
         
                </div>

              

                <div class="mb-3">
                    <label for="designation" class="form-label">Designation *</label>
                     <input type="text" class="form-control" data-ng-model="signatory.designation" placeholder="Enter Designation" required="required">
               
                </div>

                <div class="mb-3">
                    <label for="active" class="form-label">Status</label>
                     <select class="form-select" data-ng-model="signatory.active">
                        <option value="true">Active</option>
                        <option value="false">Inactive</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary w-100">Add Signatory</button>
            </form>

</div>
  </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>