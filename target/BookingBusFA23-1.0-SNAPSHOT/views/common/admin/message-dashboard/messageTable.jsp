<%-- 
    Document   : messageTable
    Created on : Nov 2, 2023, 12:15:42 PM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Message Table
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Account ID</th>
                        <th>Created On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listM}" var="m">
                        <tr>
                            <td>${m.name}</td>
                            <td>${m.email}</td>
                            <td>${m.subject}</td>
                            <td>${m.message}</td>
                            <c:choose>
                                <c:when test="${m.account_id == 0}">
                                    <td>&nbsp;</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${m.account_id}</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${m.created_on}</td>
                            <td>
                                <i class="fa fa-trash fa-2x px-2 py-2 rounded"
                                   style="color: #FF0000"
                                   data-toggle="modal"
                                   data-target="#delete-modal"
                                   title="Delete Message"
                                   onclick="deleteMessageModal(${m.id})">
                                </i>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>



