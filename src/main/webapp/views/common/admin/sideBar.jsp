<%-- 
    Document   : sideBar
    Created on : Oct 9, 2023, 9:12:01 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard?page=view-bus">
            <i class="fas fa-fw fa-bus-alt"></i>
            <span>List Bus</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard?page=view-schedules">
            <i class="fas fa-fw fa-table"></i>
            <span>Schedules</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard?page=view-booking">
            <i class="fas fa-fw fa-business-time"></i>
            <span>Booking</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard?page=view-message">
            <i class="fas fa-fw fa-text-width"></i>
            <span>Message</span></a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="" id="pagesDropdown" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-user-alt"></i>
            <span>Account</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard?page=view-admin">Admin</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard?page=view-users">User</a>
        </div>
    </li>
</ul>
