<%-- 
    Document   : adminTable
    Created on : Oct 29, 2023, 6:38:48 PM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Admin Table
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Role</th>
                        <th>Created On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listA}" var= "a">
                        <tr>
                            <td>
                                <img id="image" src="${a.image}" alt="image" class="img-fluid rounded-3 user-image" width="80" height="80">
                            </td>
                            <td>${a.id}</td>
                            <td>${a.username}</td>
                            <td>${a.firstname}</td>
                            <td>${a.lastname}</td>
                            <td>${a.email}</td>
                            <td>${a.phone}</td>
                            <td>${a.address}</td>
                            <td>${a.name}</td>
                            <td>${a.created_on}</td>
                            <td>
                                <i class="fa fa-edit fa-2x px-2 py-2 rounded"
                                   style="color: #007BFF"
                                   data-toggle="modal"
                                   data-target="#editAdminModal"
                                   data-toggle="tooltip"
                                   title="Edit Admin"
                                   onclick="editAdminModal('${a.username}', '${a.firstname}', '${a.lastname}', '${a.email}', '${a.phone}', '${a.address}', '${a.image}')">
                                </i>

                                <i class="fa fa-trash fa-2x px-2 py-2 rounded"
                                   style="color: #FF0000"
                                   data-toggle="modal"
                                   data-target="#delete-modal"
                                   data-toggle="tooltip"
                                   title="Delete Admin"
                                   onclick="deleteAdminModal(${a.id})">
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
