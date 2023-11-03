<%-- 
    Document   : schedulesTable
    Created on : Nov 1, 2023, 9:12:36 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Bus Table
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Departure Location</th>
                        <th>Arrival Location</th>
                        <th>Take Time</th>
                        <th>Pickup Time</th>
                        <th>Created On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listS}" var= "s">
                        <tr>
                            <td>${s.id}</td>
                            <td>${s.departure_location}</td>
                            <td>${s.arrival_location}</td>
                            <td>${s.take_time}</td>
                            <td>${s.pickup_time}</td>
                            <td>${s.created_on}</td>
                            <td>
                                <i class="fa fa-edit fa-2x px-2 py-2 rounded"
                                   style="color: #007BFF"
                                   data-toggle="modal"
                                   data-target="#editSchedulesModal"
                                   title="Edit Bus"
                                   onclick="editSchedulesModal('${s.id}', '${s.departure_location}', '${s.arrival_location}', '${s.take_time}', '${s.pickup_time}')">
                                </i>

                                <i class="fa fa-trash fa-2x px-2 py-2 rounded"
                                   style="color: #FF0000"
                                   data-toggle="modal"
                                   data-target="#delete-modal"
                                   title="Delete Schedules"
                                   onclick="deleteSchedulesModal(${s.id})">
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




