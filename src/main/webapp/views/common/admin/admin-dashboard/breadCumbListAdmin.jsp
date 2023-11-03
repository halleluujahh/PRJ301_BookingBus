<%-- 
    Document   : breadCumbListAdmin
    Created on : Oct 30, 2023, 8:59:10 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/admin/dashboard?page=view-admin">Admin</a>
    </li>
    <li class="breadcrumb-item active">All</li>
    <li class="breadcrumb-item ml-auto">
        <button class="btn btn-success my-2" type="button" data-toggle="modal" data-target="#addAdminModal">
            <i class="fas fa-plus mr-2"></i> Add Admin
        </button>
    </li>
</ol>
