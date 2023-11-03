<%-- 
    Document   : service
    Created on : Oct 20, 2023, 8:13:47 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>

            .error {
                color: red;
            }

            .wider-table {
                width: 100%;
            }

            .square-border {
                border: 1px solid #333;
                padding: 20px;
                border-radius: 15px;
                background: #fff;
                width: 72%;
                margin: 0 auto;
                text-align: center;
            }

            .form-group {
                text-align: left;
                margin-bottom: 20px;
            }

            label {
                font-weight: bold;
            }

            .btn-primary {
                margin-right: 10px;
            }

            .btn-secondary {
                background-color: #ccc;
            }

            table {
                text-align: center;
            }

            table th, table td {
                text-align: center;
            }
        </style>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Service</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">


        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <!-- Navigation Bar -->
        <jsp:include page="../../common/user/home/navigationBar.jsp"></jsp:include>

        <jsp:include page="../../common/user/service/header.jsp"></jsp:include>

        <jsp:include page="../../common/user/service/container.jsp"></jsp:include>

        <jsp:include page="../../common/user/home/footer.jsp"></jsp:include>

        <jsp:include page="../../common/user/home/logOutModal.jsp"></jsp:include>

            <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/aos.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.timepicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/google-map.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>

    </body>
</html>
