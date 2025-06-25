<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<jsp:include page="header.jsp" />
<jsp:include page="leftNav.jsp" />

<script src="<%=request.getContextPath()%>/resources/admin/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/admin/js/controller/app.js"></script>
	

<!-- AdminDashBoard -->
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-5 content">
          

            <div class="mt-5">
                <div class="row">
                    <div class="col-md-5">
                        <div class="card text-white bg-primary mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Total Users</h5>
                                <p class="card-text">2</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card text-white bg-success mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Total Cheques</h5>
                                <p class="card-text">0</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card text-white bg-warning mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Pending Signatures</h5>
                                <p class="card-text">0</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>

<jsp:include page="footer.jsp" />
</body>
</html>