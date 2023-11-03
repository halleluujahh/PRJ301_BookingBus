<%-- 
    Document   : breadCumb
    Created on : Oct 9, 2023, 9:12:25 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/admin/dashboard?page=view-bus">Bus</a>
    </li>
    <li class="breadcrumb-item active">All</li>
    <li class="breadcrumb-item ml-auto">
        <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addBusModal">
            <i class="fas fa-plus mr-2"></i> Add bus
        </button>
    </li>
</ol>