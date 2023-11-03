<%-- 
    Document   : userTable
    Created on : Oct 29, 2023, 11:28:30 AM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        User Table
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
                    <c:forEach items="${listU}" var= "u">
                        <tr>
                            <td>
                                <img id="image" src="${u.image}" alt="image" class="img-fluid rounded-3 user-image" width="70" height="70">
                            </td>
                            <td>${u.id}</td>
                            <td>${u.username}</td>
                            <td>${u.firstname}</td>
                            <td>${u.lastname}</td>
                            <td>${u.email}</td>
                            <td>${u.phone}</td>
                            <td>${u.address}</td>
                            <td>${u.name}</td>
                            <td>${u.created_on}</td>
                            <td>
                                <i class="fa fa-edit fa-2x px-2 py-2 rounded"
                                   style="color: #007BFF"
                                   data-toggle="modal"
                                   data-target="#editUserModal"
                                   data-toggle="tooltip"
                                   title="Edit User"
                                   onclick="editUserModal('${u.username}', '${u.firstname}', '${u.lastname}', '${u.email}', '${u.phone}', '${u.address}', '${u.image}')">
                                </i>

                                <i class="fa fa-trash fa-2x px-2 py-2 rounded"
                                   style="color: #FF0000"
                                   data-toggle="modal"
                                   data-target="#delete-modal"
                                   data-toggle="tooltip"
                                   title="Delete User"
                                   onclick="deleteUserModal(${u.id})">
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

