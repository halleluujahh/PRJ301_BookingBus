<%-- 
    Document   : change-password
    Created on : Oct 21, 2023, 10:06:35 AM
    Author     : LENOVO
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
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

            .error{
                color: red;
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
                                            <h4>Change Your Password</h4>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 justify-content-center">
                                            <form class="justify-content-center" action="${pageContext.request.contextPath}/dashboard?action=changepassword"
                                              method="POST"
                                              onsubmit="return validateForm(this);">
                                            <!-- Username -->
                                            <div class="form-group justify-content-center row" style="display:none">
                                                <label for="username" class="col-2 col-form-label">User Name:</label>
                                                <div class="col-6">
                                                    <input id="username" name="username" placeholder="" readonly class="form-control here"
                                                           type="text" value="${sessionScope.account.username}">
                                                </div>
                                            </div>
                                            <!-- Password -->
                                            <div class="form-group justify-content-center row">
                                                <label for="password" class="col-2 col-form-label">Password:</label>
                                                <div class="col-6">
                                                    <input id="password" name="password" placeholder=""  class="form-control here"
                                                           type="password" value="">
                                                </div>
                                            </div>
                                            <!-- New password -->
                                            <div class="form-group justify-content-center row">
                                                <label for="newPassword" class="col-2 col-form-label">New Password:</label>
                                                <div class="col-6">
                                                    <input id="newPassword" name="newPassword" placeholder="" class="form-control here" 
                                                           type="password" value="">
                                                </div>
                                                <div id="passwordErr1" class="error"></div>
                                            </div>
                                            <!-- Re enter passoword -->
                                            <div class="form-group justify-content-center row">
                                                <label for="newPassword2" class="col-2 col-form-label">Re-enter Password:</label>
                                                <div class="col-6">
                                                    <input id="newPassword2" name="re" placeholder="" 
                                                           class="form-control here" type="password"
                                                           value="">
                                                </div>
                                            </div>
                                            <!--Error-->
                                            <div class="form-group justify-content-center row">
                                                <label for="newPassword" class="col-2 col-form-label"></label>
                                                <div class="col-6">
                                                    <div id="errorDiv" style="color: red;">${error}</div> <!-- Thông báo lỗi ở đây -->
                                                    <div style="color: green;">${notice}</div> <!-- Thông báo thành công ở đây -->
                                                </div>
                                            </div>
                                            <div class="form-group justify-content-center row">
                                                <div class="offset-4 col-8">
                                                    <button name="submit" type="submit" class="btn btn-primary">Change Password</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>

                <jsp:include page="../../common/user/dashboard/stickyFooter.jsp"></jsp:include>


                </div>

            </div>

        <jsp:include page="../../common/user/dashboard/scrollTopButton.jsp"></jsp:include>


        <jsp:include page="../../common/user/dashboard/logOutModal.jsp"></jsp:include>

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

        <script>
                                                  function validateForm(form) {
                                                      const newPassword = form.newPassword.value;
                                                      const newPassword2 = form.newPassword2.value;
                                                      if (newPassword.value.length < 5) {
                                                          $('#passwordErr1').html('Password must be at least 5 characters long.');
                                                      } else if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$%^&+=]).*$/.test(newPassword)) {
                                                          $('#passwordErr1').html('Password must contain at least one letter, one number, and one special character (@#$%^&+=).');
                                                      }
                                                      var errorDiv = document.getElementById('errorDiv');
                                                      if (!errorDiv) {
                                                          errorDiv = document.createElement('div');
                                                          errorDiv.id = 'errorDiv';
                                                          errorDiv.style.color = 'red';
                                                          form.insertBefore(errorDiv, form.querySelector('button[name="submit"]'));
                                                      }
                                                      if (newPassword !== newPassword2) {
                                                          errorDiv.textContent = 'New password and re-entered password do not match !!';
                                                          return false;
                                                      } else {
                                                          errorDiv.textContent = '';
                                                          return true;
                                                      }
                                                  }
        </script>

    </body>
</html>
