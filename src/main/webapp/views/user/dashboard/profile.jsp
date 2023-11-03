<%-- 
    Document   : profile
    Created on : Oct 21, 2023, 10:07:30 AM
    Author     : LENOVO
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .error {
                color: red;
            }
            .square-image-container {
                width: 150px;
                height: 150px;
                overflow: hidden;
            }
            .user-image-circle {
                width: 30px;
                height: 30px;
                border-radius: 50%;
                overflow: hidden;
            }

            .user-image {
                width: 100%;
                height: auto;
                display: block;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">
    </head>
    <body id="page-top">
        <jsp:include page="../../common/user/dashboard/navigationBar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="../../common/user/dashboard/sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!--Profile-->
                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <h4>Your Information</h4>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 justify-content-center">
                                            <form class="justify-content-center" action="${pageContext.request.contextPath}/dashboard?action=profile" method="POST">
                                            <!-- avatar -->
                                            <c:if test="${sessionScope.account.image != null}">
                                                <div class="form-group justify-content-center row">
                                                    <label for="image" class="col-2 col-form-label">Avatar:</label>
                                                    <div class="col-6">
                                                        <img id="image" src="${sessionScope.account.image}" alt="image" class="img-fluid rounded-3" width="150" height="150">
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- username -->
                                            <div class="form-group justify-content-center row">
                                                <label for="username" class="col-2 col-form-label">User Name:</label>
                                                <div class="col-6">
                                                    <input id="username" name="username" placeholder="" readonly class="form-control here"
                                                           type="text" value="${sessionScope.account.username}">
                                                </div>
                                            </div>
                                            <!-- Fullname -->
                                            <div class="form-group justify-content-center row">
                                                <label for="fullname" class="col-2 col-form-label">Full Name:</label>
                                                <div class="col-6">
                                                    <input id="fullname" name="fullname" placeholder="" readonly class="form-control here"
                                                           type="text" value="${sessionScope.account.firstname} ${sessionScope.account.lastname}">
                                                </div>
                                            </div>
                                            <!-- Email -->
                                            <div class="form-group justify-content-center row">
                                                <label for="email" class="col-2 col-form-label">Email:</label>
                                                <div class="col-6">
                                                    <input id="email" name="email" placeholder="" readonly class="form-control here" 
                                                           type="text" value="${sessionScope.account.email}">
                                                </div>
                                            </div>
                                            <!-- Phone -->
                                            <div class="form-group justify-content-center row">
                                                <label for="phone" class="col-2 col-form-label">Phone:</label>
                                                <div class="col-6">
                                                    <input id="phone" name="phone" placeholder="" readonly class="form-control here" 
                                                           type="text" value="${sessionScope.account.phone}">
                                                </div>
                                            </div>
                                            <!-- Address -->
                                            <div class="form-group justify-content-center row">
                                                <label for="address" class="col-2 col-form-label">Address:</label>
                                                <div class="col-6">
                                                    <input id="address" name="address" placeholder="" 
                                                           readonly class="form-control here" type="text"
                                                           value="${sessionScope.account.address}">
                                                </div>
                                            </div>

                                            <!-- Save button -->
                                            <div class="form-group justify-content-center row">
                                                <div class="offset-4 col-8">
                                                    <button class="btn btn-success" type="button" data-toggle="modal" data-target="#updateUserModal">
                                                        <i class="fas fa-plus"></i> Update Information
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                    <!-- /.container-fluid -->

                    <!-- Sticky Footer -->
                    <jsp:include page="../../common/user/dashboard/stickyFooter.jsp"></jsp:include>


                    </div>
                    <!-- /.content-wrapper -->

                </div>
                <!-- /#wrapper -->

                <!-- Scroll to Top Button-->
            <jsp:include page="../../common/user/dashboard/scrollTopButton.jsp"></jsp:include>


                <!-- Logout Modal-->
            <jsp:include page="../../common/user/dashboard/logOutModal.jsp"></jsp:include>

                <!-- Update User Modal -->
            <jsp:include page="../../common/user/dashboard/UpdateUserModal.jsp"></jsp:include>  

                <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Page level plugin JavaScript-->
            <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>
            <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>

            <!-- Demo scripts for this page-->
            <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
            <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
            <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>
            <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>


    </body>
</html>
