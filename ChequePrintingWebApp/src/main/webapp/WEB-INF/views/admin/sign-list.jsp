<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="chequeApp">
<head>
<meta charset="UTF-8">
<title>Signatory List</title>
    <link href="<%=request.getContextPath()%>/resources/admin/css/style.css"
	rel="stylesheet">
	
	
	<!-- Bootstrap min css -->
	<link href="<%=request.getContextPath()%>/resources/admin/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body data-ng-controller="SignatoryController">
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
        <h3 class="text-center mb-4">Signed Person Management</h3>

    

        <!-- Add Supplier Button -->
        <div class="mb-3 text-end">
            <a href="${pageContext.request.contextPath}/signatories/add" class="btn btn-success">Add New Signatory</a>
        </div>

        <!-- Table of Suppliers -->
         <div data-ng-if="signatories.length === 0" class="alert alert-warning">No Signatories found.</div>


        <table class="table table-bordered table-hover" data-ng-if="signatories.length > 0">
               <thead class="table-dark">
                     <tr>
                <th>Name</th>
                <th>Designation</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
                </thead>
                  <tbody>
            <tr data-ng-repeat="signatory in signatories">
                <td>{{signatory.name}}</td>
                <td>{{signatory.designation}}</td>
                <td>{{signatory.active ? 'Active' : 'Inactive'}}</td>
                <td>
                <a data-ng-href="${pageContext.request.contextPath}/signatories/edit?id={{signatory.sign_id}}" class="btn btn-sm btn-primary">Edit</a>
         <button data-ng-click="deactivateSignatory(signatory.sign_id)" class="btn btn-sm btn-danger">Deactivate</button>
                     </td>
            </tr>
        </tbody>
                        
               
            </table>
       
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>