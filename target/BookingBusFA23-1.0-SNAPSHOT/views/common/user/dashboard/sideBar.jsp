<%-- 
    Document   : sideBar
    Created on : Oct 21, 2023, 10:05:14 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard?page=profile">
            <i class="fas fa-fw fa-person-booth"></i>
            <span>Profile</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard?page=changepassword">
            <i class="fas fa-fw fa-paragraph"></i>
            <span>Change password</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard?page=views-booking">
            <i class="fas fa-fw fa-business-time"></i>
            <span>Views My Booking</span>
        </a>
    </li>
</ul>
