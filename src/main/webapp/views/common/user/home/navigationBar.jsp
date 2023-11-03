<%-- 
    Document   : navigationBar
    Created on : Oct 20, 2023, 6:26:43 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Booking<span>Bus</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="service" class="nav-link">Services</a></li>
                <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        More<i class="dropdown-menu"></i>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <!--Nếu như account trên session = null => hiển thị ra nút Login va Account-->
                        <c:if test="${sessionScope.account == null}">
                            <a href="${pageContext.request.contextPath}/authen?action=login">
                                <button class="dropdown-item">Account</button>
                            </a>
                            <a href="${pageContext.request.contextPath}/authen?action=login">
                                <button class="dropdown-item">Login</button>
                            </a>
                        </c:if>
                        <!--Nếu như account trên sesson != null => hiển thị ra nút logout va ten account-->
                        <c:if test="${sessionScope.account != null}">
                            <c:if test="${sessionScope.account.roleId == 2}">
                                <a href="${pageContext.request.contextPath}/dashboard?page=profile">
                                    <button class="dropdown-item">
                                        ${sessionScope.account.username}
                                    </button>
                                </a>
                            </c:if>    
                            <c:if test="${sessionScope.account.roleId == 1}">
                                <a href="${pageContext.request.contextPath}/admin/dashboard?page=view-bus">
                                    <button class="dropdown-item">
                                        ${sessionScope.account.username}
                                    </button>
                                </a>
                            </c:if>    
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
                        </c:if>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->
