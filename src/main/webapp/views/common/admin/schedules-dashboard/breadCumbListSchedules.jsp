<%-- 
    Document   : breadCumbListSchedules
    Created on : Nov 1, 2023, 9:59:56 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/admin/dashboard?page=view-schedules">Schedules</a>
    </li>
    <li class="breadcrumb-item active">All</li>
    <li class="breadcrumb-item ml-auto">
        <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addSchedulesModal">
            <i class="fas fa-plus mr-2"></i> Add Schedules
        </button>
    </li>
</ol>