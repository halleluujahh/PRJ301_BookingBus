<%-- 
    Document   : breadCumbListUser
    Created on : Oct 29, 2023, 11:38:05 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/admin/dashboard?page=view-users">User</a>
    </li>
    <li class="breadcrumb-item active">All</li>
    <li class="breadcrumb-item ml-auto">
        <button class="btn btn-success my-2" type="button" data-toggle="modal" data-target="#addUserModal">
            <i class="fas fa-plus mr-2"></i> Add User
        </button>
    </li>
</ol>