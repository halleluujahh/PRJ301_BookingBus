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
            table {
                text-align: center;
            }

            table th, table td {
                text-align: center;
            }

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

                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <h4>Booking Details</h4>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Bus Name</th>
                                                        <th>User Name</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>Departure Location</th>
                                                        <th>Arrival Location</th>
                                                        <th>Take Time</th>
                                                        <th>Pickup Time</th>
                                                        <th>Quantity</th>
                                                        <th>Price</th>
                                                        <th>Total Price</th>
                                                        <th>Created On</th>
                                                        <th>Status</th>
                                                        <c:if test="${not empty listBooking and listBooking[0].status ne 'Confirmed'}">
                                                        <th>Action</th>
                                                        </c:if>
                                                    </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listBooking}" var="b">
                                                    <tr>
                                                        <td>${b.name}</td>
                                                        <td>${b.username}</td>
                                                        <td>${b.phone}</td>
                                                        <td>${b.email}</td>
                                                        <td>${b.departure_location}</td>
                                                        <td>${b.arrival_location}</td>
                                                        <td>${b.take_time}</td>
                                                        <td>${b.pickup_time}</td>
                                                        <td>${b.quantity}</td>
                                                        <td>${b.price}</td>
                                                        <td>${b.total_price}</td>
                                                        <td>${b.created_on}</td>
                                                        <c:if test="${b.status eq 'Confirmed'}">
                                                            <td style="color: green">${b.status}</td>
                                                        </c:if>
                                                        <c:if test="${b.status eq 'Canceled'}">
                                                            <td style="color: red">${b.status}</td>
                                                        </c:if>
                                                        <c:if test="${b.status eq 'Progress'}">
                                                            <td style="color: #DAA520">${b.status}</td>
                                                        </c:if>
                                                        <c:if test="${b.status eq 'Progress'}">
                                                            <td>
                                                                &nbsp;
                                                                <!--Delete-->
                                                                <i class="fa fa-trash-alt fa-2x"
                                                                   style="color: #e70808"
                                                                   data-toggle="modal"
                                                                   data-target="#delete-modal"
                                                                   onclick="deleteBookingModal(${b.id})">
                                                                </i>
                                                            </td>
                                                        </c:if>    
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


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

                <!-- Delete User Modal -->
            <jsp:include page="../../common/user/dashboard/DeleteBookingModal.jsp"></jsp:include>  

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
