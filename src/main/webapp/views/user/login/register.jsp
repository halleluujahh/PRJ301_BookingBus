<%-- 
    Document   : register
    Created on : Oct 21, 2023, 10:33:22 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_1.css">

    </head>

    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                                <div class="text w-100">
                                    <h2>Welcome to register</h2>
                                    <p>Already have an account?</p>
                                    <a href="${pageContext.request.contextPath}/authen?action=login"
                                       class="btn btn-white btn-outline-white">Sign In</a>
                                </div>
                            </div>
                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign In</h3>
                                    </div>
                                </div>
                                <form class="signin-form" action="authen?action=register" method="POST">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Username</label>
                                        <input type="text" class="form-control" id="username" name="username"
                                               placeholder="Enter your username" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password"
                                               placeholder="Enter your password" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Re-enter Password</label>
                                        <input type="password" class="form-control" id="password2" name="password2"
                                               placeholder="Enter your password" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="email">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                                    </div>
                                    <div style="color:red">${error}</div>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary submit px-3">Sign Up</button>
                                    </div>
                                    <div class="form-group">
                                        <button style="" type="reset" class="form-control btn btn-warning submit px-3">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="${pageContext.request.contextPath}/js/jquery.min_1.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper_1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min_1.js"></script>
        <script src="${pageContext.request.contextPath}/js/main_1.js"></script>

    </body>

</html>
